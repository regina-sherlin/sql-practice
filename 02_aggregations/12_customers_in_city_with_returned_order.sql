-- Return the names and cities of customers who live in the same city as a customer
-- who has a returned order.

SELECT cust_name, city
FROM Customers
WHERE city IN (
    SELECT c.city
    FROM Customers c
    LEFT JOIN Orders o
        ON c.cust_id = o.cust_id
    WHERE o.status = 'returned'
);
