<?php
include_once 'dbconn.php';


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