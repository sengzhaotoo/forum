<?php
    // Connect to the database
    $db = "(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=fourier.cs.iit.edu)(PORT=1521)))(CONNECT_DATA=(SID=orcl)))";
    $conn = oci_connect("stoo", "Sengzha0", $db);

    // Error Message 
    if (!$conn) {
        $e = oci_error();
        trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
    } 
    
    // testing 
    /*$p_id = oci_parse($conn, 'SELECT id, name from PERSON');
    oci_execute($p_id, OCI_DEFAULT); 

    while (($row = oci_fetch_assoc($p_id)) != false){
        echo $row['ID'] . " " . $row['NAME'] . "<br .>";
    }*/

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
                $p_id = oci_parse($conn, 'SELECT person_id from TA WHERE person_id = :p_id AND course_id = :course_id');
                
                oci_bind_by_name($p_id, ":p_id", $_POST["p_id"]); 
                oci_bind_by_name($p_id, ":course_id", $_POST["course_id"]);
                oci_execute($p_id, OCI_DEFAULT);
                
                if(($row = oci_fetch_assoc($p_id))!=false){
                    $g_id = oci_parse($conn, 'SELECT group_id from groups WHERE course_id = :course_id');
                    
                    oci_bind_by_name($g_id, ":course_id", $_POST["course_id"]);
                    oci_execute($g_id, OCI_DEFAULT);
                    
                    $row_n = oci_fetch_assoc($g_id);
                    $group_id = $row_n['GROUP_ID'];
                    $ins = oci_parse($conn, 'INSERT ALL INTO GROUPS (group_id, moderator2) VALUES (:g_id, :p_id) SELECT * FROM DUAL');
                    
                    oci_bind_by_name($g_id, ":g_id", $group_id);
                    oci_bind_by_name($ins, ":p_id", $_POST["p_id"]);
                    oci_execute($ins, OCI_DEFAULT);
                }
            }
        }
    }

    // Closes connection to database 
    oci_close($conn);
?>