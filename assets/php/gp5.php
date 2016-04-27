<?php
    // Connect to the database
    $db = "(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=fourier.cs.iit.edu)(PORT=1521)))(CONNECT_DATA=(SID=orcl)))";
    $conn = oci_connect("stoo", "cs425", $db);

    // Error Message 
    if (!$conn) {
        $e = oci_error();
        trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
    } 
    
    
    /*********************/
    /* General Processes */
    /*********************/

    // 5. Demonstrate the process of modifying and filtering messages.
    
    // Gets the message from Javascript prompt and update database
    if(isset($_POST['submit'])){
        
        // uhhhhh escape line isn't really working here, what? ._. 
        /*$msg = oci_parse($conn, 'UPDATE THREADS SET message = :msg WHERE thread_id = :t_id');
        $ph = '\'' . $_POST["msg"] . '\'';
        echo $ph;
        oci_bind_by_name($msg, ":msg", $ph);
        oci_bind_by_name($msg, ":t_id", $_POST["t_id"]);
        oci_execute($msg, OCI_DEFAULT);
        oci_commit($conn);*/
        
        // Reloads the page 
        header('Location: /fyp/query.html');
    }

    // Search (Filtering) -- TESTING PHASE 
    // Allows case-insensitive
    // DO NOT TOUCH THIS
    if(isset($_POST['search'])){
        // SELECT thread_id, topic, message, created_by, created_when FROM THREADS WHERE message LIKE :srch
        // SELECT message FROM THREADS WHERE LOWER(message) LIKE LOWER(:srch)
        /*$res = oci_parse($conn, "SELECT message FROM THREADS");
        $srch = '\'%' . $_POST["searchMsg"] . '%\''; // % is a wildcard in SQL
        oci_bind_by_name($res, ':srch', $srch);
        oci_execute($res, OCI_DEFAULT);*/
        
        $sql = "SELECT message FROM THREADS WHERE message LIKE :srch";
        $srch = $_POST["searchMsg"] . '%\''; // % is a wildcard in SQL
        
        echo $srch;
        
        $res = oci_parse($conn, $sql);
        oci_bind_by_name($res, ':srch', $srch);
        
        oci_execute($res, OCI_DEFAULT);
        
        // Why didn't this return any results? 
        while (($row = oci_fetch_assoc($res)) != false){
            echo $_POST['searchMsg'];
            echo "<br />" . $row['MESSAGE'] . " ";
            
        }
    }

    // Filtering message: search by certain keyword 
    

    // Closes connection to database 
    oci_close($conn);
?>