-- Return the names of customers who have never had a cancelled order.

SELECT cust_name
FROM Customers
WHERE cust_id NOT IN (
    SELECT o.cust_id
    FROM Orders o
    WHERE o.status = 'cancelled' AND o.cust_id IS NOT NULL
);
