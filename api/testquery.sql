-- Active: 1666258644915@@127.0.0.1@3306@db_university

SELECT students.*, degrees.name AS 'degree_name', degrees.level FROM students
INNER JOIN degrees
ON degrees.id = students.degree_id
WHERE
registration_number = 620033