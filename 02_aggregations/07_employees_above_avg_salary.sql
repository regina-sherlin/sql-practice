-- Return the names and salaries of employees who earn more than the average salary of all employees.

SELECT emp_name, salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary) AS avg_salary
    FROM Employees
);
