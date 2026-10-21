-- For each staff member, return their name and the date of their 1-year work anniversary 

SELECT name, 
date(hireDate, '+1 year') as first_year_anniversary
FROM Staff 