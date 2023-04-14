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
--Задание 1
--Создайте таблицу city с колонками city_id и city_name.

CREATE TABLE city
(
    city_id   BIGSERIAL   NOT NULL PRIMARY KEY,
    city_name VARCHAR(50) NOT NULL
);

--Добавьте в таблицу employee колонку city_id.
ALTER TABLE employee
    ADD COLUMN city_id INT;

--Назначьте эту колонку внешним ключом. Свяжите таблицу employee с таблицей city.
ALTER TABLE employee
    ADD FOREIGN KEY (city_id) REFERENCES city (city_id);

--Заполните таблицу city и назначьте работникам соответствующие города.
INSERT INTO city (city_name)
VALUES ('Ростов-на-Дону'),
       ('Санкт-Петербург'),
       ('Новосибирск'),
       ('Москва'),
       ('Калининград'),
       ('Уфа');

UPDATE employee SET city_id = 1 WHERE id = 2;
UPDATE employee SET city_id = 3 WHERE id = 3;
UPDATE employee SET city_id = 4 WHERE id = 4;
UPDATE employee SET city_id = 2 WHERE id = 5;
UPDATE employee SET city_id = 5 WHERE id = 6;

-- Задание 2
-- Создайте ряд запросов к созданной таблице.
-- Получите имена и фамилии сотрудников, а также города, в которых они проживают.
SELECT employee.first_name, employee.last_name, city.city_name
FROM employee
         JOIN city ON employee.city_id = city.city_id;

-- Получите города, а также имена и фамилии сотрудников, которые в них проживают.
-- Если в городе никто из сотрудников не живет, то вместо имени должен стоять null.
SELECT city.city_name, employee.first_name, employee.last_name
FROM city
         LEFT JOIN employee ON employee.city_id = city.city_id;

-- Получите имена всех сотрудников и названия всех городов.
-- Если в городе не живет никто из сотрудников, то вместо имени должен стоять null.
-- Аналогично, если города для какого-то из сотрудников нет в списке, должен быть получен null.
SELECT employee.first_name,
       city.city_name
FROM employee
         FULL JOIN city ON employee.city_id = city.city_id;

-- Получите таблицу, в которой каждому имени должен соответствовать каждый город.
SELECT employee.first_name,
       city.city_name
FROM employee
         LEFT JOIN city ON employee.city_id = city.city_id;

-- Получите имена городов, в которых никто не живет.
SELECT city.city_name
FROM employee
         RIGHT JOIN city ON employee.city_id = city.city_id
WHERE employee.first_name IS NULL;