-- Create a new SQL script named limit_exercises.sql.

-- MySQL provides a way to return only unique results from our queries with the keyword DISTINCT. For example, to find all the unique titles within the company, we could run the following query:
-- List the first 10 distinct last name sorted in descending order.


SELECT DISTINCT last_name FROM employees
ORDER BY last_name DESC
LIMIT 10;
-- the 10 last names in descending order are zyda, Zwicker, Zweizig, Zumaque, Zultner, Zucker,Zuberek, Zschoche, Zongker

-- Find all previous or current employees hired in the 90s and born on Christmas. 
-- Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records.-- Write a comment in your code that lists the five names of the employees returned.


SELECT first_name, 
	   last_name,
	   hire_date
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY hire_date
LIMIT 5;

/* 
Alselm	    Cappello	1990-01-01
Utz	        Mandell	    1990-01-03
Bouchung	Schreiter	1990-01-04
Baocai	    Kushner	    1990-01-05
Petter  	Stroustrup	1990-01-10
*/


-- Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.

/*
Page 1 -> LIMIT = 5, OFFSET = 0, Records 1-5
Page 2 -> LIMIT = 5, OFFSET = 5, Records 6-10
Page 3 -> LIMIT = 5, OFFSET = 10, Records 11-15
...
Page # * Limit = offset for next page.
Page 9 * 5 = 45, so page 10 is offset 45 or 9 pages with limits of 5 each.
*/



SELECT first_name, 
	   last_name,
	   hire_date
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%-12-25'
ORDER BY hire_date
LIMIT 5 OFFSET 45;

/* 
Pranay	Narwekar	1990-07-18
Marjo	Farrow	    1990-07-18
Ennio	Karcich	    1990-08-05
Dines	Lubachevsky	1990-08-06
Ipke	Fontan  	1990-08-06
*/