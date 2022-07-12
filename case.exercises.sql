-- 1. Write a query that returns all employees, their department number, their start date, their end date, 
-- and a new column 'is_current_employee' that is a 1 if the employee is still with the company and 0 if not.


SELECT CONCAT(first_name, ' ', last_name) AS full_name, hire_date, d_e.dept_no, to_date,
IF (d_e.to_date = '9999-01-01', TRUE, FALSE) AS is_current_employee
FROM employees
JOIN dept_emp d_e
USING (emp_no);

-- 2. Write a query that returns all employee names (previous and current), and a new column 'alpha_group' that returns 'A-H', 'I-Q', or 'R-Z' 
-- depending on the first letter of their last name.
	
	
SELECT first_name, last_name, 
    CASE 
      WHEN SUBSTR(last_name, 1, 1) <= 'H' THEN 'A-H'
      WHEN SUBSTR(last_name, 1,1) <= 'Q' THEN 'I-Q'
      WHEN SUBSTR(last_name, 1, 1) <= 'Z' THEN 'R-Z'
END AS alpha_group
FROM employees;

	-- How many employees (current or previous) were born in each decade?

