-- Return the name and total order amount (all statuses) of the customer
-- or customers with the second highest total. Make sure ties are handled.

WITH total_order_amounts AS (
    SELECT cust_id, SUM(amount) AS total_order_amt
    FROM Orders
    GROUP BY cust_id
)
SELECT c.cust_name, t.total_order_amt
FROM Customers c
JOIN total_order_amounts t
    ON c.cust_id = t.cust_id
WHERE t.total_order_amt = (
    SELECT MAX(total_order_amt)
    FROM total_order_amounts
    WHERE total_order_amt < (
        SELECT MAX(total_order_amt)
        FROM total_order_amounts
    )
);
