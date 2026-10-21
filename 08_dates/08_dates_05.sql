-- Return sales between 2024-01-15 and 2024-02-28, inclusive. 

SELECT * FROM Sales
WHERE orderDate >= '2024-01-15' and orderDate < '2024-02-29'


-- SELECT * FROM Sales
-- WHERE orderDate BETWEEN '2024-01-15' and '2024-02-28'

-- This version is good but when timestamp is involved '2024-02-28' gets cut off ,
--  hence range version is better