
## 🧱 Sample Dataset - Subqueries

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
