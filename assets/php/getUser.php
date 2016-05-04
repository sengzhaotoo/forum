<?php
	include 'dbutilities.php';
	include 'userManager.php';
	
	session_start();	
	
	$conn = connectToDB();
	if(!$conn){
		$e = oci_error();
		trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
	}	
	
	$userid = $_POST['username'];
	$password = $_POST['password'];
	
	$stid = oci_parse($conn, "SELECT * from PERSON where USERNAME = '".$userid."' and PASSWORD = '".$password."'");
	oci_execute($stid);
	$returnValue = new stdClass();
	header('Content-Type: application/json');
	
	// if there is a matching user, return user info
	while($row = oci_fetch_object($stid)){		
		$returnValue->error = 0;
		$user = new User($row);
		$returnValue->data = $user;
		logUserIn($user);
		echo json_encode($returnValue);
		return;
	}
	
	// No user matched credential info, return error
	$returnValue->error = 1;
	echo json_encode($returnValue);
	
	oci_free_statement($stid);
	oci_close($conn);
?>