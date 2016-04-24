<?php	
	include 'dbutilities.php';
	
	$conn = connectToDB();
	
	if(!$conn){
		$e = oci_error();
		trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
	}	
	
	$userName = $_POST['username'];
	$password = $_POST['password'];
	$name = $_POST['name'];
	$email = $_POST['email'];
	$enrolledYear = $_POST['enrolledYear'];
	$enrolledSemester = $_POST['enrolledSemester'];
	$degreeStatus = $_POST['degreeStatus'];
	$degreeType = $_POST['degreeType'];
	$role = $_POST['role'];
	$gpa = NULL;
	$hideProfile = isset($_POST['hideProfile'])? "True": "False";
	$nullValue = NULL;
	$sql = "CALL REGISTRATION(:p_username, :p_password, :p_name, :p_email, to_date(:p_year_begin, 'yyyy-mm-dd'), :p_semester_begin, :p_degree_status, :p_degree_type, :p_role, :p_gpa, :p_hide_profile)";
	$stid = oci_parse($conn, $sql);
	oci_bind_by_name($stid, ":p_username", $userName);
	oci_bind_by_name($stid, ":p_password", $password);
	oci_bind_by_name($stid, ":p_name", $name);
	oci_bind_by_name($stid, ":p_email", $email);
	oci_bind_by_name($stid, ":p_year_begin", $enrolledYear);
	oci_bind_by_name($stid, ":p_semester_begin", $enrolledSemester);
	oci_bind_by_name($stid, ":p_degree_status", $degreeStatus);
	oci_bind_by_name($stid, ":p_degree_type", $degreeType);
	oci_bind_by_name($stid, ":p_role", $role);
	oci_bind_by_name($stid, ":p_gpa", $gpa);
	oci_bind_by_name($stid, ":p_hide_profile", $hideProfile);

	$res = oci_execute($stid);
	
	$returnValue = new stdClass();
	header('Content-Type: application/json');
	$returnValue->error = $res? 0 : 1;
	echo json_encode($returnValue);
	
	oci_free_statement($stid);
	oci_close($conn);
?>