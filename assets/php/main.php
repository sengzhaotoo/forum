<?php
    // Connect to the Database 
    echo "hello";
    // example 
    $db = "(DESCRIPTION=(ADDRESS_LIST = (ADDRESS = (PROTOCOL = TCP)(HOST = fourier.cs.iit.edu)(PORT = 1521)))(CONNECT_DATA=(SID=orcl)))";
    $conn = oci_connect('stoo', '', $db);

    // Error Message 
    if (!$conn) {
        $e = oci_error();
        trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
    }

    // By blocks – preferably used for PL/SQL procedures/functions/triggers 
    /*$sql = file_get_contents('procedures.sql');
    $block = <<<_SQL
    BEGIN 
        $sql 
    END; 
    _SQL; 

    $stmt = oci_parse($conn, $block); // Statement per block
    oci_execute($stmt);
    */

    class Person{
        public  $name, 
                $id,
                $username,
                $email_address,
                $year_begin,
                $d_status,
                $d_type, 
                $gpa, 
                $role, 
                $hide_profile = false; // Profile visible to everyone by default
        
        function __construct($name, $id, $year_begin){
            $this->name = $name; 
            $this->id   = $id; 
            $this->year_begin = $year_begin; 
        }
        
        function hide_profile($id){
            $hide_profile = true;
            $sql = oci_fetch_array()"SELECT * FROM PERSON WHERE id = $id";
            
        }
        
        function queryTA(){
            $id = oci_parse($conn, "SELECT id, course_id from FROM TA WHERE id = '".$_SESSION['id']."';")
            oci_execute($id); 
            
            $sql = "SELECT * FROM TA WHERE id = $id AND course_id = $course_id";
            if(count($sql)>=1){
                // Applicable to be a moderator for course 
                $moderator_status = true; 
                // Code goes here
                // ... 
            } else {
                $err_msg = "You are not eligible to be a moderator for course $course_id";
                echo "<script  type='text/javascript'> alert('$err_message') </script>";
            }  
        }
        
    }

    class Query{
        
        // Show top 5 most discussions/comments from a specific interest group
        function specific_discussion(){
            
            // First, we need to know which specific group, then which forum, and the select top5 threads
            $stdid = oci_parse($conn, 'SELECT * FROM GROUP WHERE GROUP_ID = ');
            'SELECT TOP 5 message FROM THREADS WHERE FORUM_ID = _____ GROUP BY THREAD_ID ORDER BY MAX(CREATED_WHEN) DESC ';
            // Figure out how to get the current group / forum we're in 
            
            while(($row = oci_fetch_array($stdid, OCI_ASSOC)) != false){
                
            }
            $results_arr = array(); 
            while($row = mysql_fetch_assoc($forum_id)){
                $array[] = $row; 
            }
            
        }
        
        // Shows average past GPA taught by a faculty 
        function course_desc(){
            
            // SQL = SELECT instructor, course_id, AVG(avg_pastGPA) FROM COURSE;
            $stdid = oci_parse($conn, 'SELECT instructor, course_id, AVG(avg_pastGPA) FROM COURSE ;'); 
            while (($row = oci_fetch_array($stdid, OCI_ASSOC)) != false){
                echo $row['instructor'] . "<br />";
                echo $row['course_id'] . "<br />";
                echo $row['avg_pastGPA'] . "<br />";
            }
            
            oci_free_statement($stdid); 
        }
        
        // Shows the most commented group/course 
        function most_commented(){
            $stdid = oci_parse($conn, 'select grp.group_id from group grp, forum f, threads td 
                    where f.forum_id = td.forum_id
                    group by (group_id)
                    max(td.forum_id);');
            while(($row = oci_fetch_array($stdid, OCI_ASSOC)) != false){
                echo $row['group_id'] . "<br />";
            }
         
        function test(){
            $stdid = oci_prase($conn, 'select class_id from familypackage'); 
            while(($row = oci_fetch_array($stdif, OCI_ASSOC)) != false){
                echo $row['class_id'] . "<br />";
            }
        }    
        
        oci_free_statement($stdid); 
        }
    }

    class Authorization {
        function assign_moderator(){
            $stdid = oci_parse($conn, 'SELECT person_id from Administrators WHERE person_id = '".$_SESSION['id']."';');
            (if ($row = oci_fetch_array($stdid, OCI_ASSOC)) )
        }
    }
    
    public function test1(){
        echo "hello";
    }

    test1(); 
    $person1 = new Query;
    echo $person1->test(); 
    echo '<script language="javascript">';
    echo 'alert("message successfully sent")';
    echo '</script>';
    echo "hello";
    
    // To edit comment 
    // In link, call function, function should receive the message as a parameter, 'UPDATE'/'INSERT' into database 


    // Close connection to DB
    oci_close($conn); 
?>



