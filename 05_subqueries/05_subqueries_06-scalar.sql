-- Find employees who earn more than the lowest salary in the IT department. 

SELECT name, salary
FROM Employee 
WHERE salary > (
	SELECT MIN(salary) 
  	FROM Employee
  	WHERE departmentId in (
    	SELECT id 
      	FROM Department
      	WHERE name = 'IT'
    )
  
)