<?php
include_once 'dbconn.php';
$registrationNumber = isset($_GET['regNum']) ? $_GET['regNum'] : "";

if($registrationNumber)
{
$stmt = $conn->prepare("SELECT students.id, students.name, students.surname, students.date_of_birth, degrees.name AS 'degree_name', degrees.level FROM students
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