SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM HR.EMPLOYEES

-- **** concat functon is used to concatination pf two string or coloumn ****
SELECT concat (FIRST_NAME , Last_name) from hr.EMPLOYEES;

-- **** substring retuning function****
SELECT subsTR (fIRST_NAME, 3,4) FROM HR.EMPLOYEES

-- **** GET THE LENGTH OF A STRING****
SELECT LENGTH(SALARY)FROM HR.EMPLOYEES

-- **** TO GET THE POSITION OF GIVEN CHARACTER****
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME FROM HR.EMPLOYEES WHERE INSTR(FIRST_NAME,'John');

-- **** FOLLOWING FUNCTIONS ARE USED tO TRIM A STRING OR ADD CHARACTERS TO A STRING****
SELECT trim (' data ') from dual;
SELECT ltrim (' data ') from dual;
SELECT rtrim (' data ') from dual;
SELECT lpad ('data', 10, 'sc') from dual;
SELECT rpad ('data', 10, 'sc') from dual;
SELECT lpad ('data', 2, 'sc') from dual;
SELECT rpad ('data', 3, 'sc')from dual;

-- **** ASCII character is used for the electronic communication between computers ('A' to 'Z') is ('65' to '90') ****
select ascii ('A'), chr (65) from dual 

-- ****NUMBER FUNCTION IN SQL****

select power(10,2) from dual; 
select ceil(12.34) from dual;
select floor(12.34) from dual;
select mod (900,17) from dual;
select sqrt(100) from dual;
select exp(2) from dual; 
select abs(-123) from dual;
select log(10,100) from dual;
select ln(1) from dual;
select greatest(20,56,98) from dual;
select least (20,56,98) from dual;

select salary, power(salary,2),sqrt(salary), EMPLOYEE_ID from hr.EMPLOYEES;

-- ****SPECIAL FUNCTIONS IN SQL****
SELECT sign(300) from dual;
-- ** it is used to check if the number is positive or negetive, as it is a positive number it will return '1'
SELECT sign(-300) from dual;
-- ** it is used to check if the number is positive or negetive, as it is a negetive number it will return '-1'
SELECT sin(90) , cos(90) , tan(90) from dual;
-- **it is used to find the value of trigonometric functions
SELECT asin(1) , acos(1) , atan(1) from dual;
-- **it is used to find the inverse value of trigonometric functions
SELECT nvl(null,343) from dual;
-- **it is used to replace all the null values in a coloumn with the given value
SELECT nvl (null,(select avg(salary) from hr.EMPLOYEES))from dual;
-- **it will replace all the null values in a the coloumn 'salary' with the avg salary in hr.employees table
SELECT nullif(120,134) from dual;
-- ** 'nullif' checks the numbers, if numbers are different then return the fisrt value
SELECT nullif(120,120) from dual;
-- ** 'nullif' checks the numbers, if numbers are same then return the null value

-- ****STATISTICAL FUNCTIONS****
SELECT min(salary), max(salary), count(salary), avg(salary), sum(salary), stddev(salary), variance(salary), median(salary)
from hr.employees;