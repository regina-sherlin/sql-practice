-- (using a CTE): return the name and total order amount (all statuses) of the customer
-- or customers with the second lowest total.

WITH total_order_amounts AS (
    SELECT
        cust_id,
        SUM(amount) AS total_amount
    FROM Orders
    GROUP BY cust_id
)
SELECT c.cust_name, t.total_amount
FROM Customers c
JOIN total_order_amounts t
    ON c.cust_id = t.cust_id
WHERE t.total_amount = (
    SELECT MIN(total_amount)
    FROM total_order_amounts
    WHERE total_amount > (
        SELECT MIN(total_amount)
        FROM total_order_amounts
    )
);
