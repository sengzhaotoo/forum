<?php 
    class testing{
        
        public function test(){
            echo "<br />" "test test test!";
            return true; 
        }
    }
    echo "hello worlds";
    $test1 = new testing; 

    $test1->test(); 

    // example 
    $db = "(DESCRIPTION=(ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = fourier.cs.iit.edu)(PORT = 1521)))(CONNECT_DATA=(SID=orcl)))";
    // $conn = oci_connect('root', 'root', 'localhost/XE');

    /*if ($c=OCILogon(“stoo”, “Sengzha0“, $db)) {
        echo “Successfully connected to Oracle.\n”;
        OCILogoff($c);
    }*/




    /*if (!$conn) {
        $e = oci_error();
        trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
    } else {
        echo "uh...";
    }*/
?>