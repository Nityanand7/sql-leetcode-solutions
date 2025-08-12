-- Write your PostgreSQL query statement below
SELECT c.customer_id, c.customer_name
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING
    SUM(CASE WHEN product_name = 'A' THEN 1 ELSE 0 END) > 0
    AND SUM(CASE WHEN product_name = 'B' THEN 1 ELSE 0 END) > 0
    AND SUM(CASE WHEN product_name = 'C' THEN 1 ELSE 0 END) = 0
ORDER BY c.customer_id


-- using a subquery
SELECT customer_id, customer_name
FROM Customers
WHERE customer_id IN
(SELECT customer_id
FROM Orders
GROUP BY customer_id
HAVING
    SUM(CASE WHEN product_name = 'A' THEN 1 ELSE 0 END) > 0
    AND SUM(CASE WHEN product_name = 'B' THEN 1 ELSE 0 END) > 0
    AND SUM(CASE WHEN product_name = 'C' THEN 1 ELSE 0 END) = 0)