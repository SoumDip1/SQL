-- We use this function for SKIP RANKING 
-- (if the value matches then it will reflect the same rank but for the next value,
-- it will skip the previous ranking and will start from the next rank)
select first_name, salary, rank() over (order by salary) from hr.employees;

-- We use this function for CONTINUOUS RANKING 
-- (if the value matches then it will reflect the same and return the next rank for the next value)
select first_name, salary, dense_rank() over (order by salary) from hr.employees;
 
-- We use this function to get the UNIQUE RANKING for each row
-- (so basically it will return the rank sequentially)
select first_name, salary, row_number() over (order by salary) from hr.employees;


SELECT 
    employee_id, FIRST_name, salary,
    RANK() OVER (order by salary desc) as RANK_SALARY,
    DENSE_RANK () OVER (order by salary desc) as DENSE_RANK_SALARY,
    row_number () OVER (order by salary desc) as ROW_NUMBER_SALARY,
    LAG (SALARY) OVER (order by salary desc) as Previous_Salary,
    LEAD (SALARY) OVER (order by salary desc) as Next_Salary
from hr.employees;

-- "PARTITION BY" is used to segregate the ranking by department wise
select 
    DEPARTMENT_ID, first_name, salary, 
    rank() over (partition by DEPARTMENT_ID order by salary) as rank 
from hr.employees;

-- Here "PARTITION BY" is used to segregate the ranking by DEPARTMENT wise as well as JOB_ID
SELECT 
    DEPARTMENT_ID,JOB_ID first_name, salary, 
    rank() over (partition by DEPARTMENT_ID,JOB_ID order by salary) as rank 
from hr.employees;

SELECT employee_id, salary from hr.EMPLOYEES where salary>5000;

-- INLINE SUBQUERIES
SELECT EMPLOYEE_ID, salary
from (SELECT employee_id, salary from hr.EMPLOYEES where salary>5000);

-- SUBQUERIES (SCALAR SUBQUERY)
SELECT EMPLOYEE_ID from hr.EMPLOYEES where salary>(Select avg(salary) from hr.EMPLOYEES);

-- MULTILINE QUERIES
SELECT EMPLOYEE_ID from hr.employees where DEPARTMENT_ID in
(SELECT DEPARTMENT_ID from hr.employees where employee_id=100);

-- COMMON TABLE EXPRESSION (CTE)
WITH RANK_SALARY as(
Select 
    employee_id, department_id, salary,
    rank() over (partition by department_id order by salary) as rk
    from hr.EMPLOYEES)
select employee_id, department_id, salary from RANK_SALARY where rk=1;