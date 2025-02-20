-- CASE STATEMENT

-- A case statement allows you to add logic in your select statement, just like 'If else' statement in almost all programming language even in excel.
-- 
SELECT first_name, 
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'Adult'
    WHEN age >= 50 THEN 'Old'
    END AS Age_Bracket
FROM employee_demographics
;

-- Looking at a different scenerio. 
-- The Pawnee council sent out a memo of their bonus and pay increase for end of the year,
-- and we need to follow it and determine people's end of year salary
-- or salary going into the new year and if they got bonus, how much was it?
-- The first thing we need to do is to get the PAY INCREASE AND BONUS
-- And their pay increases is, if they  made less than 50,000, that equals a 5% raise
-- and if they made greater than 50,000, that equals a 7% bonus.
-- and if they work in the finance department, that equals a 10% bonus.

-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10%

-- So these are the guidelines the Pawnee council sent out and it is our job to determine and figure out those pay increases as well as the bonuses. 
-- to do this see below.  Unfortunately, people who make exactly 50k are not part of the bracket. we did not make the rules, the company did. 


SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary + (salary * 0.07)
    
END AS NEW_SALARY,
CASE
	WHEN dept_id = 6 THEN salary * .10
END AS Bonus
FROM employee_salary
;

-- now we need to know those in finance department to get their bonuses.

SELECT *
FROM employee_salary
;

SELECT *
FROM parks_departments
;

-- in the park departments, we have the department id of 6 and if we are looking at the salary,
-- there is only one person who's in department id equal to 6. so we'll do another case statemnt above.