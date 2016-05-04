<?php
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
	
	function logUserIn($user){
		$_SESSION["currentUser"] = $user;
	}
	
	function getCurrentUser(){
		return isset($_SESSION["currentUser"])? $_SESSION["currentUser"] : NULL;
	}
	
	function logOut(){
		session_unset();
		session_destroy();
	}
?>