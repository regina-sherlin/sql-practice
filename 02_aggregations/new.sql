-- For each department id, return the highest and the lowest salary. 
-- Ignore employees who have no department.


-- SELECT dept_id, MAX(salary) as max_salary, MIN(salary) as min_salary
-- FROM Employees
-- WHERE dept_id is not null
-- GROUP by dept_id

-- 3. Return the names of employees hired before 2022, together with their department name. 

-- SELECT e.emp_name , d.dept_name
-- FROM Employees e 
-- join Departments d
-- 	ON e.dept_id = d.dept_id
-- WHERE hire_date < '2022-01-01'


-- For each order status, return the number of orders and the total amount. 

-- SELECT 
-- 	status,
-- 	COUNT(*) as number_of_orders, 
-- 	SUM(amount) as total_amount
-- FROM Orders
-- GROUP by status;


--  Return the names of customers who have not placed any orders. 

-- SELECT c.cust_name
-- FROM Customers c
-- LEFT join Orders o 
-- 	ON c.cust_id = o.cust_id
--     WHERE o.order_id IS NULL ;


-- Return the cities that have more than one customer, together with the customer count.  

-- SELECT city, COUNT(cust_id) as customer_count
-- FROM Customers
-- GROUP BY city
-- HAVING COUNT(cust_id) > 1;

-- --Return the name and salary of the employee or employees with the lowest salary in the company.

-- SELECT emp_name, salary
-- FROM Employees
-- WHERE salary = (
-- 	SELECT MIN(salary) 
--   	FROM Employees
-- )


-- Using a CTE: return each department name with its average salary, 
-- keeping only departments whose average salary is below the company-wide average salary.
-- with AVG_SALARY_DEPT AS (
--   SELECT 
--       AVG(salary) as average_salary_by_dept,
--       dept_id
--   FROM Employees
--   GROUP by dept_id
-- )
-- SELECT d.dept_name, a.average_salary_by_dept
-- FROM Departments d 
-- JOIN AVG_SALARY_DEPT a 
-- 	on d.dept_id = a.dept_id
-- WHERE a.average_salary_by_dept < (
-- 	SELECT avg(salary)
--   	FROM Employees
-- );

-- Return the names of customers who placed at least one order in 2023 
-- and at least one order in 2024. 

-- SELECT c.cust_name
-- FROM Customers c 
-- WHERE c.cust_id in (
-- 	SELECT cust_id
--   	FROM Orders
--   	WHERE order_date >= '2023-01-01' AND order_date < '2024-01-01'
-- ) and c.cust_id in (
-- 	SELECT cust_id
--   	FROM Orders
--   	WHERE order_date >= '2024-01-01' AND order_date < '2025-01-01'
-- ) 


-- -- Return the number of employees whose salary is not recorded.  

-- SELECT COUNT(*) as count_unrecorded_salary
-- FROM Employees
-- WHERE salary IS NULL;

-- -- Return every customer name with their number of orders, 
-- -- including customers who have placed no orders. 

-- SELECT c.cust_name,
-- 	COUNT(o.order_id) as order_count
-- FROM Customers c 
-- LEFT JOIN Orders o 
-- 	on c.cust_id = o.cust_id
-- GROUP by c.cust_id, c.cust_name

-- Return the names and salaries of employees who earn 
-- exactly the same salary as at least one other employee.



-- SELECT emp_name, salary
-- FROM Employees 
-- WHERE salary in ( 
-- 	SELECT salary
--     FROM Employees
--     GROUP by salary
--     having COUNT(*) > 1
-- );

-- NUMBER OF RETURNED ORDERS 

-- SELECT COUNT(*) as returned_count
-- FROM Orders
-- WHERE status = 'returned'

-- Return the total salary of employees hired in 2023. 
-- SELECT SUM(salary)
-- FROM Employees 
-- WHERE hire_date >= '2023-01-01' and hire_date < '2024-01-01'

-- -- For each department id, return the average salary. Ignore employees with no department.  

-- SELECT AVG(salary)
-- FROM Employees 
-- WHERE dept_id IS NOT NULL
-- GROUP by dept_id


-- Return the customer ids whose total order amount is at least 2000. 

-- SELECT cust_id, sum(amount) as total_order_amount
-- FROM Orders 
-- GROUP by cust_id
-- HAVING sum(amount) >= 2000

-- Return the customer ids whose total order amount is at least 2000. 

-- SELECT cust_id, SUM(amount)
-- FROM Orders
-- GROUP by cust_id
-- HAVING sum(amount) >= 2000


-- Return the statuses that have more than 2 orders. 
-- SELECT status
-- FROM Orders
-- GROUP BY status
-- HAVING COUNT(*) > 2;



-- -- Return the department ids that have exactly 3 employees.  

-- SELECT dept_id
-- FROM Employees
-- GROUP BY dept_id
-- HAVING COUNT(*) = 3


-- Return the order id and amount of orders whose amount is above the average order amount 

-- SELECT order_id, amount
-- FROM Orders
-- WHERE amount > (
-- 	SELECT AVG(amount)
--   	FROM Orders
-- )

-- Return the names of customers who signed up after the most recent order date.

-- SELECT cust_name
-- FROM Customers
-- WHERE signup_date >(
-- 	SELECT max(order_date)
-- 	FROM Orders
-- )

-- Return the names of employees who earn more than the highest salary in Marketing. 
-- Use the department name.

-- SELECT emp_name
-- FROM Employees 
-- WHERE salary > (
-- 	SELECT MAX(e.salary)
--   	FROM Employees e 
-- 	join Departments d 
--   	 on e.dept_id = d.dept_id
--   	WHERE d.dept_name = 'Marketing'
-- )

-- Return the names of customers who have placed more orders than Lakshmi. Use her name. 


   
-- SELECT c.cust_name
-- FROM Customers c 
-- JOIN Orders o 
-- 	ON c.cust_id = o.cust_id
-- GROUP by c.cust_name
-- HAVING COUNT(o.order_id) > (
-- 	SELECT COUNT(*)
--     FROM Orders o 
--     JOIN Customers c 
--         ON o.cust_id = c.cust_id
--     WHERE c.cust_name = 'Lakshmi'
-- )

-- Return the department ids whose employee count is smaller than Engineering's. 
-- Use the department name.

-- SELECT d.dept_id
-- FROM Departments d 
-- LEFT JOIN Employees e
-- 	ON e.dept_id = d.dept_id 
-- GROUP BY d.dept_id, d.dept_name
-- HAVING COUNT(*) < (
--     SELECT COUNT(*)
--     FROM Employees e 
--     JOIN Departments d 
--         ON e.dept_id = d.dept_id
--     WHERE d.dept_name = 'Engineering'
-- )




-- -- For each department, return the name and salary of the lowest-paid employee, including ties.

-- WITH lowest_paid as (
-- 	SELECT min(salary) as lowest_paid_salary, 
--     dept_id
--     FROM Employees
--   	GROUP by dept_id
-- )
-- SELECT e.emp_name, e.dept_id, e.salary
-- FROM Employees e
-- JOIN lowest_paid l 
-- 	ON e.dept_id = l.dept_id
-- 	and salary = l.lowest_paid_salary

-- -- Return the names of employees who earn less than the average salary of their own department.
-- with average_salary as (
--   SELECT avg(salary) as avg_salary_by_dept, dept_id
--   FROM Employees 
--   GROUP by dept_id
-- )
-- SELECT e.emp_name
-- FROM Employees e
-- JOIN average_salary a 
-- 	ON e.dept_id = a.dept_id
--     and salary < a.avg_salary_by_dept


-- Return the order id and amount of each order that is larger than that customer's average order amount.
-- with avg_amount as (
--   SELECT AVG(amount) as avg_amount_by_customer, cust_id 
--   FROM Orders
--   GROUP by cust_id)
-- SELECT order_id, amount
-- FROM Orders o 
-- JOIN avg_amount a
-- 	ON o.cust_id = a.cust_id
--     and o.amount > a.avg_amount_by_customer


-- -- Return the names of customers who have at least one returned order. 


-- SELECT cust_name
-- FROM Customers
-- WHERE cust_id in (
-- 	SELECT cust_id
-- 	FROM Orders
-- 	WHere status = 'returned'
-- )

-- -- Return the names of departments that have at least one employee hired in 2023. 

-- SELECT dept_name
-- FROM Departments
-- WHERE dept_id IN ( 
--     SELECT dept_id
--     FROM Employees
--     WHERE hire_date >= '2023-01-01' and hire_date < '2024-01-01'
-- )

-- Return the names of customers who have at least one cancelled order and at least one delivered order. 

-- SELECT cust_name 
-- FROM Customers 
-- WHERE cust_id IN (
-- 	SELECT  cust_id
--   FROM Orders
--   WHERE status = 'cancelled'
-- ) and cust_id IN (
--     SELECT cust_id
--     FROM Orders
--     WHERE status = 'delivered'
-- )


-- Return the names of customers who have never had a returned order. 

-- SELECT c.cust_name
-- FROM Customers c  
-- WHERE c.cust_id NOT IN (
--   SELECT cust_id
--   FROM Orders 
--   WHERE status = 'returned'
--   and cust_id IS NOT NULL
-- )


-- Return the names of customers who placed no orders in 2024. 

-- SELECT cust_name
-- FROM Customers
-- WHERE cust_id NOT IN (
-- 	SELECT cust_id
--   	FROM Orders  
--   	WHERE cust_id IS NOT NULL 
--   	AND order_date >= '2024-01-01' AND order_date < '2025-01-01'
-- )

-- Return the names of departments that have no employee earning more than 80000.  

-- SELECT dept_name
-- FROM Departments
-- WHERE dept_id not in (
-- 	SELECT dept_id
--   	FROM Employees
--   	WHERE salary > 80000
--   	and dept_id is not null
-- )


-- Return the names of employees who work in the same department as an employee earning more than 90000.  
-- SELECT emp_name
-- FROM Employees 
-- WHERE dept_id in (
--   SELECT dept_id 
--   FROM Employees 
--   WHERE salary > 90000
-- )

-- Return the names of customers who live in the same city as a customer who signed up in 2024.  
-- SELECT cust_name
-- FROM Customers
-- WHERE city in (
-- 	SELECT city
-- 	FROM Customers 
-- 	WHERE signup_date >= '2024-01-01' and signup_date < '2025-01-01'
-- )

























