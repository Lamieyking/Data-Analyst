# UNIONS allows you to combine rows together. It allows you to combine rows of data from separate tables or from the same table.
# It is done by taking one select statement and using a Union to combine it with another select statement.

SELECT Age, gender
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary
;
# This is bad data cos we should not have age and gender mixed with first name and last name.
# When using this, you need to keep the data the same.

SELECT first_name, last_name
FROM employee_demographics
UNION distinct
SELECT first_name, last_name
FROM employee_salary
;

#Now we only have a unique row for each one. By default, this is a UNION DISTINCT (DISTINCT only takes unique values)
#So union reomved all the duplicates and the first name and last name from salary overlapped a lot with the employee demographics table.

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;
#Now we have all the duplicates in the above example.

#A USE CASE
SELECT first_name, last_name, 'Old Man' AS Lable
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Lable
FROM employee_demographics
WHERE age > 40 AND gender = 'female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Lable
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;
