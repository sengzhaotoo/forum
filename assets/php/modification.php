<?php
    require('connection.php');

    // This PHP file focuses on Inserting, Updating and Deleting the database 

    /****************/
    /* MODIFICATION */
    /****************/

    // If submit button is pressed 
    if(isset($_POST['submit'])){
        if($_POST['sql']!=NULL || $_POST['sql']!=''){
            $query = $_POST['sql'];
            $stdid = oci_parse($conn, ":query");
            oci_bind_by_name($stdid, ":query", $query);
            
            if (oci_execute($stdid, OCI_DEFAULT)){
                if(oci_commit($conn)){
                    $message =  "Statement executed and committed.";

                    // Prints out alert message
                    echo "<script type='text/javascript'>alert('$message');</script>";
                }
            } else {
                $message =  "Please make sure correct syntax are used.";

                // Prints out alert message
                echo "<script type='text/javascript'>alert('$message');</script>";
            }
            
            
        } else{
            $message =  "Please make sure SQL statement is entered.";
            
            // Prints out alert message
            echo "<script type='text/javascript'>alert('$message');</script>";
        }
    } 


?>