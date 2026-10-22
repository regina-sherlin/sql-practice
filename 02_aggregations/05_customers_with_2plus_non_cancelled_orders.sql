-- Considering only orders that were not cancelled,
-- return each customer id that has at least 2 such orders, together with that count.

SELECT cust_id, COUNT(order_id) AS order_count
FROM Orders
WHERE status <> 'cancelled'
GROUP BY cust_id
HAVING COUNT(order_id) >= 2;
