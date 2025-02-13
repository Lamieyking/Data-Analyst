#STRING FUNCTIONS

#String functions are built in functions within Mysql that will help us use strings and work with strings differently.
#There are different String functions and they all have different use cases. One is called LENGTH

SELECT length('SKYFALL');

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2
;
#2. UPPERCASE AND LOWERCASE
SELECT upper('sky');
SELECT lower('SKY');

SELECT first_name, UPPER(first_name)
FROM employee_demographics
ORDER BY 2
;

SELECT first_name, lower(first_name)
FROM employee_demographics
ORDER BY 2
;

#TRIM. 
#There are multiple Trim. Left trim, Right trim.
#Trim is basically going to take white space on the front or the end and get rid of it. 
#Example

SELECT TRIM('          SKY          ');
#This is the function of TRIM, to get rid of the leading and the trailing white spaces. Let's remove the trim in our exmaple to see the outcome.

SELECT('          SKY          ');
#We can also trim only the right side or only the left side.
SELECT LTRIM('          SKY          ');
SELECT RTRIM('          SKY          ');

#SUBSTRING
#Substring has two small funstions which are Left and Right

#Example using the left, to execute, the has to be values in number. what we are specifying is how many characters from the left hand side do we want to select. 

SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name, 3,2),
birth_date,
SUBSTRING(birth_date, 6,2) AS Birth_month
FROM employee_demographics
;
#The outcome for the substring is that e.g, LESLIE which is the first name, starts from 3 (third position) which is S, and 2 characters which are SL.  
#As for birth date, e.g we are running a query and we want to find the month that everyone is born, we can do that using SUBSTRING. 
#Note, the birth month is the middle figures in the brith date. count till u get to the first number in the middle, (SUBSTRING(birth_date, 6,2)

#REPLACE
#Replace will actually replace the specific characters with a different character that you want. 

SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics
;
#The above example means that, anywhere it finds 'a', it should be replaced with 'z' MARK was replaced as MZRK. 

#LOCATE
SELECT LOCATE('C','MICHAEL');
# C was located at position 3.

SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics
;
#the above example located only 2 'An' in the first name. 

#CONCAT
SELECT first_name, last_name,
CONCAT (first_name,' ',last_name) AS Full_name
FROM employee_demographics
;
# ' ', this is how to put a space between words. 

#Other functions apart from the STRING FUNCTIONS are 
#NUMERIC FUNCTIONS
#DATE & TIME FUNCTIONS
#CONVERTING DIFFERENT DATA TYPES ETC. ALL IN FUNCTIONS MODULE.