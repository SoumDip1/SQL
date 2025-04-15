
-- 6. Assign a rank to employees based on their salary within each department.
-- it will first partition by department then rank over the employees by using salary
select department_id, first_name, salary,
rank() over (partition by DEPARTMENT_ID order by salary desc) as Rank_salary
from hr.EMPLOYEES;

-- 7. Find the top 3 highest-paid employees in each department.
-- it will use inline query to sort the top three slaries using rank over 
SELECT department_id, first_name, salary, rank_salary
FROM (SELECT department_id, first_name,salary,
RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) AS rank_salary
FROM hr.employees)
WHERE rank_salary <= 3;

-- 8. Identify the second highest salary in each department using DENSE_RANK().
-- it will use inline query to sort the second top slaries using dense_rank.
SELECT department_id, first_name, salary, rank_salary
FROM (SELECT department_id, first_name, salary,
dense_rank () over (partition by department_id order by salary desc) as rank_salary
FROM hr.employees)
where rank_salary = 2;

-- 9. Compute the cumulative total salary of employees ordered by hire date.
-- it will sum over the salary and then sort it by using order by on hire_date
select employee_id, hire_date, salary,
sum(SALARY) over(order by hire_date) as cumulative_salary
from hr.EMPLOYEES;

-- 10. Assign a row number to each employee in each department.
-- it will assign a unique row number to each employee partition by department
select department_id, employee_id,
row_number() over (partition by department_id order by EMPLOYEE_ID) as row_NUMB
from hr.employees;

-- 11. Find the salary difference between each employee and the next highest-paid employee.
-- it will find the difference between each employees by using lead 
SELECT EMPLOYEE_ID, salary,
LEAD(SALARY) over (order by salary desc)-salary as sal_diff
from hr.employees;

-- 12. Calculate the previous month’s salary for each employee using LAG()
-- it will fetch the previous month salary by using lag(salary) and hire_date partition by employee_id
select employee_id, salary, hire_date,
LAG(salary) over (partition by employee_id order by hire_date) as prev_sal
from hr.employees;

-- 13. Identify employees whose salaries increased over time.
-- ****the solution is not clear to me****
