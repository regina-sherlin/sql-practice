-- Return the names of customers who have placed at least one order of 1500 or more.

SELECT c.cust_name
FROM Customers c
LEFT JOIN Orders o
    ON c.cust_id = o.cust_id
WHERE o.amount >= 1500
GROUP BY c.cust_id, c.cust_name
HAVING COUNT(o.order_id) >= 1;

-- or use join with no having clause
