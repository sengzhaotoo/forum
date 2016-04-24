<?php
	include 'dbutilities.php';
	
	class User implements JsonSerializable{
		public $userId;
		public $userName;
		public $password;
		public $fullName;
		public $emailAddress;
		public $yearBegin;
		public $semesterBegin;
		public $degreeStatus;
		public $degreeType;
		public $gpa;
		public $role;
		public $hideProfile;
		
		public function User($row){
			$this->userId = $row->ID;
			$this->userName = $row->USERNAME;
			$this->password = $row->PASSWORD;
			$this->fullName = $row->NAME;
			$this->emailAddress = $row->EMAIL_ADDRESS;
			$this->yearBegin = $row->YEAR_BEGIN;
			$this->semesterBegin = $row->SEMESTER_BEGIN;
			$this->degreeStatus = $row->D_STATUS;
			$this->degreeType = $row->D_TYPE;
			$this->gpa = $row->GPA;
			$this->role = $row->ROLE;
			$this->hideProfile = $row->HIDE_PROFILE;
		}
		
		public function jsonSerialize(){
			return get_object_vars($this);
		}
	}
	
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
		$returnValue->data = new User($row);
		echo json_encode($returnValue);
		return;
	}
	
	// No user matched credential info, return error
	$returnValue->error = 1;
	echo json_encode($returnValue);
	
	oci_free_statement($stid);
	oci_close($conn);
?>