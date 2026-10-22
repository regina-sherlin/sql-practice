-- Considering only customers who signed up on or after 1 January 2023,
-- return the cities that have at least 2 such customers.

SELECT city, COUNT(cust_id) AS customer_count
FROM Customers
WHERE signup_date >= '2023-01-01'
GROUP BY city
HAVING COUNT(cust_id) >= 2;
