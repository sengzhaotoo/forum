<?php 
    // Connect to the database
    $db = "(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=fourier.cs.iit.edu)(PORT=1521)))(CONNECT_DATA=(SID=orcl)))";
    $conn = oci_connect("stoo", "Sengzha0", $db);

    // Error Message 
    if (!$conn) {
        $e = oci_error();
        trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
    } 
    
    /*********************/
    /* General Processes */
    /*********************/

    // 3. Demonstrate the process of assigning a TA to a course and the assignment will fail if the person is also a student of the course.

    if(isset($_POST['submit'])) {
        // Prepares statement for execution 
        // Check for current logged in user's privilege 
        $m_id = oci_parse($conn, 'SELECT ROLE from PERSON WHERE id = :m_id');
        
        oci_bind_by_name($m_id, ":m_id", $_POST["m_id"]); 
        oci_execute($m_id, OCI_DEFAULT); 
        
        $row = oci_fetch_assoc($m_id);
        // Only allow Admin, Professor & Asst Professor to assign TA 
        if ($row['ROLE'] == 'Professor' || $row['ROLE'] == 'Assistant Professor' || $row['ROLE'] == 'Admin'){
            $p_id = oci_parse($conn, 'SELECT course_id FROM TAKES WHERE person_id = :p_id AND course_id = :course_id');
            
            oci_bind_by_name($p_id, ":p_id", $_POST["p_id"]);
            oci_bind_by_name($p_id, ":course_id", $_POST["course_id"]);
            oci_execute($p_id, OCI_DEFAULT);
            
            if(($row = oci_fetch_assoc($p_id))!=false){
                // Selected student is a student for the course 
                $message =  "Select student is a student for course " .  $row['COURSE_ID'] . ". It is impossible to assign a student undertaking a course to be a TA.";

                // Prints out alert message
                echo "<script type='text/javascript'>alert('$message');</script>";
            } else {
                // Assign student to be TA 
                
                $ta = oci_parse($conn, 'INSERT ALL INTO TA(person_id, course_id) VALUES (:person_id, :course_id) SELECT * FROM DUAL');
                oci_bind_by_name($ta, ":person_id", $_POST["p_id"]);
                oci_bind_by_name($ta, ":course_id", $_POST["course_id"]);
                oci_execute($ta, OCI_DEFAULT);
            }
        } else {
            $message =  "You are a(n) " . $row['ROLE'] . ". You are not granted any privileges to assign TA to course.";

            // Prints out alert message
            echo "<script type='text/javascript'>alert('$message');</script>";
        }
    }

    oci_commit($conn); 
    if(!$conn){
        $message =  "Error Committing";

        // Prints out alert message
        echo "<script type='text/javascript'>alert('$message');</script>";
    } else {
        $message =  "Teaching Assistant assigned! Thank you!";
        // Prints out alert message
        echo "<script type='text/javascript'>alert('$message');</script>";
        
        // Closes connection to database 
        oci_close($conn);     
        header('Location: /fyp/profile.html');
    }
?>