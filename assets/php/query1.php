<?php
	include 'dbutilities.php';
	
	$conn = connectToDB();
	
	if(!$conn){
		$e = oci_error();
		trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
	}

	$groupId = $_GET['groupid'];
	$sql = "select f.forum_title, t.message, p.name, t.created_when from forums f, threads t, person p
		where f.forum_id = t.forum_id
		and f.group_id = :group_id
		and p.id = t.created_by
		and rownum <= 5
		order by t.created_when desc";

	$stid = oci_parse($conn, $sql);
	oci_bind_by_name($stid, ":group_id", $groupId);
	oci_execute($stid);
	
	echo "<table> 
			<thead>
				<tr><th>Forum Title</th><th>Thread Message</th><th>Thread Posted By</th><th>Thread Created When</th></tr>
			</thead>
			<tbody>";
		  
		  
	while($row = oci_fetch_object($stid)){		
		echo "<tr>";
		echo "<td>".$row->FORUM_TITLE."</td>";
		echo "<td>".$row->MESSAGE."</td>";
		echo "<td>".$row->NAME."</td>";
		echo "<td>".$row->CREATED_WHEN."</td>";
		echo "</tr>";
	}
	echo "</tbody></table>";
	oci_free_statement($stid);
	oci_close($conn);
?>



