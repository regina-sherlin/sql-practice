-- Return the total amount of delivered orders placed in 2023

SELECT SUM(amount) AS total_delivered_order_amount
FROM Orders
WHERE order_date > '2023-01-01' AND order_date < '2024-01-01'
  AND status = 'delivered';
