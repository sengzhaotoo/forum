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

    // 5. Demonstrate the process of modifying and filtering messages.
    
    // First, query the message and display
    $sort = 'ASC'; 

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
        
    } 

    



    // Then allow it to be modified (need a button or something)
    // Modification should be having a popup textarea 

    // Filtering (based on criteria – top 5, latest)

    // Closes connection to database 
    oci_close($conn);
    /*header('Location: /fyp/profile.html');*/
?>