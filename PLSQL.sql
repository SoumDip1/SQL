-- This is the basic structure of PL/SQL
DECLARE
     student_name VARCHAR2(50) :='Soumyo';
Begin
    DBMS_OUTPUT.PUT_LINE ('HELLO'||' '||student_name);
END;    

-- RECORD is use for storing multiple data of different datatypes altogether
DECLARE
    type emp_record is RECORD
    (emp_id NUMBER, emp_name VARCHAR2(20), emp_salary NUMBER);
    emp emp_record;
BEGIN
    emp.emp_id:= 001;
    emp.emp_name:= 'Abhay';
    emp.emp_salary:= 25000;
    DBMS_OUTPUT.PUT_LINE (emp.emp_id||' '||emp.emp_name||' '||emp.emp_salary);
END;

-- SELECT statement in PL/SQL
DECLARE
    employee_id NUMBER ;
    emp_name VARCHAR2(100);
BEGIN
    select first_name into emp_name from hr.employees where employee_id=101;
    DBMS_OUTPUT.PUT_LINE (emp_name);
END;

-- fetching two coloumns
DECLARE
    emp_name VARCHAR2(100);
    emp_salary NUMBER ;
BEGIN
    select first_name, salary into emp_name, emp_salary from hr.employees where employee_id=101;
    DBMS_OUTPUT.PUT_LINE (emp_name);
    DBMS_OUTPUT.PUT_LINE (emp_salary);
END;

-- CASE WHEN statement in PL/SQL
DECLARE
    emp_status VARCHAR2(20);
BEGIN
    SELECT CASE WHEN salary>15000 then 'HIGH'
    else 'Low' end 
    into emp_status from hr.employees where EMPLOYEE_ID=101;
    DBMS_OUTPUT.PUT_LINE (emp_status);
END;

-- Get the total numbers of employees in hr.employee table using PL/SQL blocks
DECLARE
    number_of_rows NUMBER;
BEGIN
    SELECT count(*) into number_of_rows from hr.employees;
    DBMS_OUTPUT.PUT_LINE(number_of_rows);
END;

-- Get the range of the salary using PL/SQL blocks
DECLARE
     salary_range NUMBER;
BEGIN
    SELECT (max(salary)-min(salary)) into salary_range from hr.employees;
    DBMS_OUTPUT.PUT_LINE(salary_range);
END;
-- another way
DECLARE
    max_salary NUMBER ; min_salary NUMBER;
BEGIN
    SELECT max(salary),min(salary) into max_salary, min_salary from hr.employees;
    DBMS_OUTPUT.PUT_LINE(min_salary || ' to ' || max_salary);
    DBMS_OUTPUT.PUT_LINE(max_salary-min_salary);
END;