-- QUESTION 1
-- Find the second highest total order amount across customers (not the second highest single order).

-- WITH totals as (
-- 	SELECT sum(amount) as total_order_amount, 
--   	customerId
-- 	FROM Orders 
-- 	GROUP by customerid
-- )
-- SELECT 
-- 	MAX(t.total_order_amount) aS second_highest
-- from Customer c
-- JOIN totals t
-- 	ON c.id = t.customerId
-- WHERE t.total_order_amount < (
-- 	SELECT MAX(total_order_amount)
--   	from totals
-- )


-- QUESTION 2
-- Find the name and amount with the second highest total order amount 
-- across customers (not the second highest single order).

WITH totals as (
	SELECT sum(amount) as total_order_amount, 
  	customerId
	FROM Orders 
	GROUP by customerid
) 
SELECT c.name, t.total_order_amount
from Customer c 
JOIN totals t 
	ON c.id = t.customerId
WHERE t.total_order_amount = (
	SELECT MAX(total_order_amount) 
  	FROM totals
  	WHERE total_order_amount < (
    	SELECT MAX(total_order_amount)
      	FROM totals
    )
)