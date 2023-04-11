CREATE DATABASE skypro;
\c skypro;
CREATE TABLE employee(
                         id BIGSERIAL NOT NULL PRIMARY KEY,
                         first_name VARCHAR(50) NOT NULL,
                         last_name VARCHAR(50) nOT NULL,
                         gender VARCHAR(6) NOT NULL,
                         age INT NOT NULL
);
SELECT * FROM employee;
INSERT INTO employee (
    first_name, last_name, gender, age)
VALUES ('Ivan', 'Ivanov', 'man', 32);
INSERT INTO employee (
    first_name, last_name, gender, age)
VALUES ('Nikita', 'Chinko', 'man', 22);
INSERT INTO employee (
    first_name, last_name, gender, age)
VALUES ('Kirill', 'Chinko', 'man', 10);
SELECT * FROM employee;
UPDATE employee SET first_name = 'Roman', last_name = 'Gerasimov', age = 20 WHERE first_name = 'Ivan';
SELECT * FROM employee;
DELETE FROM employee WHERE id = 1;
SELECT * FROM employee;
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Ivan', 'Ivanov', 'male', 19);
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Petr', 'Rakov', 'male', 33);
INSERT INTO employee (first_name, last_name, gender, age)
VALUES ('Zlata', 'Kong', 'female', 18);
SELECT *
FROM employee;
SELECT first_name AS Имя, last_name AS Фамилия
FROM employee;
SELECT * FROM employee
WHERE age < 30
   OR age > 50;
SELECT * FROM employee
WHERE age BETWEEN 30 and 50;
SELECT * FROM employee
ORDER BY last_name DESC;
SELECT * FROM employee
WHERE LENGTH(first_name) > 4;
UPDATE employee
SET first_name = 'Egor'
WHERE id = 5;
UPDATE employee
SET first_name = 'Kate'
WHERE id = 6;
SELECT first_name AS Имя, SUM(age) AS Суммарный_возраст FROM employee
GROUP BY Имя;
SELECT first_name, age FROM employee
WHERE age = (SELECT MIN(age) FROM employee);
SELECT first_name AS имя, MAX(age) AS максимальный_возраст FROM employee
GROUP BY first_name
HAVING COUNT(first_name) > 1;