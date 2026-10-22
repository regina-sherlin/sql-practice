-- Return the names of employees who earn less than the average salary of the Finance department.
-- Use the department name, not its id.

SELECT emp_name
FROM Employees
WHERE salary < (
    SELECT AVG(salary) AS avg_salary
    FROM Employees e
    JOIN Departments d
        ON e.dept_id = d.dept_id
    WHERE d.dept_name = 'Finance'
);
