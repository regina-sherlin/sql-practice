-- For each department, show the department id and its average salary, 
-- then return only the departments whose average is above 70000.

SELECT e.avg_salary, e.departmentid
FROM (
	SELECT AVG(salary)as avg_salary,
  	departmentid
  	FROM Employee 
  	GROUP BY departmentId
  	
) e 
WHERE e.avg_salary > 70000
