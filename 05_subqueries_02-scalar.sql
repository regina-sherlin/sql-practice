-- Find customers from the same city as a customer who has placed an order above 500.

SELECT name, city 
FROM Customer
WHERE city IN (
	SELECT city 
  	FROM Customer
  	WHERE id IN (
      SELECT customerId
      from Orders
      WHERE amount > 500
))