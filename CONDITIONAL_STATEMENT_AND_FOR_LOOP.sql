-- IF Statement:~
DECLARE
    variable1 number := 10;
    BEGIN
        if variable1>5 then
        DBMS_OUTPUT.PUT_LINE ('greater value');
    end if;
end;

-- IF_ELSE statement:~
DECLARE
    variable1 number := 1;
    BEGIN
        if variable1>5 then
        DBMS_OUTPUT.PUT_LINE ('greater value');
        else
        DBMS_OUTPUT.PUT_LINE ('lesser value');
    end if;
end;

-- CONDITIONAL Statement:~
DECLARE
    marks NUMBER:= 88;
    BEGIN
        IF marks>=90 THEN
        DBMS_OUTPUT.PUT_LINE ('GRADE A');
        ELSIF  MARKS>=70 AND MARKS<90 THEN
        DBMS_OUTPUT.PUT_LINE ('GRADE B');
        ELSIF  MARKS>=50 AND MARKS<70 THEN
        DBMS_OUTPUT.PUT_LINE ('GRADE C');
        ELSE
        DBMS_OUTPUT.PUT_LINE ('GRADE D');
    END IF;
END;

-- Get the rank on the basis of salary of an employee:~
DECLARE
    emp_name VARCHAR2(100);
    emp_sal NUMBER;
    BEGIN 
        SELECT FIRST_NAME|| ' ' ||LAST_NAME, salary into emp_name, emp_sal from hr.EMPLOYEES
        where EMPLOYEE_ID=100;
        IF emp_sal>20000 THEN
        DBMS_OUTPUT.PUT_LINE (emp_name||' '|| emp_sal || '   ' || 'high');
        ELSE
        DBMS_OUTPUT.PUT_LINE (emp_name||' '|| emp_sal || '   ' || 'low');
    end IF;
END;
-- Modified:~
DECLARE
    emp_name VARCHAR2(100);
    emp_sal NUMBER;
    grade VARCHAR2(30);
    BEGIN 
        SELECT FIRST_NAME|| ' ' ||LAST_NAME, salary into emp_name, emp_sal from hr.EMPLOYEES
        where EMPLOYEE_ID=100;
        IF emp_sal>20000 THEN
        grade:= 'high';
        ELSIF emp_sal>10000 and emp_sal<20000 THEN
        grade:= 'average';
        ELSE
        grade:= 'low';
    end IF;
    DBMS_OUTPUT.PUT_LINE (emp_name||' '|| emp_sal || '   ' || grade);
END;

-- NESTED IF Statement:~
DECLARE
    emp_name VARCHAR2(30);
    emp_sal NUMBER;
    grade VARCHAR2(20);
    BEGIN
        SELECT FIRST_NAME|| ' ' ||LAST_NAME, salary into emp_name ,emp_sal from hr.EMPLOYEES
        where EMPLOYEE_ID = 101;
        IF emp_sal>20000 THEN
            grade:= 'HIGH';
                IF emp_sal>22000 THEN
                grade:= 'VERY HIGH';
            END IF;
        ELSIF emp_sal>10000 and emp_sal<20000 THEN
            grade:= 'MEDIUM';
        ELSE
            grade:= 'LOW';
        END IF;   
    DBMS_OUTPUT.PUT_LINE(emp_name||' '|| emp_sal || '   ' || grade);
END;

    -- LOOP:~
DECLARE
    v_counter NUMBER := 1;
    BEGIN
        LOOP
            DBMS_OUTPUT.PUT_LINE (v_counter);
            v_counter := v_counter + 1;
            Exit when v_counter>5;
        END LOOP;
END;  

-- PRINT THE ODD NUMBERS BETWWEN 1 TO 5 USING LOOP:~
DECLARE
    v_counter NUMBER := 1;
        BEGIN
        LOOP
            IF MOD (v_counter,2)!=0 THEN
                DBMS_OUTPUT.PUT_LINE (v_counter);
            END IF;
            v_counter := v_counter + 1;
            Exit when v_counter>5;
        END LOOP;
END;
-- Another way
DECLARE
    v_counter NUMBER := 1;
        BEGIN
        LOOP
            DBMS_OUTPUT.PUT_LINE (v_counter);
            v_counter := v_counter + 2;
            Exit when v_counter>5;
        END LOOP;
END;
-- ODD in reverse
DECLARE
    v_counter NUMBER := 9;
        BEGIN
        LOOP
            DBMS_OUTPUT.PUT_LINE (v_counter);
            v_counter := v_counter - 2;
            Exit when v_counter<1;
        END LOOP;
END;
-- Another way
DECLARE
    v_counter NUMBER := 10;
        BEGIN
        LOOP
            IF MOD (v_counter,2)!=0 THEN
                DBMS_OUTPUT.PUT_LINE (v_counter);
            END IF;
            v_counter := v_counter - 1;
            Exit when v_counter<1;
        END LOOP;
END;

-- PRINT THE MULTIPLE OF 4 BETWEEN 1 TO 100:~
DECLARE
    v_counter NUMBER := 1;
        BEGIN
        LOOP
            DBMS_OUTPUT.PUT_LINE (v_counter*4);
            v_counter := v_counter + 1;
            Exit when v_counter>25;
        END LOOP;
END;
-- Another way
DECLARE
    v_counter NUMBER := 1;
        BEGIN
        LOOP
            DBMS_OUTPUT.PUT_LINE (v_counter*4);
            v_counter := v_counter + 1;
            Exit when (v_counter*4)>100;
        END LOOP;
END;

    -- FOR LOOP:~
-- EX:1 Forward order
BEGIN
    for i in 1..5 loop
    DBMS_OUTPUT.PUT_LINE (i);
end loop;
end;
-- EX:1 reverse order
BEGIN
    FOR i in reverse 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE (i);
end loop;
end;
-- EVEN
BEGIN
    FOR i in reverse 1..10 LOOP
        IF MOD (i,2)= 0 THEN
            DBMS_OUTPUT.PUT_LINE (i);
        END IF;
    end loop;
end;
-- ODD
BEGIN
    FOR i in reverse 1..10 LOOP
        IF MOD (i,2) != 0 THEN
            DBMS_OUTPUT.PUT_LINE (i);
        END IF;
    end loop;
end;
-- PRINT THE SQUARES IF THE NUMBERS FROM 1 TO 10 USING FOR LOOP
BEGIN
    FOR i in 1..10 LOOP
        DBMS_OUTPUT.PUT_LINE (i*i);
end loop;
end;
-- FIBONACCI SERIES USING FOR LOOP
DECLARE
    a number:=0;
    b number:=1;
    c number;
BEGIN
    DBMS_OUTPUT.PUT_LINE (a);
    DBMS_OUTPUT.PUT_LINE (b);
    FOR i in 0..10 LOOP
        c := a+b;
        DBMS_OUTPUT.PUT_LINE (c);
        a:=b;
        b:=c; 
end loop;
end;
-- MULTIPLICATION TABLE
DECLARE
    a number:=1;
    BEGIN
        for n in 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE ('Multiplication of'||' '||n);
            for i in 1..10 LOOP
            DBMS_OUTPUT.PUT_LINE (n||'*'||i||':'||n*i);
            end loop;
        end loop;
end;