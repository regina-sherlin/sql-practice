-- For each department id, return the number of employees
-- and the number of employees who have a recorded salary. Ignore employees who have no department.

SELECT
    dept_id,
    COUNT(emp_id) AS emp_count,
    COUNT(salary) AS emp_with_salary
FROM Employees
WHERE dept_id IS NOT NULL
GROUP BY dept_id;
