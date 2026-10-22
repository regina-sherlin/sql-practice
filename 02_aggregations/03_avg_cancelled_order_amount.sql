-- Return the average amount of cancelled orders.

SELECT AVG(amount) AS avg_cancelled_order_amt
FROM Orders
WHERE status = 'cancelled';
