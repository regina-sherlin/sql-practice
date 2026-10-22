-- Return the third highest salary value in the company.

-- Solution 1: salary value only
SELECT MAX(salary) AS third_highest_salary
FROM Employees
WHERE salary < (
    SELECT MAX(salary)
    FROM Employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM Employees
    )
);

-- Solution 2: with name and salary of third highest salary
SELECT emp_name, salary
FROM Employees
WHERE salary = (
    SELECT MAX(salary) AS third_highest_salary
    FROM Employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM Employees
        WHERE salary < (
            SELECT MAX(salary)
            FROM Employees
        )
    )
);
