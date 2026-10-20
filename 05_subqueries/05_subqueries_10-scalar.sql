-- Find employees who earn more than the average salary of all employees 
-- and work in a department whose total salary is above 200000.

SELECT name
from Employee
where salary > (
	SELECT AVG(salary) 
  	FROM Employee
) AND departmentId IN (
  	SELECT departmentId
  	from Employee
  	GROUP by departmentId
  	HAVING sum(salary) > 200000
)