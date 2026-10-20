-- Find the difference between the highest and lowest salary. 

SELECT 
(SELECT MAX(salary) FROM Employee) - 
(SELECT MIN(salary) FROM Employee)
AS salary_diff
