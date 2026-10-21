-- Return sales made in February 2024 (any day in that month). 

SELECT * 
FROM Sales
WHERE strftime('%Y-%m',orderdate) = '2024-02' 

