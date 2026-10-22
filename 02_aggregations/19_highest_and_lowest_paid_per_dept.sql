-- For each department, return the department name, employee name
-- and salary of the highest-paid employee in that department.
-- Include all employees if there is a tie. Ignore employees with no department.

-- Highest paid per department
WITH highest_paid AS (
    SELECT dept_id, MAX(salary) AS max_salary
    FROM Employees
    GROUP BY dept_id
)
SELECT e.emp_name, d.dept_name, h.max_salary
FROM Employees e
JOIN highest_paid h
    ON e.dept_id = h.dept_id
    AND e.salary = h.max_salary
JOIN Departments d
    ON e.dept_id = d.dept_id;

-- Lowest paid per department
WITH min_salary AS (
    SELECT
        MIN(salary) AS min_salary,
        dept_id
    FROM Employees
    GROUP BY dept_id
)
SELECT d.dept_name, e.emp_name, m.min_salary
FROM Employees e
JOIN min_salary m
    ON m.dept_id = e.dept_id
    AND e.salary = m.min_salary
JOIN Departments d
    ON d.dept_id = e.dept_id;
