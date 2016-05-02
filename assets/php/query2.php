<?php
	include 'dbutilities.php';
	
	$conn = connectToDB();
	
	if(!$conn){
		$e = oci_error();
		trigger_error(htmlentities($e['message'], ENT_QUOTES), E_USER_ERROR);
	}

	$personId = $_GET['personId'];
	$sql = "select f.forum_title, t.message, p.name, g.name as group_name, t.created_when from forums f, threads t, person p, persontogroup p2g, groups g
		where p2g.person_id = :person_id
		and g.group_id = p2g.group_id
		and f.group_id = g.group_id
		and f.forum_id = t.forum_id
		and p.id = t.created_by
		and rownum <= 5
		order by t.created_when desc";

	$stid = oci_parse($conn, $sql);
	oci_bind_by_name($stid, ":person_id", $personId);
	oci_execute($stid);
	
	echo "<table> 
			<thead>
				<tr><th>Group Name</th><th>Forum Title</th><th>Thread Message</th><th>Thread Posted By</th><th>Thread Created When</th></tr>
			</thead>
			<tbody>";
		  
		  
	while($row = oci_fetch_object($stid)){		
		echo "<tr>";
		echo "<td>".$row->GROUP_NAME."</td>";
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