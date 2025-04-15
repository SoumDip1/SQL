-- 1. Count the number of employees in each department
-- this query will group by the department_id and count the number of employees from each the department
Select count(employee_id) as Total_Employees,department_id
from hr.EMPLOYEES
group by DEPARTMENT_ID;

-- 2. Find the average salary in each department
-- this query will group by the department_id then calculate the average of the salary from each department
SELECT DEPARTMENT_ID, AVG(SALARY) AS AVG_SALARY
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 3. Find the maximum and minimum salary in each department
-- this query will group by the department_id then fetch the minimum and maximum of the salary from each department
SELECT DEPARTMENT_ID, max(SALARY) AS MAX_SALARY, min(SALARY) as MIN_SAlARY
FROM HR.EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- 4. Find the total salary paid in each department
-- this query will group by the department_id then calculate the total of the salary from each department
SELECT department_id, SUM(SALARY) as total_SALARY
from hr.EMPLOYEES
group by DEPARTMENT_ID;

-- 5. Count the number of employees in each job role
-- this query will group by the job_id and count the number of employees from each the job role
SELECT job_id, count(employee_id) as Total_Employees
from hr.EMPLOYEES
group by job_id;

-- 6. Find the average salary for each job role
-- this query will group by the job_id then calculate the average of the salary from each job role
SELECT job_ID, AVG(SALARY) AS AVG_SALARY
FROM HR.EMPLOYEES
GROUP BY job_id;

-- 7. Find the maximum salary for each job role
-- this query will group by the department_id then fetch the maximum of the salary from each job role
SELECT JOB_ID, max(SALARY) AS MAX_SALARY
FROM HR.EMPLOYEES
GROUP BY job_id;

-- 8. Find the minimum salary for each job role
-- this query will group by the department_id then fetch the minimum of the salary from each job role
SELECT JOB_ID, min(SALARY) AS MIN_SAlARY
FROM HR.EMPLOYEES
GROUP BY job_id;

-- 9. Find the total salary paid for each job role
-- this query will group by the job_id then calculate the total of the salary from each job role
SELECT job_id, SUM(SALARY) as total_SALARY
from hr.EMPLOYEES
group by JOB_ID;

-- 10. Count the number of employees hired in each year
-- it will extract the year from the hire date, then will calculate the total number of the employees by each year
SELECT extract (year from HIRE_DATE) as HIRE_YEAR ,count(employee_id)
from hr.EMPLOYEES
group by extract (year from HIRE_DATE);
order by HIRE_YEAR desc;

-- 11. Find the total salary paid in each location
-- Select extract(timezone_region from HIRE_DATE) as location, sum(salary) as total_SALARY
-- from hr.EMPLOYEES
-- group by extract(timezone_region from HIRE_DATE)
-- order by location;

-- 12. Find the number of employees in each manager's team
-- it will filter the null value of the manager_id first then will count the total of the employees of each manager_id
SELECT manager_id, count(employee_id) 
from hr.EMPLOYEES
where manager_id is not null
group by manager_id;

-- 13. Find the highest salary for each manager
-- this query will group by the manager_id then fetch the maximum of the salary from each manager_id
SELECT manager_id, max(SALARY) as highest_salary
from hr.EMPLOYEES
where manager_id is not null
group by manager_id;

-- 14. Find the average salary for each manager's team
-- this query will group by the manager_id then fetch the average of the salary from each manager_id
SELECT manager_id, avg(SALARY) as average_salary
from hr.EMPLOYEES
where manager_id is not null
group by manager_id;

-- 15. Count the number of employees hired in each month of the year
-- it will extract the month from the hire date, then will calculate the total number of the employees by each month
select extract(month from HIRE_DATE) as Hire_Month, count(employee_id) as EMPLOYEE
from hr.employees
group by extract(month from HIRE_DATE)
order by Hire_Month;

-- 16. Find the department with the highest total salary
-- it will group by the department then calculate the sum of the salaries after that return the first row as result
SELECT DEPARTMENT_ID, sum(salary) as total_SALARY
from hr.EMPLOYEES
where department_id is not null
group by DEPARTMENT_ID
order by total_SALARY desc
fetch first 1 row only;

-- 17. Find the job role with the highest average salary
-- it will group by the job role then calculate the average of the salaries after that return the first row as result
SELECT Job_ID, avg(salary) as avg_SALARY
from hr.EMPLOYEES
group by job_ID
order by avg_SALARY desc
fetch first 1 row only;

-- 18. Find the number of employees in each city

-- 19. Find the number of employees who have a commission, grouped by department
-- it will group by the department and then will count the employees by segregating the null value of the commission_pct
Select department_id, count(EMPLOYEE_ID) as employee_commission
from hr.employees
where commission_PCT is not null
group by department_id;

-- 20. Find the sum of salaries for employees who have a commission, grouped by department
-- it will group by the department and then will calculate the total salary by segregating the null value of the commission_pct
Select department_id, sum(salary) as total_salary_commision
from hr.employees
where commission_PCT is not null
group by department_id;


select * from sh.sales;
-- 1. Count the number of sales transactions for each product
-- it will group by the Product_id and then count the total sales of each product
Select prod_id, count(quantity_sold) as Sales_transaction
from sh.sales
group by prod_id;

-- 2. Find the average sale amount for each product.
-- it will group by the Product_id and then calculate the average sale amount of each product
Select prod_id, avg(amount_sold) as avg_Sale_amount
from sh.sales
group by prod_id;

-- 3. Find the maximum and minimum sale amount for each product.  
-- it will group by the Product_id and then find the maximum sale amount and minimum sale amount of each product
Select prod_id, max(amount_sold) as Max_Sale_amount, min(amount_sold) as Min_Sale_amount
from sh.sales
group by prod_id;

-- 4. Find the total revenue generated by each product. 
-- it will group by the Product_id and then calculate the total of the sale amount of each product
Select prod_id, sum(amount_sold) as total_revenue
from sh.sales
group by prod_id;

-- 5. Count the number of sales transactions for each customer. 
-- it will group by the cust_id and then count the sales for each customer 
SELECT cust_id, COUNT(QUANTITY_SOLD) AS sales_transactions
FROM sh.sales
GROUP BY cust_id;

-- 6. Find the average sale amount per customer.
-- it will group by the cust_id and then calculate the average sale amount for each customer
Select CUST_ID, avg(amount_sold) as avg_Sale_amount
from sh.sales
group by CUST_ID;

-- 7. Find the highest purchase amount for each customer.
-- it will group by cust_id then fetch the max amount purchased by customer from amount_sold
SELECT CUST_ID, max(amount_sold) as highest_amount
from sh.sales
group by cust_id
order by highest_amount desc


-- 8. Find the lowest purchase amount for each customer.
-- it will group by cust_id then fetch the min amount purchased by customer from amount_sold
SELECT CUST_ID, min(amount_sold) as lowest_amount
from sh.sales
group by cust_id
order by lowest_amount asc;

-- 9. Find the total revenue generated by each store location.
-- select extract(timezone from time_id) as store_location, sum(amount_sold)
-- from sh.sales
-- group by extract(timezone from time_id);

-- 10. Count the number of sales transactions for each region.
-- it will group by the time_id and then count the quantity_sold
SELECT time_id, count(quantity_sold) as sales_transactions
from sh.sales
group by time_id;

-- 11. Find the total revenue per region.
-- it will group by the time_id and then calculate the sum of the amount_sold
SELECT time_id, sum(amount_sold) as total_revenue
from sh.sales
group by time_id;

-- 12. Find the average sale amount per region.
-- it will group by the time_id and then calculate the avg of the amount_sold
SELECT time_id, avg(amount_sold) as avg_sale_amount
from sh.sales
group by time_id;

-- 13. Count the number of sales per month.
-- it will extract the month from the time_id and then count the quantity_sold per month
select extract(month from time_id) as Month, count(quantity_sold) as sales_per_month
from sh.sales
group by extract(month from time_id);

-- 14. Find the total revenue per month.
-- it will extract the month from the time_id and then calculate the amount_sold per month
select extract(month from time_id) as Month , sum(amount_sold) revenue_per_month
from sh.sales
group by extract(month from time_id)
order by month asc;

-- 15. Find the product that generated the highest revenue.
-- it will group by the prod_id then calculate the sum of amount_sold, sort by highest_revenue and then return the 1st row of the result 
Select prod_id, sum(amount_sold) as highest_revenue
from sh.sales
group by prod_id
order by highest_revenue desc
FETCH FIRST 1 ROWS ONLY;

-- 16. Find the most frequently purchased product.
-- it will group by the prod_id then count the time_id, sort by frequently_purchase and return the 1st row of the result
select prod_id, count(TIME_ID) as frequently_purchase
from sh.sales
group by prod_id
order by frequently_purchase desc
FETCH FIRST 1 ROWS ONLY;

-- 17. Find the most valuable customer based on total spending. 
-- it will group by the cust_id then calculate the total amount_sold, sort and return the 1st row of the result
select cust_id, sum(amount_sold) as total_spending
from sh.sales
group by CUST_id
order by total_spending desc
FETCH FIRST 1 ROWS ONLY;

-- 18. Find the total revenue per sales channel
-- it will group by the channel_id and calculate the sum of amount_sold per channel_id
select channel_id, sum(amount_sold) as total_revenue
from sh.sales
group by channel_id;

-- 19. Count the number of sales for each payment method.  
-- it will group by the promo_id and count the quantity_sold per promo_id
select PROMO_ID, count(quantity_sold) as total_sale
from sh.sales
group by promo_id;

-- 20. Find the total revenue generated per payment method.
-- it will group by the promo_id and calculate the sum of amount_sold per promo_id
select PROMO_ID, sum(amount_sold) as total_revenue
from sh.sales
group by PROMO_ID;

-- ****Question number 11 and 18 from hr.employee table and question number 09 from sh.sales table are not cleared****
