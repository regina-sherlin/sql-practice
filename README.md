# 🗃️ Knock down SQL, let's go!!

My daily SQL practice, organised by concept. Every query file is written against the sample dataset below.

## 📌 How I Practice

1. Pick one concept for the day (joins, window functions, CTEs, etc.)
2. Load the sample dataset below
3. Write queries from scratch, without looking at solutions
4. Save the best version using the naming pattern below, with a comment header

## 🧱 Sample Dataset

### Setup Script

```sql
CREATE TABLE Department (
    id   INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Department VALUES
    (1, 'IT'), (2, 'Sales'), (3, 'HR');

CREATE TABLE Employee (
    id           INT PRIMARY KEY,
    name         VARCHAR(50),
    salary       INT,
    departmentId INT
);

INSERT INTO Employee VALUES
    (1, 'Asha',  70000, 1),
    (2, 'Ravi',  85000, 1),
    (3, 'Meena', 60000, 2),
    (4, 'Karan', 85000, 2),
    (5, 'Divya', 50000, 3),
    (6, 'Imran', 90000, 1);

CREATE TABLE Customer (
    id   INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

INSERT INTO Customer VALUES
    (1, 'Arjun', 'Chennai'),
    (2, 'Sneha', 'Mumbai'),
    (3, 'Rohit', 'Delhi'),
    (4, 'Pooja', 'Chennai');

CREATE TABLE Orders (
    id         INT PRIMARY KEY,
    customerId INT,
    amount     INT
);

INSERT INTO Orders VALUES
    (1, 1, 600),
    (2, 1, 700),
    (3, 2, 300),
    (4, 4, 450);
```

### Tables at a Glance

**Department**

| id | name  |
|----|-------|
| 1  | IT    |
| 2  | Sales |
| 3  | HR    |

**Employee**

| id | name  | salary | departmentId |
|----|-------|--------|--------------|
| 1  | Asha  | 70000  | 1 |
| 2  | Ravi  | 85000  | 1 |
| 3  | Meena | 60000  | 2 |
| 4  | Karan | 85000  | 2 |
| 5  | Divya | 50000  | 3 |
| 6  | Imran | 90000  | 1 |

**Customer**

| id | name  | city    |
|----|-------|---------|
| 1  | Arjun | Chennai |
| 2  | Sneha | Mumbai  |
| 3  | Rohit | Delhi   |
| 4  | Pooja | Chennai |

**Orders**

| id | customerId | amount |
|----|------------|--------|
| 1  | 1 | 600 |
| 2  | 1 | 700 |
| 3  | 2 | 300 |
| 4  | 4 | 450 |

### Relationships

- `Employee.departmentId` → `Department.id`
- `Orders.customerId` → `Customer.id`

> 💡 Rohit (Customer 3) has no orders, which makes the data handy for practising `LEFT JOIN`, `NOT EXISTS` and `NULL` handling.

## 📂 File Naming

All files sit in one folder and follow this pattern:

```
NN_topic_NN-name.sql
```

Example: `05_subqueries_02-scalar.sql` is topic 05 (subqueries), query 02 (scalar).

- Underscores separate the parts of the name
- Hyphens separate words inside a name

### Topics

| Prefix | Topic | Concepts |
|--------|-------|----------|
| `01_basics` | Basics | SELECT, WHERE, ORDER BY, LIMIT, DISTINCT, NULL |
| `02_aggregations` | Aggregations | COUNT, SUM, AVG, MIN, MAX, GROUP BY, HAVING |
| `03_case_when` | CASE WHEN | CASE WHEN, COALESCE, NULLIF, conditional aggregation |
| `04_joins` | Joins | INNER, LEFT, RIGHT, FULL, SELF, CROSS |
| `05_subqueries` | Subqueries | Scalar, correlated, EXISTS, IN |
| `06_cte` | CTEs | Basic, multiple, recursive |
| `07_window` | Window functions | ROW_NUMBER, RANK, DENSE_RANK, LAG/LEAD, running totals |
| `08_date` | Date functions | Extract, DATEDIFF, DATE_ADD, formatting |
| `09_operators` | Operators | LIKE, IN, BETWEEN, UNION, INTERSECT, EXCEPT |

## 🧾 File Header Template

Every file starts with a short comment header:

```sql
-- Problem : Employees earning more than the department average
-- Concept : Correlated subquery
-- Level   : Medium
```

## 🚀 Progress Log

- [ ] 01 Basics
- [ ] 02 Aggregations
- [ ] 03 CASE WHEN
- [ ] 04 Joins
- [ ] 05 Subqueries
- [ ] 06 CTEs
- [ ] 07 Window functions
- [ ] 08 Date functions
- [ ] 09 Operators

---
⭐ Star the repo if you find it useful!
