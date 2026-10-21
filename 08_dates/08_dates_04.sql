-- Return the id and day name (Monday, Tuesday, ...) of each sale.  

SELECT id, 
CASE strftime('%w', orderDate) 
	WHEN '0' THEN 'Sunday'
    WHEn '1' THEN 'Monday'
    WHEN '2' THEN 'Tuesday'
    WHEn '3' THEN 'Wednesday'
    WHEN '4' THEN 'Thursday'
    WHEn '5' THEN 'Friday'
    WHEN '6' THEN 'Saturday'
END AS day_name
from Sales;


-- DAYNAME(orderDate) - mysql 
-- strftime('%w', orderDate) - sqllite