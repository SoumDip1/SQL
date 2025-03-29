-- **** TIMEBASE FUNCTIONS ****
SELECT sysdate from dual;
-- **to get the system date
SELECT systimestamp from dual;
-- **to get the syatem time stamp
SELECT current_date from dual;
-- **to get the current date 
SELECT dbtimezone from dual;
-- **to get the timezone (which usually returns the UTC +00:00 format)
SELECT sysdate, sysdate+7 as nex_tweek, sysdate-7 as previous_week from dual;
SELECT hire_date, hire_date+7 as next_week from hr.EMPLOYEES; 
-- **to get the dates of next week or the previous week
SELECT systimestamp, systimestamp+ INTERVAL '3' hour from dual;
-- **to add hours to sysdate WE USE "INTERVAL COMMAND"(same code for minutes or seconds)
-- **it follows the format of DATE:(YYYY-MM-DD), T=SEPARATOR(START OF THE TIME COMPONENT), HH:MM:SS:MICROSECONDS, Z= ZULU TIME FORMAT
SELECT hire_date, extract(year from hire_date), extract(month from hire_date), extract(day from hire_date) as day from hr.EMPLOYEES
-- **this process is called as "feature engineering" which performs the modificaton of the coloumn
SELECT add months (sysdate,6) from dual;
--  **this is a inbuilt functiion 
SELECT hire_date, last_day(hire_date) from hr.EMPLOYEES;
SELECT sysdate, next_day(sysdate, 'Friday') from dual;
-- **to get the date of the given DAY
SELECT months_between(sysdate, hire_date) from hr.EMPLOYEES; 
SELECT abs(months_between(sysdate, hire_date))/12 as yearsofexperience from hr.EMPLOYEES; 
-- **to get the difference between the current date and the last hire date. it is devided by 12 just to get in the form of year.
SELECT to_char(sysdate, 'day') from dual;
-- **to convert the date to a form of DAY.
SELECT nvl (null, 'data engineer')from dual;
-- **to replace the null value with any character NVL function is used
SELECT nvl (null, 33)from dual;
-- **same function is applicable for integer also
SELECT nvl2 (null, 'if_has_null_value', 'if_has_not')
-- **it will check the entire coloumn if there is a null value it eill change with the given one
SELECT coalesce (null, null, 340,987,09) from dual;
-- **it rerurn the 1st non null value (as here the first two values are null it has returned the 3rd non null)
SELECT nvl2 (hire_date, sysdate) from hr.employees;

-- PRACTICE SESSION USING SH.SALES
SELECT * from sh.sales;
SELECT * sysdate from SH.SALES;
SELECT current_date from sh.SALES;
SELECT current_timestamp from sh.SALES;
SELECT dbtimezone from sh.SALES;
SELECT sessiontimezone from sh.SALES;
SELECT sysdate, sysdate+7 as next_week from sh.SALES;
SELECT sysdate, sysdate-17 as past_17 from sh.SALES;
SELECT systimestamp,systimestamp+ INTERVAL '2' hour from sh.SALES;
SELECT systimestamp,systimestamp+ INTERVAL '2' minute from sh.SALES;
SELECT systimestamp,systimestamp+ INTERVAL '2' second from sh.SALES;
SELECT systimestamp,systimestamp+ INTERVAL '2' year from sh.SALES;
SELECT systimestamp,systimestamp+ INTERVAL '2' day + INTERVAL '4' hour from sh.SALES;
SELECT TIME_ID, extract(year from TIME_ID), extract(month from TIME_ID), extract(day from TIME_ID) as day from sh.SALES;
SELECT TIME_ID, last_day(TIME_ID) from sh.SALES;