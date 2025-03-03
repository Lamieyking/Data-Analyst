-- SUBQUERIES
-- Subquery is a query within another query. This can be done in different ways.
-- One is within the WHERE CLAUSE, SELECT in the FROM CLAUSE also.
-- from the employee demographics table, what if we only wanted to select the employees who worked in the actual Parks and Rec department.
-- this could be done using JOINS but we want to use subquery. we have the salary table, under which 1 represents that they work for Parks and Rec dept. under the dept id.
-- if we check under parks_department and check parks and rec, we'll see that parks and rec is d depatment id of 1. 


SELECT *
FROM  employee_demographics
WHERE employee_id IN 
				(SELECT employee_id
					FROM employee_salary
					WHERE dept_id = 1)
;
                
-- in the above, there is a subquery within a query. 

-- we can also use the subquery in a select statement

-- let's say we want to look at all the salaries in the salary table, but in a column next to it, 
-- we also want to compare it to the average salary for everyone so we'll be able to see whether 
-- somebody's salary is above average or below average. 

-- see below what we'll do.


SELECT first_name, salary,
(SELECT AVG (salary)
FROM employee_salary)

FROM employee_salary
;

-- WE can also use a SUBQUERY in the FROM  statement

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

-- what if we want to get the avereage of the oldest, or smallest ages is or see where the average count is for males and females
-- see below, we'll select everything FROM the above gender, age output

SELECT*
FROM
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_table
;

-- we got the same output, but if we do the below

SELECT gender, (`MAX(age)`)
FROM
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_table
GROUP BY gender
;

-- using this like this (`MAX(age)`), its the actual name of a column not an aggregation anymore. `` this is a backtick not a quote ''

SELECT AVG(MAX_AGE)
FROM
(SELECT gender, 
AVG(age) Ave_age, 
MAX(age) MAX_AGE, 
MIN(age) Min_age, 
COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_table
;
-- the above is the averages of MAX(age)