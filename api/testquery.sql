-- Active: 1666258644915@@127.0.0.1@3306@db_university

SELECT 

 exam_student.vote as "exam_student_vote", exam_student.exam_id, courses.name 
FROM students
INNER JOIN degrees
ON degrees.id = students.degree_id
INNER JOIN departments
ON departments.id = degrees.department_id
INNER JOIN courses
ON courses.degree_id = degrees.id
INNER JOIN exams
ON exams.course_id = courses.id
LEFT JOIN exam_student
ON exam_student.student_id = students.id
WHERE 
registration_number = 620033
GROUP BY exam_id, exam_student_vote, courses.name