SELECT * FROM mysql.user;
SELECT user, host FROM mysql.user;

SELECT * FROM mysql.help_topic;
SHOW DATABASES;
SHOW CREATE DATABASE farmers_market;
SHOW DATABASES;
USE farmers_market;
SELECT DATABASE();
SHOW DATABASES;
USE quotes_db;
SELECT DATABASE();
USE employees;
SHOW tables;
DESCRIBE employees;
SHOW tables;
DESCRIBE departments;
USE employees;
SELECT DATABASE();
SHOW tables;
-- Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
--  `emp_no` int NOT NULL,
--  `dept_no` char(4) NOT NULL,
--  `from_date` date NOT NULL,
--  `to_date` date NOT NULL,
--  PRIMARY KEY (`emp_no`,`dept_no`),
--  KEY `dept_no` (`dept_no`),
--  CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
--  CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1
SHOW CREATE table dept_manager;

-- Which table(s) do you think contain a numeric type column?
DESCRIBE employees;
-- employee no, birth_date

-- Which table(s) do you think contain a string type column?
-- first_name, last_name

-- Which table(s) do you think contain a date type column?
-- hire_date

-- What is the relationship between the employees and the departments tables?
-- a key links them together

-- Show the SQL that created the dept_manager table. Write the SQL it takes to show this as your exercise solution.
-- SHOW CREATE dept_manager table;
