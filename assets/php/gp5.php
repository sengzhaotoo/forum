<?php
    include('connection.php'); 
    
    /*********************/
    /* General Processes */
    /*********************/

    // 5. Demonstrate the process of modifying and filtering messages.
    
    // Edit Message 
    

    if(isset($_GET['sorting'])){
        if($_GET['sorting']=='ASC'){
            $sort = 'DESC';
        } else if($_GET['sorting']=='DESC') {
            $sort = 'ASC';
        } else {
            echo $_GET['sorting'] . "Sort is not working";
        }
        
        if($_GET['field'] == 'title'){
            $field = 'title';
        } elseif ($_GET['field'] == 'message'){
            $field = 'message';
        } elseif ($_GET['field'] == 'createdBy'){
            $field = 'createdBy';
        } elseif ($_GET['field'] == 'timeCreated'){
            $field = 'timeCreated';
        }
        
        $stdid = oci_parse($conn, 'SELECT t.topic, t.message, t.created_by, t.created_when FROM THREADS t ORDER BY :field :sort');
        oci_bind_by_name($stdid, ":field", $field);
        /*oci_bind_by_name($stdid, ":sort", $sort);  // this has problem idk why*/
    } else {
        echo "this works!";
    }

    // Filtering message: search by certain keyword 
        
$stdid = oci_parse($conn, 'SELECT message, created_by, created_when FROM THREADS WHERE ');
        oci_bind_by_name($stdid, ":field", $field);
    


    // Then allow it to be modified (need a button or something)
    // Modification should be having a popup textarea 

    // Filtering (based on criteria – top 5, latest)

    // Closes connection to database 
    oci_close($conn);
    /*header('Location: /fyp/profile.html');*/
?>