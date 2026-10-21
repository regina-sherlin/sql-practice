-- Return the names of staff hired in 2021. 

SELECT name, hiredate
from Staff
WHERE hiredate BETWEEN '2021-01-01' AND '2022-01-01'
