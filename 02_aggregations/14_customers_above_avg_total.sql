-- Return the name and total order amount of each customer
-- whose total is above the average customer total.
-- Only count customers who have placed orders.

WITH total_order_amount AS (
    SELECT SUM(amount) AS total_order_amt, cust_id
    FROM Orders
    GROUP BY cust_id
)
SELECT c.cust_name, t.total_order_amt
FROM Customers c
JOIN total_order_amount t
    ON c.cust_id = t.cust_id
WHERE t.total_order_amt > (
    SELECT AVG(total_order_amt)
    FROM total_order_amount
);
