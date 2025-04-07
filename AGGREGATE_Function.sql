SELECT * from hr.EMPLOYEES;
SELECT count(*) from hr.EMPLOYEES;
SELECT COUNT(department_id), COUNT(distinct department_id) from hr.EMPLOYEES;

-- DESCRIPTIVE STATISTICS
SELECT avg(salary), min(salary), max(salary), STDDEV(salary), variance(salary)from hr.EMPLOYEES;

SELECT department_id, count(*) from hr.EMPLOYEES group by DEPARTMENT_ID;
SELECT DEPARTMENT_ID, count(distinct job_id) from hr.EMPLOYEES group by department_id;

select department_id, avg(salary) from hr.EMPLOYEES group by DEPARTMENT_ID;
select department_id, sum(salary) from hr.EMPLOYEES group by DEPARTMENT_ID;
select department_id, min(salary) from hr.EMPLOYEES group by DEPARTMENT_ID;
select department_id, max(salary) from hr.EMPLOYEES group by DEPARTMENT_ID;
select department_id, stddev(salary) from hr.EMPLOYEES group by DEPARTMENT_ID;
select department_id, VARIANCE(salary) from hr.EMPLOYEES group by DEPARTMENT_ID;