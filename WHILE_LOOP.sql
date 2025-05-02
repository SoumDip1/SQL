-- WHILE LOOP:~
DECLARE
    x number:=1;
    BEGIN
        while x <5 LOOP
        DBMS_OUTPUT.PUT_LINE (x);
        x :=x+1;
end loop;
end;

-- printing odd
DECLARE
    x number :=1;
    BEGIN
        WHILE x<=10 loop
        DBMS_OUTPUT.PUT_LINE (x);
        x := x+2;
    end LOOP;
end;

-- print in reverse 
DECLARE
    x NUMBER := 10;
    BEGIN
        WHILE x>=1 LOOP
        DBMS_OUTPUT.PUT_LINE (x);
        x := x-1;
    end LOOP;
end; 
-- ODD in reverse
DECLARE
    x number :=9;
    BEGIN
        WHILE x>=1 loop
        DBMS_OUTPUT.PUT_LINE (x);
        x := x-2;
    end LOOP;
end;
-- CONTINUE and EXIT
DECLARE
    x number:=1;
    BEGIN
        while x <=10 LOOP
            IF x=5 THEN
                x:=x+1;
                CONTINUE;
            END IF;
        DBMS_OUTPUT.PUT_LINE (x);
        x :=x+1;
    end loop;
end;
-- EXIT
DECLARE
    x number:=1;
    BEGIN
        while x <=10 LOOP
            IF x=5 THEN
                x:=x+1;
                EXIT;
            END IF;
        DBMS_OUTPUT.PUT_LINE (x);
        x :=x+1;
    end loop;
end;
-- using modulus
DECLARE
    i number:=2;
    BEGIN
        WHILE i<=10 LOOP
            IF mod(i,2)=1 THEN
                EXIT;
            end if;
        DBMS_OUTPUT.PUT_LINE (i);
        i:=i+1;
    end loop;
end;

-- NOT DIVISIBLE BY 3
declare
    i number:= 1;
    BEGIN
        WHILE i<=60 LOOP
            IF mod(i,3)=0 THEN
                i:=i+1;
                CONTINUE;
            end if;
        DBMS_OUTPUT.PUT_LINE ('NOT divisible by 3'||' '||i);
        i:=i+1;
    end loop;
end;
-- EXAMPLE
DECLARE
    i NUMBER:= 1;
    sum NUMBER:= 0;
    BEGIN
        while i<=10 LOOP
        sum:= sum+i;
            IF sum>10 THEN
                EXIT;
            END IF;
        DBMS_OUTPUT.PUT_LINE (sum);
        i:=i+1;
    END LOOP;
END;
-- skipping particular values
declare
    i number:= 1;
    BEGIN
        WHILE i<=5 LOOP
            IF i IN (2,4) THEN
                i:=i+1;
                CONTINUE;
            end if;
        DBMS_OUTPUT.PUT_LINE ('i:'||' '||i);
        i:=i+1;
    end loop;
end;