-- SELECT Employee_id, FIRST_NAME, Salary FROM HR.EMPLOYEES where salary>10000

-- ****ARITHMATIC OPERATORS****

select 10+5 as addition,
       10-5 as substraction,
       10*5 as multiplication,
       10/5 as devision
from dual

-- ****COMPARISION OPERATORS****

select employee_id,First_Name, Salary from Hr.Employees where salary > 10000
select employee_id,First_Name, Salary from Hr.Employees where salary < 10000
select employee_id,First_Name, Salary from Hr.Employees where salary >= 10000
select employee_id,First_Name, Salary from Hr.Employees where salary <= 10000
select employee_id,First_Name, Salary from Hr.Employees where salary <> 10000
select employee_id,First_Name, Salary from Hr.Employees where salary = 10000

-- ****LOGICAL OPERATORS****

select employee_id,First_Name, Salary,DEPARTMENT_ID from Hr.Employees where salary > 10000 AND DEPARTMENT_ID in 90
select employee_id,First_Name, Salary,DEPARTMENT_ID from Hr.Employees where salary < 10000 OR DEPARTMENT_ID in 90
select employee_id,First_Name, Salary,DEPARTMENT_ID from Hr.Employees where salary < 10000 NOT DEPARTMENT_ID in 90

-- ****CONCATENATION OPERATOR****

SELECT First_Name||LAST_NAME FROM HR.EMPLOYEES 
SELECT First_Name||' '||Last_Name as Full_Name FROM HR.EMPLOYEES  

-- ****BETWEEN,IN,LIKE OPERATORS****

SELECT FIRST_NAME, LAST_NAME , SALARY FROM HR.EMPLOYEES WHERE SALARY BETWEEN 10000 AND 20000 
--       ___(BOTH THE BOUNDARIES ARE INCLUSIVE)__

select First_Name, Salary,DEPARTMENT_ID from Hr.Employees where DEPARTMENT_ID in 90
select First_Name||' '||LAST_NAME AS FULL_NAME , Salary,DEPARTMENT_ID from Hr.Employees where DEPARTMENT_ID in 90
--       ___(HERE BOTH 'IN' AND 'CONCATENATION' HAVE BEEN USED)___

select First_Name from Hr.Employees where FIRST_NAME LIKE '%s'
select First_Name from Hr.Employees where FIRST_NAME LIKE 'S%'
select First_Name from Hr.Employees where FIRST_NAME LIKE '%am%'
select First_Name from Hr.Employees where FIRST_NAME LIKE '___'
select First_Name from Hr.Employees where FIRST_NAME LIKE '__e%'
--       ___(IT IS BASICALLY USED FOR FILTERING PURPOSE)___
