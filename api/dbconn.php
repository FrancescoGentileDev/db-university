<?php
define("DB_SERVERNAME", "localhost:3306");
define("DB_USERNAME", "root");
define("DB_PASSWORD", "root");
define("DB_NAME", "db_university");
header("content-type: application/json");
$conn = new mysqli(DB_SERVERNAME, DB_USERNAME, DB_PASSWORD,DB_NAME);
if($conn && $conn-> connect_error) {
	echo "connection failed: " . $conn-> connect_error;
}
?>