-- Return the department ids whose average salary is above 65000.

SELECT dept_id
FROM Employees
GROUP BY dept_id
HAVING AVG(salary) > 65000;
