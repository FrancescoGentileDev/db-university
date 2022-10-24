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

$registrationNumber = isset($_GET['regNum']) ? $_GET['regNum'] : "";

if($registrationNumber)
{
$stmt = $conn->prepare("SELECT students.*, degrees.name AS 'degree_name', degrees.level FROM students
INNER JOIN degrees
ON degrees.id = students.degree_id
WHERE registration_number = ?");
$stmt-> bind_param("s", $registrationNumber );
$stmt-> execute();
$result = $stmt-> get_result();
if($result->num_rows ===1) {
   echo  json_encode($result->fetch_assoc()); 
}
else 
echo false;
}
else echo false;

$conn -> close();