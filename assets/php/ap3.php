<?php
    include('connection.php');  
    
    /******************************/
    /* Authorization & Privileges */
    /******************************/

    // 3.	Show that only the site wide moderator can assign moderators to an interest group/club/course.

    if(isset($_POST['submit'])) {
        // Prepares statement for execution 
        // this should look for current logged in user 
        $m_id = oci_parse($conn, 'SELECT access_level from Administrators WHERE person_id = :m_id');
        
        oci_bind_by_name($m_id, ":m_id", $_POST["m_id"]); 
        oci_execute($m_id, OCI_DEFAULT); 
        
        if (($row = oci_fetch_assoc($m_id)) != false){
            // Assumming that site wide moderators are 'root' users
            // Check if users have root access level
            if ($row['ACCESS_LEVEL'] != "root"){
                $message =  "Access level is " .  $row['ACCESS_LEVEL'] . ". You are not granted any privileges to assign moderators.";

                // Prints out alert message    
                echo "<script type='text/javascript'>alert('$message');</script>";
                
            } else {
                // Check for that person if he is TA 
                // Assign the selected person to be moderator 
                // The selected person has to be a TA/instructor 
                /*$ta_check = oci_parse($conn, 'SELECT * FROM TA WHERE person_id = '$s_id' AND course_id = '$c_id';');*/
                echo "Access level is " .  $row['ACCESS_LEVEL'] . ". You are an admin!";
                
                // Check for TA status 
                $p_id = oci_parse($conn, 'SELECT person_id from TA WHERE person_id = :p_id AND course_id = :course_id');
                
                oci_bind_by_name($p_id, ":p_id", $_POST["p_id"]); 
                oci_bind_by_name($p_id, ":course_id", $_POST["course_id"]);
                oci_execute($p_id, OCI_DEFAULT);
                
                if(($row = oci_fetch_assoc($p_id))!=false){
                    
                    $g_id = oci_parse($conn, 'SELECT group_id from groups WHERE course_id = :course_id');
                    oci_bind_by_name($g_id, ":course_id", $_POST["course_id"]);
                    oci_execute($g_id, OCI_DEFAULT);  
                    
                    if(($row_g=oci_fetch_assoc($g_id))!=false){
                        // Group ID gets its unique value 
                        $group_id = $row_g['GROUP_ID'];
                        
                        // Update 
                        /*$ins = oci_parse($conn, 'INSERT ALL INTO GROUPS (group_id, moderator2) VALUES (:g_id, :p_id) SELECT * FROM DUAL');*/
                        
                        // Query if the moderators fields are empty
                        $q = oci_parse($conn, 'SELECT moderator1, moderator2 FROM GROUPS WHERE group_id = :g_id');
                        
                        oci_bind_by_name($q, ":g_id", $group_id);
                        oci_execute($q, OCI_DEFAULT); 
                        
                        $row=(oci_fetch_assoc($q));
                        if ($row['MODERATOR1'] == NULL ){
                            $ins = oci_parse($conn, 'UPDATE GROUPS SET moderator1 = :p_id WHERE group_id = :g_id');

                            oci_bind_by_name($ins, ":p_id", $_POST["p_id"]);
                            oci_bind_by_name($ins, ":g_id", $group_id);
                            oci_execute($ins);    
                        } else if ($row['MODERATOR2'] == NULL){
                            $ins = oci_parse($conn, 'UPDATE GROUPS SET moderator2 = :p_id WHERE group_id = :g_id');

                            oci_bind_by_name($ins, ":p_id", $_POST["p_id"]);
                            oci_bind_by_name($ins, ":g_id", $group_id);
                            oci_execute($ins);    
                        } else {
                            echo "It's impossible to assign more than 2 moderators.";
                        }
                        
                        // Commits
                        $c = oci_commit($conn);
                        if (!$c){
                            echo "Trouble committing.";
                        }
                    }
                } else {
                    $message =  "You are not a teaching assistant for course " .  $_GET['course_id'] ;

                    // Prints out alert message    
                    echo "<script type='text/javascript'>alert('$message');</script>";
                }
            }
        }
    }

    // Closes connection to database 
    oci_close($conn);
?>