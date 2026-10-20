-- Return each department’s name and its number of employees, including departments with zero employees. 

SELECT d.name, COALESCE(e.emp_count,0) AS emp_count
FROM Department d 
LEFT JOIN (
	SELECT COUNT(id) as emp_count, departmentId
  	FROM Employee
  	GROUP BY departmentId
) as e 
ON d.id = e.departmentId
