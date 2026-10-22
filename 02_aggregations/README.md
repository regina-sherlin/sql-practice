# SQL mastery quiz

Four tables, twenty questions. Covers WHERE, aggregates, GROUP BY, HAVING, joins, subqueries and CTEs. DISTINCT is not needed for any question.

## Tables

### Departments (4 rows)

| dept_id | dept_name   | location |
|--------:|-------------|----------|
| 1       | Engineering | Chennai  |
| 2       | Marketing   | Mumbai   |
| 3       | Finance     | Chennai  |
| 4       | Legal       | Delhi    |

### Employees (10 rows)

| emp_id | emp_name | dept_id | salary  | hire_date  |
|-------:|----------|--------:|--------:|------------|
| 1      | Anu      | 1       | 95000   | 2020-03-10 |
| 2      | Bharath  | 1       | 72000   | 2021-07-01 |
| 3      | Chitra   | 1       | 72000   | 2023-01-15 |
| 4      | Deepak   | 2       | 58000   | 2019-11-20 |
| 5      | Elango   | 2       | 64000   | 2022-05-05 |
| 6      | Farah    | 2       | *NULL*  | 2024-02-01 |
| 7      | Gokul    | 3       | 88000   | 2018-08-08 |
| 8      | Hema     | 3       | 64000   | 2023-09-30 |
| 9      | Irfan    | 3       | 51000   | 2022-12-31 |
| 10     | Janani   | *NULL*  | 47000   | 2024-06-15 |

### Customers (7 rows)

| cust_id | cust_name | city    | signup_date |
|--------:|-----------|---------|-------------|
| 1       | Kavin     | Chennai | 2022-01-10  |
| 2       | Lakshmi   | Mumbai  | 2022-03-15  |
| 3       | Mohan     | Chennai | 2023-02-20  |
| 4       | Nila      | Delhi   | 2023-06-01  |
| 5       | Om        | Mumbai  | 2023-08-12  |
| 6       | Priya     | Delhi   | 2024-01-05  |
| 7       | Rahul     | Chennai | 2024-03-18  |

### Orders (12 rows)

| order_id | cust_id | order_date | amount | status    |
|---------:|--------:|------------|-------:|-----------|
| 1        | 1       | 2023-01-05 | 1200   | delivered |
| 2        | 1       | 2023-03-12 | 800    | delivered |
| 3        | 2       | 2023-02-14 | 1500   | delivered |
| 4        | 3       | 2023-04-01 | 300    | cancelled |
| 5        | 3       | 2023-05-20 | 900    | delivered |
| 6        | 4       | 2023-07-07 | 1500   | delivered |
| 7        | 5       | 2023-09-09 | 450    | returned  |
| 8        | 5       | 2023-10-10 | 650    | delivered |
| 9        | 1       | 2024-01-20 | 400    | delivered |
| 10       | 7       | 2024-04-02 | 2000   | delivered |
| 11       | 2       | 2024-02-29 | *NULL* | cancelled |
| 12       | 4       | 2024-05-15 | 500    | delivered |

*Italic NULL* marks NULL values. Dates are stored as text in YYYY-MM-DD form. Status values are lowercase: delivered, cancelled, returned.

## Questions

> Write one query per question. Return exactly the columns asked for, and give calculated columns a name with AS.
>
> Where a question says to use a CTE or a subquery in FROM, use that structure. Otherwise, any correct approach is fine.
>
> Send answers in batches of five, labelled by question number.

### Filters and aggregates

1. Return the total amount of delivered orders placed in 2023. *One number.*
2. For each department id, return the number of employees and the number of employees who have a recorded salary. Ignore employees who have no department.
3. Return the average amount of cancelled orders.
4. Return the department ids whose average salary is above 65000.
5. Considering only orders that were not cancelled, return each customer id that has at least 2 such orders, together with that count.
6. Considering only customers who signed up on or after 1 January 2023, return the cities that have at least 2 such customers.

### Subqueries in WHERE

7. Return the names and salaries of employees who earn more than the average salary of all employees.
8. Return the names of employees who earn less than the average salary of the Finance department. Use the department name, not its id.
9. Return the names of customers who have placed at least one order of 1500 or more.
10. Return the names of departments that have no employees.
11. Return the names of customers who have never had a cancelled order.
12. Return the names and cities of customers who live in the same city as a customer who has a returned order.

### Subqueries in FROM and CTEs

13. Using a subquery in FROM: for each customer id, return the total amount of their delivered orders, keeping only customers whose delivered total is at least 2000.
14. Using a CTE: return the name and total order amount (all statuses) of each customer whose total is above the average customer total. Only count customers who have placed orders.
15. Return the third highest salary value in the company.
16. Using a CTE: return the name and total order amount (all statuses) of the customer or customers with the second highest total. Make sure ties are handled.
17. Return every department name with its number of employees, including departments with zero employees.

### Combinations

18. Return the names and total salaries of departments whose total salary is higher than the total salary of the Marketing department.
19. For each department, return the department name, employee name and salary of the highest-paid employee in that department. Include all employees if there is a tie. Ignore employees with no department.
20. Using a CTE: count all orders per customer, regardless of status. Return the customer name and order count for customers whose count equals the maximum count, or whose count is not shared with any other customer. Sort by count descending, then name.

## Setup SQL

Runs in MySQL and SQLite.

```sql
CREATE TABLE Departments (dept_id INT PRIMARY KEY, dept_name VARCHAR(50), location VARCHAR(50));
INSERT INTO Departments VALUES
  (1,'Engineering','Chennai'),(2,'Marketing','Mumbai'),(3,'Finance','Chennai'),(4,'Legal','Delhi');

CREATE TABLE Employees (
  emp_id INT PRIMARY KEY, emp_name VARCHAR(50), dept_id INT, salary INT, hire_date DATE
);
INSERT INTO Employees VALUES
  (1,'Anu',1,95000,'2020-03-10'),(2,'Bharath',1,72000,'2021-07-01'),
  (3,'Chitra',1,72000,'2023-01-15'),(4,'Deepak',2,58000,'2019-11-20'),
  (5,'Elango',2,64000,'2022-05-05'),(6,'Farah',2,NULL,'2024-02-01'),
  (7,'Gokul',3,88000,'2018-08-08'),(8,'Hema',3,64000,'2023-09-30'),
  (9,'Irfan',3,51000,'2022-12-31'),(10,'Janani',NULL,47000,'2024-06-15');

CREATE TABLE Customers (cust_id INT PRIMARY KEY, cust_name VARCHAR(50), city VARCHAR(50), signup_date DATE);
INSERT INTO Customers VALUES
  (1,'Kavin','Chennai','2022-01-10'),(2,'Lakshmi','Mumbai','2022-03-15'),
  (3,'Mohan','Chennai','2023-02-20'),(4,'Nila','Delhi','2023-06-01'),
  (5,'Om','Mumbai','2023-08-12'),(6,'Priya','Delhi','2024-01-05'),
  (7,'Rahul','Chennai','2024-03-18');

CREATE TABLE Orders (order_id INT PRIMARY KEY, cust_id INT, order_date DATE, amount INT, status VARCHAR(20));
INSERT INTO Orders VALUES
  (1,1,'2023-01-05',1200,'delivered'),(2,1,'2023-03-12',800,'delivered'),
  (3,2,'2023-02-14',1500,'delivered'),(4,3,'2023-04-01',300,'cancelled'),
  (5,3,'2023-05-20',900,'delivered'),(6,4,'2023-07-07',1500,'delivered'),
  (7,5,'2023-09-09',450,'returned'),(8,5,'2023-10-10',650,'delivered'),
  (9,1,'2024-01-20',400,'delivered'),(10,7,'2024-04-02',2000,'delivered'),
  (11,2,'2024-02-29',NULL,'cancelled'),(12,4,'2024-05-15',500,'delivered');
```
