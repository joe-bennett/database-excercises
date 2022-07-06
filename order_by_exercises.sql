-- Create a new file named order_by_exercises.sql and copy in the contents of your exercise from the previous lesson.

-- 1 Create a file named where_exercises.sql. Make sure to use the employees database.



-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

SELECT first_name, last_name, emp_no FROM employees WHERE first_name IN('Irena', 'Vidya', 'Maya')
ORDER BY first_name;
-- first person is Irena Reutenauer, last person is Vidya Simmen

-- 3. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by first name and then last name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

SELECT first_name, last_name, emp_no FROM employees WHERE first_name = 'Irena' or  first_name = 'Vidya' or first_name = 'Maya'
ORDER BY first_name, last_name;
-- first person in the result table is Irena Acton, last person is Vidya Zweizig


-- 4. Find all employees with first names 'Irena', 'Vidya', or 'Maya', and order your results returned by last name and then first name. In your comments, answer: What was the first and last name in the first row of the results? What was the first and last name of the last person in the table?

SELECT * FROM employees 
WHERE gender <> 'f'
AND (first_name = 'Irena' 
or first_name = 'Vidya' 
or first_name = 'Maya')
ORDER BY last_name, first_name;
-- the first row has the employee name Irena Acton, the last employee in the result table is Maya Zyda.

-- 5. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their employee number. Enter a comment with the number of employees returned, the first employee number and their first and last name, and the last employee number with their first and last name.

SELECT * FROM employees
WHERE last_name like 'E%'
ORDER BY emp_no;
-- 7,330 rows returned with employee #10021 Ramzi Erde being the first row,  employee #499968 Dharmaraja Ertl being the last row

-- 6. Write a query to to find all employees whose last name starts and ends with 'E'. Sort the results by their hire date, so that the newest employees are listed first. Enter a comment with the number of employees returned, the name of the newest employee, and the name of the oldest employee.

SELECT * FROM employees 
WHERE last_name LIKE '%E' AND last_name LIKE 'E%'
ORDER BY hire_date desc;
-- 899 employees in the result table. most recent hired employee is Teiji Eldridge, most tenured employee is Sergi Erde

-- 7. Find all employees hired in the 90s and born on Christmas. Sort the results so that the oldest employee who was hired last is the first result. Enter a comment with the number of employees returned, the name of the oldest employee who was hired last, and the name of the youngest employee who was hired first.

SELECT * FROM employees 
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date like '%12-25%'
ORDER BY birth_date, hire_date desc;

-- 362 employrees returned, Khun Bernini is the oldest employee hired last, Douadi Pettis is the youngest employee hired first