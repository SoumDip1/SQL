-- CREATING FUNCTION:~
CREATE or REPLACE FUNCTION pf_calc (salary NUMBER)
return NUMBER
is
bonus NUMBER;
BEGIN
    IF salary>5000 THEN
        bonus:= salary*0.10;
    ELSE
        bonus:= salary*0.15;
    end IF;
    RETURN bonus;
end;
-- calling the function using the HR schema and hr.employees table
SELECT pf_calc(salary) from hr.EMPLOYEES where EMPLOYEE_ID=101;
-- calling the function using the dual table
select pf_calc(20000) from dual;

-- Create a function to check the age of the user and return the result of the eligibility for voting
CREATE or REPLACE FUNCTION check_age (age number)
return varchar2
is
BEGIN
    if age>18 THEN
        return ('eligible for voting');
    ELSE
        return ('not eligible for voting');
    end IF;
end;

select check_age (17) from dual;
SELECT check_age (19) from dual;
 
-- to print the full_name of an employee where the employee_id is user given
create or replace FUNCTION full_name(first_name VARCHAR2, last_name VARCHAR2)
RETURN varchar2
is
BEGIN
    return first_name||' '||last_name;
end;

SELECT FULL_NAME(FIRST_NAME,LAST_NAME) from hr.employees where EMPLOYEE_ID = 101;

-- another way
create or replace FUNCTION full_name(emp_id number)
RETURN VARCHAR2
is
full_name varchar2(100);
BEGIN
    SELECT first_name|| ' ' || last_name into full_name 
    from hr.employees
    where EMPLOYEE_ID=emp_id;
    RETURN full_name;
END;

SELECT full_name(101) from hr.employees;

-- factorial
CREATE or REPLACE FUNCTION factorial(n number)
return NUMBER
is 
output number:= 1;
BEGIN
    for i in 1..n loop
        output := output*i;
    end loop;
    return output;
END;

select factorial(5) from dual;

-- COunt of vowel
create or replace FUNCTION count_vowel(str varchar2)
return number
is
counter number := 0;
BEGIN
    for i in 1..length(str) loop
        if substr((str),i,1) in ('a','e','i','o','u','A','E','I','O','U') then
            counter:= counter+1;
        END if;
    end loop;
    return counter;
END;

select COUNT_VOWEL('DATA Science') from dual;

-- CALCULATE AGE
CREATE or REPLACE FUNCTION calculate_age (DOB date)
return NUMBER
IS
age number;
BEGIN
    age:= abs(months_BETWEEN (sysdate, DOB)/12);
    return age;
END;

SELECT CALCULATE_AGE(to_date('03/12/1994','dd/mm/yyyy')) from dual;