CREATE DATABASE homework_3;
USE homework_3;

DROP TABLE IF EXISTS salespeople;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

-- TABLE_1 SALESPEOPLE ---------------------------
CREATE TABLE IF NOT EXISTS salespeople (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    snum INT NOT NULL,
    sname VARCHAR(25) NOT NULL,
    city VARCHAR(25),
    comm DECIMAL(3,2)
);
INSERT INTO salespeople (snum, sname, city, comm) VALUES
	(1001, "Peel", "London", 0.12),
	(1002, "Serres", "San Jose", 0.13),
	(1004, "Motika", "London", 0.11),
	(1007, "Rifkin", "Barcelona", 0.15),
	(1003, "Axelrod", "New York", 0.10);

-- TABLE_2 CUSTOMERS -------------------------------
CREATE TABLE IF NOT EXISTS customers (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cnum INT NOT NULL,
    cname VARCHAR(25) NOT NULL,
    city VARCHAR(25),
    rating INT,
    snum INT
);
INSERT INTO customers(cnum, cname, city, rating, snum) VALUES
	(2001, "Hoffman", "London", 100, 1001),
	(2002, "Giovanni", "Rome", 200, 1003),
	(2003, "Liu", "SanJose", 200, 1002),
	(2004, "Grass", "Berlin", 300, 1002),
	(2006, "Clemens", "London", 100, 1001),
	(2008, "Cisneros", "SanJose", 300, 1007),
	(2007, "Pereira", "Rome", 100, 1004);

-- TABLE_3 ORDERS -----------------------------------
CREATE TABLE IF NOT EXISTS orders (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    onum INT NOT NULL,
    amt DECIMAL(6,2),
    odate DATE,
    cnum INT NOT NULL,
    snum INT NOT NULL
);
INSERT INTO orders(onum, amt, odate, cnum, snum) VALUES
	(3001, 18.69, '1990-03-10', 2008, 1007),
	(3003, 767.19, '1990-03-10', 2001, 1001),
	(3002, 1900.10, '1990-03-10', 2007, 1004),
	(3005, 5160.45, '1990-03-10', 2003, 1002),
	(3006, 1098.16, '1990-03-10', 2008, 1007),
	(3009, 1713.23, '1990-04-10', 2002, 1003),
	(3007, 75.75, '1990-04-10', 2004, 1002),
	(3008, 4723.00, '1990-05-10', 2006, 1001),
	(3010, 1309.95, '1990-06-10', 2004, 1002),
	(3011, 9891.88, '1990-06-10', 2006, 1001);
    
-- Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке: city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
SELECT city, sname, snum, comm 
FROM salespeople;

-- Напишите команду SELECT, которая вывела бы оценку(rating), сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
SELECT cname, rating 
FROM customers
WHERE city = 'SanJose';

-- Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
SELECT DISTINCT snum
FROM orders;

-- Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G. 
SELECT *
FROM customers
WHERE cname LIKE 'G%';

-- Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000. (“Заказы”, “amt”  - сумма)
SELECT *
FROM orders
WHERE amt > 1000;

-- Напишите запрос который выбрал бы наименьшую сумму заказа.
SELECT MIN(amt) AS minAMT
FROM orders;

-- Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков, у которых рейтинг больше 100 и они находятся не в Риме.
SELECT * 
FROM customers
WHERE rating > 100 AND city NOT LIKE 'Rome';

-- ---------
DROP TABLE IF EXISTS employee;
CREATE TABLE IF NOT EXISTS employee (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(25) NOT NULL,
    surname VARCHAR(25) NOT NULL,
    specialty  VARCHAR(25) NOT NULL,
    seniority INT,
    salary INT,
    аgе INT
);
INSERT INTO employee (firstname, surname, specialty, seniority, salary, аgе) VALUES
	('Вася', 'Васькин', 'начальник', 40, 100000, 60),
	('Петя', 'Петькин', 'начальник', 8, 70000, 30),
	('Катя', 'Каткина', 'инженер', 2, 70000, 25),
	('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
	('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
	('Петр', 'Петров', 'рабочий', 20, 25000, 40),
	('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
	('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
	('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
	('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
	('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
	('Люся', 'Люськина', 'уборщик', 10, 10000, 49);
    
-- Отсортируйте поле “зарплата” в порядке убывания и возрастания
SELECT salary
FROM employee
ORDER BY salary;

SELECT salary
FROM employee
ORDER BY salary DESC;

-- Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)
SELECT salary
FROM (SELECT salary
      FROM employee
      ORDER BY salary DESC
      LIMIT 5) AS salary
ORDER BY salary;

-- Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000

SELECT specialty
FROM employee
GROUP BY specialty
HAVING SUM(salary) > 100000;