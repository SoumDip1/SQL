-- 3. Handling No Data Found Exception
DECLARE
    emp_salary NUMBER;
BEGIN
    BEGIN
        SELECT salary into emp_salary from hr.employees where EMPLOYEE_ID= 999;
        DBMS_OUTPUT.PUT_LINE (emp_salary);
    EXCEPTION
        when no_data_found then
        DBMS_OUTPUT.PUT_LINE ('no employee found with this ID');
    END;
END;

-- 6. Fetching MAX Salary
DECLARE
    max_salary NUMBER;
    BEGIN
        SELECT max(salary) into max_salary from hr.employees;
        DBMS_OUTPUT.PUT_LINE (max_salary);
END;

-- 7. Fetching MIN Salary
DECLARE
    min_salary NUMBER;
    BEGIN
        SELECT min(salary) into min_salary from hr.employees;
        DBMS_OUTPUT.PUT_LINE (min_salary);
END;

-- 8. Fetching AVG Salary
DECLARE
    avg_salary NUMBER;
    BEGIN
        SELECT avg(salary) into avg_salary from hr.employees;
        DBMS_OUTPUT.PUT_LINE (avg_salary);
END;

-- 9. Fetching Employee Name Using Subquery
DECLARE
    emp_name VARCHAR2(100);
    BEGIN
        SELECT (FIRST_NAME||' '||LAST_NAME) into emp_name from hr.employees
        where employee_id= (Select min(employee_id) from hr.employees);
        DBMS_OUTPUT.PUT_LINE (emp_name);
END;

-- 10. Fetching Data Using EXISTS
DECLARE
    emp_exists VARCHAR2(20);
    BEGIN
        Select case when employee_id=103
        then 'EXISTS' else 'DOES NOT EXISTS'
    END
    into emp_exists from hr.EMPLOYEES where EMPLOYEE_ID=103;
    DBMS_OUTPUT.PUT_LINE(emp_exists);
END;

-- 11. Selecting Employee with Highest Salary
DECLARE
    emp_id NUMBER;
    emp_name VARCHAR2(100);
    BEGIN
        SELECT EMPLOYEE_ID,first_name into emp_id,emp_name from hr.employees
        where salary=(SELECT max(salary) from hr.employees);
        DBMS_OUTPUT.PUT_LINE (emp_id|| ' ' ||emp_name);
END;

-- 12. Fetching Department Name
DECLARE
    dept_name VARCHAR2(20);
    BEGIN
        Select d.Department_name into dept_name from hr.employees e
        inner join hr.departments d on e.Department_id=d.department_id
        where e.Department_id= 10;
        DBMS_OUTPUT.PUT_LINE (dept_name);
END;

-- 13. Fetching Employee Count in a Department
DECLARE
    emp_count number;
    BEGIN
        Select count(*) employee_id into emp_count from hr.employees
        where department_id= 100;
        DBMS_OUTPUT.PUT_LINE (emp_count);
END;

-- 14. Fetching Sum of All Salaries
DECLARE
    total_salary NUMBER;
    BEGIN
        select sum(salary) into total_salary from hr.EMPLOYEES;
        DBMS_OUTPUT.PUT_LINE (total_salary);
end;

-- 15. Fetching Employee Joining Date
DECLARE
    joining_date date;
    BEGIN
        select hire_date into joining_date from hr.employees
        where EMPLOYEE_ID=101;
        DBMS_OUTPUT.PUT_LINE (joining_date);
END;

-- 16. Selecting Second Highest Salary
DECLARE
    Second_highest_Salary NUMBER;
    BEGIN
        Select max(salary) into Second_highest_Salary from hr.employees
        where salary<(SELECT max(salary) from hr.employees);
        DBMS_OUTPUT.PUT_LINE (Second_highest_Salary);
END;

-- 17. Selecting Employees with Same Salary as John
DECLARE
    emp_count NUMBER;
    BEGIN
        select count(*) into emp_count from hr.EMPLOYEES
        where salary=(select salary from hr.employees where first_name= 'John');
        DBMS_OUTPUT.PUT_LINE (emp_count);
END;

-- 18. Fetching Manager Name of an Employee
DECLARE
    manager_name VARCHAR2 (30);
    BEGIN
        SELECT m.FIRST_NAME|| ' ' ||m.last_name into manager_name from hr.employees e
        left join hr.employees m on e.MANAGER_ID=m.EMPLOYEE_ID
        where e.EMPLOYEE_ID= 101;
        DBMS_OUTPUT.PUT_LINE (manager_name);
END;

-- 19. Fetching Number of Employees Who Earn Above Average Salary
DECLARE
    emp_count NUMBER;
    BEGIN
        SELECT count(*) employee_id into emp_count from hr.EMPLOYEES
        where salary>(select avg(salary)from hr.EMPLOYEES);
        DBMS_OUTPUT.PUT_LINE (emp_count);
END;

-- 20. Fetching Employee Name and Role
DECLARE
    emp_name VARCHAR2 (30);
    job_role VARCHAR2 (20);
    BEGIN
        SELECT FIRST_NAME|| ' ' ||LAST_NAME , JOB_id into emp_name, job_role from hr.EMPLOYEES
        where EMPLOYEE_ID=103;
        DBMS_OUTPUT.PUT_LINE (emp_name|| ' ' ||job_role);
END;




select * from hr.employees;
