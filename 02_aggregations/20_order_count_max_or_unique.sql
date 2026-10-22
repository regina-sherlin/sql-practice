-- Count all orders per customer, regardless of status. Return the customer name
-- and order count for customers whose count equals the maximum count,
-- or whose count is not shared with any other customer. Sort by count descending, then name.

WITH order_count AS (
    SELECT COUNT(order_id) AS order_count, cust_id
    FROM Orders
    GROUP BY cust_id
)
SELECT c.cust_name, oc.order_count
FROM Customers c
JOIN order_count oc
    ON c.cust_id = oc.cust_id
WHERE oc.order_count = (
        SELECT MAX(order_count)
        FROM order_count
    )
    OR oc.order_count IN (
        SELECT order_count
        FROM order_count
        GROUP BY order_count
        HAVING COUNT(*) = 1
    )
ORDER BY oc.order_count DESC, c.cust_name ASC;
