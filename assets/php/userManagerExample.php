<?php
	include 'userManager.php';
	session_start(); // make sure to call this on in the beginning of the page you are accessing session variable
	
	$currentUser = getCurrentUser();

	if(!$currentUser) echo "No one logged in";
	else{
		echo "logged in user name: ".$currentUser->userName;
	}
?>