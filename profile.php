<?php
    function display() {
        echo $_POST["studentname"];
    }
    
    if(isset($_POST['submit'])) {
        display();
    } 
?>