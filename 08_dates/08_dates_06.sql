-- Return staff hired more than 1000 days before 2024-01-01 

SELECT name , hireDate
FROM Staff 
WHERE hiredate <  date('2024-01-01', '-1000 days') 
