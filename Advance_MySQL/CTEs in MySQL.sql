-- CTEs
-- CTEs stands for Comment, Table and Expression. 
-- this will allow us define a sub query block that we can reference within the main query

-- key word to define our CTEs is WITH afterwhich we name the CTE
-- Purpose of CTE 
-- To perform more advanced calculations. (Something you can't do at all within just one query)
-- Another purpose is the READABILITY
-- you can create multiple CTEs within just one. This is when you want to do a more complex query or joining more complex queries together. 

-- basics of writing a CTE. 
-- the parenthesis () IS to emphasize that thE query is within the CTE
-- CTEs are unique cause you can only use the CTE immediately after you create it

WITH CTE_Example AS 
(
SELECT gender, AVG(Salary) Avg_sal, MAX(salary) Max_sal, MIN(salary )Min_sal, COUNT(salary) Count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example


;

WITH CTE_Example AS
(
SELECT gender, AVG(Salary) Avg_sal, MAX(salary) Max_sal, MIN(salary )Min_sal, COUNT(salary) Count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(Avg_sal)
FROM CTE_Example

;

-- Another reason is the READABILITY, you can write this using a sub query but tougher to read e.g

SELECT AVG(Avg_sal)
FROM (SELECT gender, AVG(Salary) Avg_sal, MAX(salary) Max_sal, MIN(salary )Min_sal, COUNT(salary) Count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) example_subquery
;
-- we got the exact output but syntax a bit difficult to read unlike CTE

-- additional functionalities within CTEs, as stated above, you can only use CTE immediatley after creating it
-- the reason for this is that, it is like creating a temporary table to work with. for example

SELECT AVG(Avg_sal)
FROM CTE_Example;

-- this will bring an error msg because we do not have an exisitng table like that. 

-- Next thing to look at is that you can create multiple CTEs within just one. 
-- This is when you want to do a more complex query or joining more complex queries together. 


WITH CTE_Example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics 
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS 
(
SELECT employee_id, salary	
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.employee_id

;

-- another lesson is that, instead of having the below aliases,
-- SELECT gender, AVG(Salary) Avg_sal, MAX(salary) Max_sal, MIN(salary )Min_sal, COUNT(salary) Count_sal
-- we can have it as the below, it will override the previous.

WITH CTE_Example (Gender, AVG_Sal, Max_Sal, Min_Sal, Count_Sal) AS 
(
SELECT gender, AVG(Salary) Avg_sal, MAX(salary) Max_sal, MIN(salary )Min_sal, COUNT(salary) Count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example


;
