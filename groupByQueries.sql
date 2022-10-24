-- Active: 1666258644915@@127.0.0.1@3306@db_university
/*Contare quanti iscritti ci sono stati ogni anno*/

SELECT COUNT(*) AS total,  YEAR(enrolment_date) AS year
FROM students
GROUP BY YEAR(enrolment_date)
ORDER BY total DESC;

/*Contare gli insegnanti che hanno l'ufficio nello stesso edificio*/
SELECT COUNT(*) AS total, office_address
FROM teachers
GROUP BY office_address
ORDER BY total DESC;

/*Calcolare la media dei voti di ogni appello d'esame*/
SELECT AVG(vote) as average, exam_id 
FROM exam_student
GROUP BY exam_id

ORDER BY average DESC;

/*Contare quanti corsi di laurea ci sono per ogni dipartimento*/
SELECT COUNT(id) as total_degrees, department_id
FROM degrees
GROUP BY department_id
ORDER BY total_degrees DESC;

