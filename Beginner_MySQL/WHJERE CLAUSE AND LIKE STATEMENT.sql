SELECT *
FROM employee_salary
WHERE first_name='LESLIE'
;

SELECT *
FROM employee_salary
WHERE salary <= 50000
;

SELECT *
FROM employee_demographics
WHERE (first_name = 'LESLIE' AND age = 44) or age < 55
;

# LIKE STATEMENT
# % AND _

SELECT *
FROM employee_demographics
WHERE first_name like 'Jer%'
;

SELECT *
FROM employee_demographics
WHERE first_name like '%er%'
;

SELECT *
FROM employee_demographics
WHERE first_name like 'a__'
;

SELECT *
FROM employee_demographics
WHERE first_name like 'a__%'
;

SELECT *
FROM employee_demographics
WHERE birth_date like '1989%'
;