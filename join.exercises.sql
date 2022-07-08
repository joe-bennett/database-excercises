-- 1. Use the join_example_db. Select all the records from both the users and roles tables.

USE join_example_db;
SHOW tables;


SELECT * 
FROM roles r
JOIN users u
ON r.id = u.role_id;
-- Returned 4 rows 

-- 2. Use join, left join, and right join to combine results from the users and roles tables as we did in the lesson. Before you run each query, guess the expected number of results.

-- join
SELECT * 
FROM roles r
JOIN users u
ON r.id = u.role_id;
-- returns 4 rows

-- Left Join

SELECT * 
FROM roles r
LEFT JOIN users u
ON r.id = u.role_id;
-- returned 5 rows

-- Right join
SELECT * 
FROM roles r
RIGHT JOIN users u
ON r.id = u.role_id;
-- Returned 6 rows 

-- 3. Although not explicitly covered in the lesson, aggregate functions like count can be used with join queries.
-- Use count and the appropriate join type to get a list of roles along with the number of users that has the role.
--  Hint: You will also need to use group by in the query.

select * from roles;
select * from users;

SELECT r.name,
COUNT(*)
FROM roles r
JOIN users u
ON r.id = u.role_id
GROUP BY r.name;

-- 1. Use the employees database.

USE employees;
SHOW tables;

-- Using the example in the Associative Table Joins section as a guide, 
-- write a query that shows each department along with the name of the current manager for that department.



SELECT CONCAT(first_name, ' ', last_name) AS dept_manager_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
USING (emp_no)
JOIN departments d
USING (dept_no)
JOIN dept_manager
USING (emp_no)
WHERE dept_manager.to_date > NOW();


-- 3. Find the name of all departments currently managed by women

SELECT CONCAT(first_name, ' ', last_name) AS dept_manager_name, d.dept_name
FROM employees AS e
JOIN dept_emp AS de
USING (emp_no)
JOIN departments d
USING (dept_no)
JOIN dept_manager
USING (emp_no)
WHERE dept_manager.to_date > NOW()
AND e.gender = 'F';


-- 4. Find the current titles of employees currently working in the Customer Service department.
SELECT DISTINCT titles.title, COUNT(*)
FROM titles 
JOIN dept_emp
USING (emp_no)
JOIN departments
USING (dept_no)
WHERE dept_emp.to_date > NOW() 
AND departments.dept_name = 'customer service'
GROUP BY titles.title;

-- 5. Find the current salary of all current managers.


SELECT CONCAT(first_name, ' ', last_name) AS current_manager, salary, dept_name
FROM employees
JOIN dept_manager AS d_m
USING (emp_no)
JOIN salaries
USING (emp_no)
JOIN departments
USING (dept_no)
WHERE d_m.to_date > NOW() 
AND salaries.to_date > NOW();

-- 6. Find the number of current employees in each department.
SELECT dept_name, COUNT(*), d.dept_no
FROM departments AS d
JOIN dept_emp
USING (dept_no)
JOIN employees
USING (emp_no)
WHERE dept_emp.to_date > NOW()
GROUP BY d.dept_name;

-- 7 Which department has the highest average salary? Hint: Use current not historic information.
SELECT AVG(s.salary) avg_s, d.dept_name
 FROM salaries s
JOIN dept_emp d_e
USING (emp_no)
JOIN departments d
USING (dept_no)
WHERE s.to_date > NOW()
AND d_e.to_date > NOW()
GROUP BY d.dept_name
ORDER BY avg_s DESC
LIMIT 1;

SELECT* FROM departments;
-- 8. Who is the highest paid employee in the Marketing department?

SELECT  CONCAT (first_name, ' ', last_name)as full_name , s.salary
FROM employees
JOIN salaries s
using (emp_no)
JOIN dept_emp d_e
USING (emp_no)
JOIN departments d
USING (dept_no)
WHERE s.to_date> NOW()
AND d_e.to_date> NOW()
AND d.dept_name = 'marketing'
ORDER BY s.salary DESC
LIMIT 1;
-- Akemi Warwick 145,128

-- 9. Which current department manager has the highest salary?

SELECT  CONCAT (first_name, ' ', last_name)as manager_name , s.salary, d.dept_name
FROM employees
JOIN salaries s
using (emp_no)
JOIN dept_manager d_m
USING (emp_no)
JOIN dept_emp d_e
USING (emp_no)
JOIN departments d
ON d_e.dept_no = d.dept_no
WHERE s.to_date> NOW()
AND d_e.to_date> NOW()
AND d_m.to_date> NOW()
ORDER BY s.salary DESC
LIMIT 1;

-- Vishwani Minakawa, marketing manager, 106,491

-- 10. Determine the average salary for each department. Use all salary information and round your results.

SELECT ROUND(AVG(salary),0), d.dept_name
FROM salaries s
JOIN dept_emp
USING (emp_no)
JOIN departments d
USING (dept_no)
GROUP BY d.dept_name;

-- 11. Bonus Find the names of all current employees, their department name, and their current manager's name.

SELECT CONCAT(first_name, ' ', last_name)AS employee_name, d.dept_name,
CONCAT(managers.first_name, ' ', last_name) 
FROM employees AS managers
JOIN dept_manager d_m
USING (emp_no)
JOIN dept_emp d_e
USING (emp_no)
JOIN departments d
ON d.dept_no=d_e.dept_no;



