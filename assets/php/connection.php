<?php 
    // Connect to the database
    $db = "(DESCRIPTION=(ADDRESS_LIST=(ADDRESS=(PROTOCOL=TCP)(HOST=fourier.cs.iit.edu)(PORT=1521)))(CONNECT_DATA=(SID=orcl)))";
    $conn = oci_connect("stoo", "cs425", $db);

    // Error Message 
    if (!$conn) {
        $e = oci_error();
        trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
    } 
?>