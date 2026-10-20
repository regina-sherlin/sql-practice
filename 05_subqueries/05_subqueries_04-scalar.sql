-- Find employees whose salary is the same as at least one employee in a different department. 

SELECT name, salary 
FROM Employee
WHERE salary IN (
	SELECT salary 
  	FROM Employee
  	GROUP by salary 
  	HAVING COUNT(DISTINCT departmentid) > 1
)