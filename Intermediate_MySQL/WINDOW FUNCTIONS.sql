-- WINDOW FUNCTIONS	

-- Window functions allow us to look at a partition	or a group but they each keep their unique rows in the output. 
-- we are going to look at things like row numbers Rank and dense Rank in this lesson. 
-- Before writing a window function, we should write out a Group by  and compare the two when we write the window function. 
-- Let's say we wanna take the demographics table and we want to take the gender in it and compare to the actual salaries. 
-- we'll use JOIN and we'll join on the employee salary. See below example. 

SELECT gender, AVG(salary) AS Avg_Salary
FROM employee_demographics Dem
JOIN employee_salary Sal
	ON Dem.employee_id = Sal.employee_id
    GROUP BY gender
;

-- with the example above, we have our gender and the avg salary from our salary table.

-- this is how group by works, it rolls everything up into one row. 

-- Trying something similar, except we will be using window functions this time. 
-- In window function, we don't have to use the group by
-- here we will remove the alias for avg salary, which is part of creating a window function. 
-- typically with a straightforward window function, all we have to put is OVER () with a closed parenthesis. 
-- this is going to say that we are looking at the avg salary, OVER everything

SELECT gender, AVG(salary) OVER ()
FROM employee_demographics Dem
JOIN employee_salary Sal
	ON Dem.employee_id = Sal.employee_id
;

-- In the example above, it is a bit diff, male and female hvae their own individual rows which is not same as group by,
-- and this avg salary is looking at the avg salary of everybody. we're not breaking it out by the gender like we did in the previous example
-- here we rolled it up. npow we're looking at the avg salary for the entire column. 
-- what we can do here is PARTITION BY, this is going to separate it out just like grouping it. see below
-- this will perform the avg salary calculatiopn based on the different gender. the unique values in this column. 

SELECT gender, AVG(salary) OVER (PARTITION BY gender)
FROM employee_demographics Dem
JOIN employee_salary Sal
	ON Dem.employee_id = Sal.employee_id
;
-- if we look at group by, its the same numbers, except here we have it on each gender's individual rows.
-- now why would we want this, incase we want to add an additional information.

SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER (PARTITION BY gender)
FROM employee_demographics Dem
JOIN employee_salary Sal
	ON Dem.employee_id = Sal.employee_id
;
-- this addition didn't affect the avg salary column at all because we are using a WINDOW FUNCTION
-- IF we add this additional information in the groupby, it would give a different result

SELECT dem.first_name, dem.last_name, gender, AVG(salary) AS Avg_Salary
FROM employee_demographics Dem
JOIN employee_salary Sal
	ON Dem.employee_id = Sal.employee_id
    GROUP BY dem.first_name, dem.last_name, gender
;
-- because we're using a groupby, we re grouping by the first, last name and the gender. 
-- we're breaking everything out basef off of the unique values in these columns (Leslie	Knope	Female	75000.0000)
-- whereas, in the window function, each columns are independent. each window function is based on the particular column. 

-- Another example of the window function. Looking at the sum of salaries

SELECT dem.first_name, dem.last_name, gender, 
SUM(salary) OVER (PARTITION BY gender)
FROM employee_demographics Dem
JOIN employee_salary Sal
	ON Dem.employee_id = Sal.employee_id
;

-- ROLLING TOTAL
-- A rolling tota;l, is going to start at a specific value and add on values from subsequent rows based off of your partition\

SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER (PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics Dem
JOIN employee_salary Sal
	ON Dem.employee_id = Sal.employee_id
;
-- here we are adding each salary to the already esxisting total
-- this is something a lot of people in finance do. 
-- in the example, u can't see the employee id, but it is ordering in the background.

-- OTHER THINGS I CAN DO WITH WINDOW FUNCTIONS OR WINDOW LIKE FUNCTION.

-- ROW_NUMBER
-- like numbering rows based off of everythiNG, whether partitioning by or ordering by in your window function. doesn't matter what is it. just like an employee iod


SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER () OVER()
FROM employee_demographics Dem
JOIN employee_salary Sal
	ON Dem.employee_id = Sal.employee_id
;
-- if u want the row number to repeat itself, we can partition it, e.g by gender.

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER () OVER(PARTITION BY gender)
FROM employee_demographics Dem
JOIN employee_salary Sal
	ON Dem.employee_id = Sal.employee_id
;

-- if we want to rank this based on the highest salary first, down to the lowest salary?
-- all we have to do is add an ORDER BY

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER () OVER(PARTITION BY gender ORDER BY salary DESC)
FROM employee_demographics Dem
JOIN employee_salary Sal
	ON Dem.employee_id = Sal.employee_id
;
-- lets add RANK

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER () OVER(PARTITION BY gender ORDER BY salary DESC) Row_num,
RANK () OVER(PARTITION BY gender ORDER BY salary DESC) Rank_num
FROM employee_demographics Dem
JOIN employee_salary Sal
	ON Dem.employee_id = Sal.employee_id
;
-- Note: when using a row number, whatever we ar partitioning by is not going to have duplicate rows within that partition.
-- unlike Rank, when it encounters a duplicate, based off of the order by which is the salary, its going to assign it the same number, like in the example. 
-- whats unique about Rank is that, the next number is not going to be the next number numerically  but positionally. 

-- DENSE RANK

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER () OVER(PARTITION BY gender ORDER BY salary DESC) Row_num,
RANK () OVER(PARTITION BY gender ORDER BY salary DESC) Rank_num,
DENSE_RANK () OVER(PARTITION BY gender ORDER BY salary DESC) Dense_Rank_num
FROM employee_demographics Dem
JOIN employee_salary Sal
	ON Dem.employee_id = Sal.employee_id
;
-- dense rank is slightly different from rank, the fact that when it gets to duplicate, it will still duplicate 
-- but will give the next number numerically not positionally. that is the only real difference between Rank and Dense Rank. 
-- row number has no duplicate, its going to give it its own unique within that partition. 
