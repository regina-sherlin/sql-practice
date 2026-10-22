-- Return the names of departments that have no employees.

SELECT d.dept_name
FROM Departments d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;
