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

$studentId = isset($_GET['studId']) ? $_GET['studId'] : "";

if($studentId)
{
$stmt = $conn->prepare("SELECT vote, courses.name, courses.cfu
FROM exam_student
INNER JOIN exams
ON exam_student.exam_id = exams.id
INNER JOIN courses
ON courses.id = exams.course_id
WHERE student_id = ?");

$stmt-> bind_param("s", $studentId );
$stmt-> execute();
$result = $stmt-> get_result();
if($result->num_rows >0) {
   echo  json_encode($result->fetch_all(MYSQLI_ASSOC)); 
}
else 
echo json_encode("nessuna riga");
}
else echo json_encode("nostudent id");

$conn -> close();