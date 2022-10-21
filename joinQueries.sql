
/*Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia*/
SELECT students.*, degrees.name as 'degree_name'
FROM students
INNER JOIN degrees
ON students.degree_id = degrees.id
WHERE
degrees.name LIKE "%laurea in economia";

/*Selezionare tutti i Corsi di Laurea Magistrale del Dipartimento di Neuroscienze*/
SELECT *, departments.name as "department_name"
FROM degrees
INNER JOIN departments
ON department_id = departments.id
WHERE
departments.name LIKE "%Neuroscienze" AND degrees.level = "Magistrale";

/*Selezionare tutti i corsi in cui insegna Fulvio Amato*/
SELECT *
FROM courses
INNER JOIN course_teacher
ON courses.id = course_teacher.course_id
INNER JOIN teachers
ON course_teacher.teacher_id = teachers.id
WHERE
teachers.id = 44;

/*Selezionare tutti gli studenti con i dati relativi al corso di laurea 
a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome*/
SELECT *
FROM students
INNER JOIN degrees
ON degree_id = degrees.id
INNER JOIN departments
ON degrees.department_id = departments.id
ORDER BY students.name, students.surname ASC;

/*Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti*/
SELECT degrees.name as "degree_name", courses.name as "course_name", teachers.name as "teacher_name", teachers.surname as "teacher_surname"
FROM degrees
INNER JOIN courses
ON department_id = courses.id
INNER JOIN course_teacher
ON courses.id = course_teacher.course_id
INNER JOIN teachers
ON course_teacher.teacher_id = teachers.id;
ORDER BY degrees.name DESC;


/*Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica*/
SELECT teachers.*
FROM teachers
INNER JOIN course_teacher
ON teachers.id =course_teacher.teacher_id
INNER JOIN courses
ON course_teacher.course_id = courses.id
INNER JOIN degrees
ON courses.degree_id = degrees.id
INNER JOIN departments
ON degrees.id = departments.id
WHERE 
departments.name LIKE "%matematica";

/*BONUS: Selezionare per ogni studente quanti tentativi d’esame 
ha sostenuto per superare ciascuno dei suoi esami*/
SELECT COUNT(exam_id) as "attempt", students.name, students.surname
FROM exam_student
INNER JOIN students
ON exam_student.student_id = students.id
GROUP BY exam_student.student_id;
