-- 1. Find all the current employees with the same hire date as employee 101010 using a sub-query.

USE employees;

SELECT hire_date
FROM employees
WHERE emp_no = 101010;


SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date= 
(SELECT hire_date
FROM employees
WHERE emp_no = 101010
);

-- 2. Find all the titles ever held by all current employees with the first name Aamod.

SELECT emp_no
FROM employees
JOIN titles
USING (emp_no)
WHERE first_name = 'aamod'
AND to_date > NOW();

SELECT title, COUNT(*)
FROM titles 
WHERE titles.emp_no IN (
		SELECT emp_no
		FROM employees
		JOIN titles
		USING (emp_no)
		WHERE first_name = 'aamod'
		AND to_date > NOW())
GROUP BY title;


-- 3. How many people in the employees table are no longer working for the company? Give the answer in a comment in your code.

SELECT emp_no
FROM dept_emp
WHERE to_date < NOW()


SELECT CONCAT( first_name, ' ', last_name) AS full_name
FROM employees 
WHERE employees.emp_no IN(
        SELECT emp_no
        FROM dept_emp
        WHERE to_date < NOW());
        
SELECT  COUNT(*) FROM 
(SELECT CONCAT( first_name, ' ', last_name) AS full_name
FROM employees 
WHERE employees.emp_no IN(
        SELECT emp_no
        FROM dept_emp
        WHERE to_date < NOW())) a;
        
-- 85,108 people no longer working for the company


-- 4. Find all the current department managers that are female. List their names in a comment in your code.

SELECT emp_no 
FROM dept_manager
WHERE to_date > NOW();

SELECT CONCAT(first_name,' ', last_name)as full_name, gender
FROM employees e
WHERE e.emp_no IN(
         SELECT emp_no 
         FROM dept_manager
         WHERE to_date > NOW())
AND e.gender = 'f';     


-- Isamu Legleitner, Karsten Sigstam, Leon DasSama, and Hilary Kambil


-- 5. Find all the employees who currently have a higher salary than the companies overall, historical average salary.



SELECT ROUND (AVG(salary),2)
FROM salaries;

SELECT COUNT(*)
FROM employees
JOIN salaries
USING (emp_no)
WHERE to_date > NOW()
AND salaries.salary > (SELECT ROUND (AVG(salary),2)
FROM salaries);

-- 154,543 employees earn more than the historical salary average 


-- 6. How many current salaries are within 1 standard deviation of the current highest salary? 
-- (Hint: you can use a built in function to calculate the standard deviation.) 
-- What percentage of all salaries is this?

SELECT STDDEV(salary)
FROM salaries
WHERE to_date > NOW();


SELECT MAX(salary)
FROM salaries 
WHERE to_date > NOW();

SELECT COUNT(*)
FROM salaries
WHERE salary > ((SELECT MAX(salary)
                FROM salaries 
                WHERE to_date > NOW()) - (SELECT STDDEV(salary)
                                                     FROM salaries
                                                     WHERE to_date > NOW()))
AND to_date > NOW();

-- 83 current salaries are within one standard deviation of the hightest current salary. 


SELECT COUNT(salary)
FROM salaries 
WHERE to_date > NOW();

-- 240,124 current salaries


SELECT
(SELECT COUNT(*)
FROM salaries
WHERE salary > ((SELECT MAX(salary)
                FROM salaries 
                WHERE to_date > NOW()) - (SELECT STDDEV(salary)
                                                     FROM salaries
                                                     WHERE to_date > NOW()))
AND to_date > NOW())
/ (SELECT COUNT(salary)
FROM salaries 
WHERE to_date > NOW());

-- .O3%

