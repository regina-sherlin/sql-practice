-- Return the names and total salaries of departments
-- whose total salary is higher than the total salary of the Marketing department.

WITH total_salaries AS (
    SELECT
        SUM(salary) AS total_salary,
        dept_id
    FROM Employees
    GROUP BY dept_id
)
SELECT d.dept_name, t.total_salary
FROM Departments d
JOIN total_salaries t
    ON d.dept_id = t.dept_id
WHERE t.total_salary > (
    SELECT SUM(salary)
    FROM Employees
    WHERE dept_id = (
        SELECT dept_id
        FROM Departments
        WHERE dept_name = 'Marketing'
    )
);
