<?php
	function connectToDB(){
		$db = "(DESCRIPTION =
		(ADDRESS = (PROTOCOL = TCP)(HOST = fourier.cs.iit.edu)(PORT = 1521))
		(CONNECT_DATA =
		  (SERVER = DEDICATED)
		  (SID = orcl)
		)
		)";
		return oci_connect('', '', $db);
	}
?>