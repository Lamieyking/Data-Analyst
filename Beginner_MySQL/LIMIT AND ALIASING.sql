# LIMIT AND ALIASING

SELECT *
FROM employee_demographics
LIMIT 3
;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1
;

#ALIASING

SELECT gender, AVG(age) AS AVG_AGE
FROM employee_demographics
GROUP BY gender
HAVING AVG_AGE > 40
;


SELECT gender, AVG(age) Workers_age
FROM employee_demographics
GROUP BY gender
HAVING  Workers_age > 40
;