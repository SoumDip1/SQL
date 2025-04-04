-- 1. Count employees per department
select department_id, count(EMPLOYEE_ID)
from hr.EMPLOYEES 
group by department_id; 

-- 2. Total salary per department
SELECT department_id, sum(salary)
from hr.EMPLOYEES
group by DEPARTMENT_ID; 

-- 3. Average salary per department
SELECT department_id, avg(salary)
from hr.EMPLOYEES
group by DEPARTMENT_ID; 

-- 4. Minimum salary per department
SELECT department_id, min(salary)
from hr.EMPLOYEES
group by DEPARTMENT_ID; 

-- 5. Maximum salary per department
SELECT department_id, max(salary)
from hr.EMPLOYEES
group by DEPARTMENT_ID;

-- 6. Count employees per job role
select job_id, count(*)
from hr.EMPLOYEES
group by job_id; 

-- 7. Total salary per job role
select job_id, sum(salary) as total_salary 
from hr.EMPLOYEES
group by job_id; 

-- 8. Average salary per job role
select job_id, avg(salary) as Average_salary 
from hr.EMPLOYEES
group by job_id; 

-- 9. Departments with more than 5 employees
select department_id, count(*)
from hr.EMPLOYEES
group by DEPARTMENT_ID 
having count(*)>=5;

-- 10. Departments where total salary > 100,000
select department_id, sum(SALARY) as total_salary
from hr.EMPLOYEES
group by DEPARTMENT_ID 
having sum(SALARY)>100000;

-- 11. Departments where average salary > 50,000
select department_id, avg(SALARY) as Average_salary
from hr.EMPLOYEES
group by DEPARTMENT_ID 
having avg(SALARY)>50000;

-- 12. Departments where max salary > 80,000
select department_id, MAX(SALARY) as Maximum_salary
from hr.EMPLOYEES
group by DEPARTMENT_ID 
having max(SALARY)>80000;

-- 13. Departments where min salary < 30,000
select department_id, Min(SALARY) as minimum_salary
from hr.EMPLOYEES
group by DEPARTMENT_ID 
having min(SALARY)<30000;

-- 14. Departments where number of employees is between 5 and 10
select department_id, count(*)
from hr.EMPLOYEES
group by DEPARTMENT_ID 
having count(*) between 5 and 10;

-- 15. Departments where salary variance > 500,000
select department_id, variance(SALARY) as var_salary
from hr.EMPLOYEES
group by DEPARTMENT_ID 
having VARIANCE(SALARY)>500000;

-- 16. Departments where salary standard deviation > 5,000
select department_id, STDDEV(SALARY) as stddev_salary
from hr.EMPLOYEES
group by DEPARTMENT_ID 
having VARIANCE(SALARY)>5000;

-- 17. Employees sorted by salary in descending order
select EMPLOYEE_ID, SALARY
from hr.EMPLOYEES
order by SALARY DESC;

-- 18. Employees sorted by department and salary
select EMPLOYEE_ID, first_name,department_id, salary
from hr.EMPLOYEES
order by salary desc, DEPARTMENT_ID asc;

-- 19. Employees sorted by last name alphabetically
SELECT employee_id, last_name
from hr.EMPLOYEES
order by last_name asc;

-- 20. Employees sorted by hire date
SELECT employee_id, first_name, hire_date
from hr.EMPLOYEES
order by hire_date asc;

-- 21. Employees sorted by commission, placing NULLs last
SELECT employee_id, COMMISSION_PCT
from hr.EMPLOYEES
order by COMMISSION_PCT NULLs last;

-- 22. Employees sorted by commission, placing NULLs first
SELECT employee_id, COMMISSION_PCT
from hr.EMPLOYEES
order by COMMISSION_PCT desc;

-- 23. Employees sorted by length of first name
SELECT employee_id, first_name
from hr.EMPLOYEES
order by length(FIRST_NAME);

-- 24. Employees sorted by last two characters of last name
SELECT employee_id, last_name
from hr.EMPLOYEES
order by substr(last_NAME, -2);

-- 25. Employees sorted by uppercase first name
SELECT employee_id, upper(first_name)
from hr.EMPLOYEES
order by upper(FIRST_NAME) ;

-- 26. Employees sorted by salary after adding a bonus
select EMPLOYEE_ID, SALARY
from hr.EMPLOYEES
order by (SALARY +500) DESC;

-- 27. Employees sorted by job ID and last name
SELECT employee_id, job_id, last_name
from hr.employees
order by job_id , LAST_NAME,

-- 28. Employees sorted by department, then by first name
select DEPARTMENT_ID, employee_id, job_id, FIRST_NAME
from hr.employees
order by department_id asc, first_NAME;

-- 29. Employees with IT_PROG job role first
SELECT employee_id, first_name, job_id
FROM hr.employees
ORDER BY CASE WHEN job_id = 'IT_PROG' THEN 1 ELSE 2 END;
-- ****ALTERNATIVES (BUT IT WILL ONLY SHOW THE 'IT_PROG'****
SELECT employee_id, first_name, job_id
from hr.employees
where job_id='IT_PROG';

-- 30. Employees with priority to salaries above 5000
select employee_id, SALARY
from hr.employees
order by case when salary>5000 then 1 else 2 END;

-- 31. Departments where total salary between 50,000 and 200,000
select department_id, sum(salary)
from hr.employees
group by department_id
having sum(salary) between 50000 and 200000;

-- 32. Departments where max salary is at least double the min salary
select department_id, max(salary) as Double_minsalary
from hr.employees
group by department_id
having max(salary)=(2* min(salary)); 

-- 33. Employees in department 50 at the top
select employee_id, department_id, first_NAME
from hr.employees
order by case when department_id=50 then 1 else 2 end;

-- 34. Employees sorted by highest salary ratio
select employee_id, max(SALARY)/avg(salary) as SAL_RATIO
from hr.Employees
group by EMPLOYEE_ID
order by sal_ratio desc;
-- **** different output****
SELECT department_id, MAX(salary) / AVG(salary) AS salary_ratio
FROM hr.employees
GROUP BY department_id
HAVING MAX(salary) / AVG(salary) > 1.5
ORDER BY salary_ratio DESC;

-- 35. Employees sorted by job ID then salary
SELECT employee_id, first_name, salary, job_id
FROM hr.employees
ORDER BY job_id ASC, salary DESC;

-- 36. Employees sorted by highest commission first
SELECT employee_id, first_name, COMMISSION_PCT
from hr.EMPLOYEES
order by COMMISSION_PCT desc nulls last;

-- 37. Employees sorted by salary, keeping those with no commission at the bottom
SELECT employee_id, first_name, salary, commission_pct
FROM hr.employees
ORDER BY CASE WHEN commission_pct IS NULL THEN 2 ELSE 1 END, salary DESC;

-- 38. Employees sorted by department and descending salary
SELECT employee_id, first_name, department_id, salary
FROM hr.employees
ORDER BY department_id ASC, salary DESC;

-- 39. Employees where more than 50% earn above 60,000
SELECT job_id, COUNT(CASE WHEN salary > 60000 THEN 1 END) * 1.0 / COUNT(*) AS high_earner_ratio
FROM hr.employees
GROUP BY job_id
HAVING COUNT(CASE WHEN salary > 60000 THEN 1 END) > COUNT(*) / 2;

-- 40. Departments where IT and HR salaries sum to 80,000 or more
SELECT department_id, SUM(CASE WHEN job_id IN ('IT_PROG', 'HR_REP') THEN salary ELSE 0 END) AS it_hr_salary
FROM hr.employees
GROUP BY department_id
HAVING SUM(CASE WHEN job_id IN ('IT_PROG', 'HR_REP') THEN salary ELSE 0 END) >= 80000;