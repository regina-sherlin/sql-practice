with totals as (
	SELECT SUM(amount) as total_amount,
  	customerId 	
  	FROM Orders
  	GROUP by customerId
)
SELECT c.name, t.total_amount
from Customer c 
JOIN totals t 
	ON c.id = t.customerId
WHERE t.total_amount = (
	SELECT MAX(total_amount)
  	FROM totals
)


-- Find the customer name with the highest total order amount 

-- Note: Using just subqueries were very hard because we have to use total query twice. 
-- - To avoid it I used cte by naming the total query so i can use the name 

-- SELECT c.name, t.total_amount
-- FROM Customer c
-- JOIN (
--     SELECT customerId, SUM(amount) AS total_amount      -- Table 1: who + their total
--     FROM Orders
--     GROUP BY customerId
-- ) AS t
--     ON c.id = t.customerId
-- WHERE t.total_amount = (
--     SELECT MAX(x.total_amount)                         -- Table 2: the target number
--     FROM (
--         SELECT customerId, SUM(amount) AS total_amount
--         FROM Orders
--         GROUP BY customerId
--     ) AS x
-- );