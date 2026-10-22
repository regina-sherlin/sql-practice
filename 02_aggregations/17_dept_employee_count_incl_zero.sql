-- Return every department name with its number of employees,
-- including departments with zero employees.

SELECT d.dept_name, COUNT(e.emp_id) AS emp_count
FROM Departments d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;
