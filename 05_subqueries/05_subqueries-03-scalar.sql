-- Find departments that have no employees. 

SELECT name
FROM Department
WHERE id NOT IN (
	SELECT departmentId 
  	from Employee 
  	WHERE departmentid IS NOT NULL
)