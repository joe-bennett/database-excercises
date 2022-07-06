-- 1 Create a file named where_exercises.sql. Make sure to use the employees database.

USE employees;
SHOW tables;
SELECT * FROM employees;

-- 2 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya' using IN. Enter a comment with the number of records returned.
--               709 rows retunred 

SELECT first_name, last_name, emp_no FROM employees WHERE first_name IN('Irena', 'Vidya', 'Maya');

-- 3 Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', as in Q2, but use OR instead of IN. Enter a comment with the number of records returned. Does it match number of rows from Q2?
--              this code also yielded 709 rows returned just like Q2
SELECT first_name, last_name, emp_no FROM employees WHERE first_name = 'Irena' or  first_name = 'Vidya' or first_name = 'Maya';

-- 4Find all current or previous employees with first names 'Irena', 'Vidya', or 'Maya', using OR, and who is male. Enter a comment with the number of records returned.
--            the code below returned 441 rows
SELECT first_name, gender FROM employees 
WHERE gender <> 'f'
AND (first_name = 'Irena' 
or first_name = 'Vidya' 
or first_name = 'Maya');

-- 5 Find all current or previous employees whose last name starts with 'E'. Enter a comment with the number of employees whose last name starts with E.
--      running this code below returned 7,330 rows
SELECT * FROM employees
WHERE last_name like 'E%';

-- 6 Find all current or previous employees whose last name starts or ends with 'E'. Enter a comment with the number of employees whose last name starts or ends with E. How many employees have a last name that ends with E, but does not start with E?

SELECT * FROM employees 
WHERE last_name LIKE '%E' OR last_name LIKE 'E%';
--  this returned 30,723 rows for # of last names that begin or end with 'e'
SELECT * FROM employees
WHERE last_name like '%E'  AND last_name NOT LIKE 'E%';
-- this returned 23,393 rows of last names that end in 'e' and do not begin with 'e'

-- 7 Find all current or previous employees employees whose last name starts and ends with 'E'. Enter a comment with the number of employees whose last name starts and ends with E. How many employees' last names end with E, regardless of whether they start with E?

SELECT * FROM employees 
WHERE last_name LIKE '%E' AND last_name LIKE 'E%';
-- This returned 899 rows of employees whose last name starts and ends with 'e'

SELECT * FROM employees 
WHERE last_name LIKE '%E';
-- this returned 24292 rows of last names that end in 'e' regardless of what they begin with


-- 8 Find all current or previous employees hired in the 90s. Enter a comment with the number of employees returned.

SELECT * FROM employees 
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
-- This returned 135,214 rows of employees hired in the 90s


-- 9. Find all current or previous employees born on Christmas. Enter a comment with the number of employees returned.

SELECT * FROM employees
WHERE birth_date LIKE '%12-25%';
--  842 employees were born on christmas

-- 10 Find all current or previous employees hired in the 90s and born on Christmas. Enter a comment with the number of employees returned.

SELECT * FROM employees 
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date like '%12-25%';
-- 362 employees hired in the 90s and born on christmas

-- 11. Find all current or previous employees with a 'q' in their last name. Enter a comment with the number of records returned.

SELECT * FROM employees
WHERE last_name LIKE '%Q%';
-- 1,873 Employees have a q	in their last name

-- 12. Find all current or previous employees with a 'q' in their last name but not 'qu'. How many employees are found?

SELECT * FROM employees
WHERE last_name LIKE '%Q%' AND 
last_name NOT LIKE '%QU%';

-- 547 employees have a 'q' in their last name and not 'qu'