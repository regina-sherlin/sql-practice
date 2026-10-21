-- Return each staff member’s name and the month number of their hire date. 

SELECT name, 
	CAST(strftime('%m', hiredate) AS INTEGER) AS hire_month
from Staff