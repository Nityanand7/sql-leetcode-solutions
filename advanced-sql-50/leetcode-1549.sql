-- Write your PostgreSQL query statement below

SELECT p.product_name, p.product_id, o.order_id, o.order_date
FROM Products p 
JOIN orders o 
ON p.product_id = o.product_id
JOIN (
    SELECT DISTINCT product_id, MAX(order_date) AS order_date 
    FROM Orders GROUP BY product_id
) m 
ON o.product_id = m.product_id
AND o.order_date = m.order_date
ORDER BY 1,2,3