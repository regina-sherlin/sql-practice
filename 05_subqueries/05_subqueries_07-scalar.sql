-- Find employees who earn less than the average salary of the Sales department 

SELECT name, salary
FROM Employee
WHERE salary < (
	SELECT AVG(salary) 
  	FROM Employee
  	WHERE departmentId IN (
    	SELECT id
      	FROM Department
      	WHERE name = 'Sales'
    )
)