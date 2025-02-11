SELECT *
FROM employee_demographics;

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT first_name
FROM parks_and_recreation.employee_demographics;

SELECT first_name, 
last_name, 
(age +10) * 10
FROM parks_and_recreation.employee_demographics;

SELECT DISTINCT first_name, GENDER
FROM parks_and_recreation.employee_demographics;


