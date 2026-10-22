-- For each customer id, return the total amount of their delivered orders,
-- keeping only customers whose delivered total is at least 2000.

-- Solution 1: HAVING
SELECT cust_id, SUM(amount) AS sum_delivered_orders
FROM Orders
WHERE status = 'delivered'
GROUP BY cust_id
HAVING SUM(amount) >= 2000;

-- Solution 2: using subquery
SELECT d.cust_id, d.sum_delivered_orders
FROM (
    SELECT
        SUM(amount) AS sum_delivered_orders,
        cust_id
    FROM Orders
    WHERE status = 'delivered'
    GROUP BY cust_id
) d
WHERE d.sum_delivered_orders >= 2000;
