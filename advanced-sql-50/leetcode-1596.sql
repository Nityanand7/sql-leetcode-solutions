-- Write your PostgreSQL query statement below

SELECT customer_id, product_id, product_name
FROM
(SELECT o.customer_id, o.product_id, p.product_name, 
RANK() OVER(PARTITION BY o.customer_id ORDER BY COUNT(o.product_id) DESC) as product_rank
FROM Orders o 
JOIN Products p 
ON o.product_id = p.product_id
GROUP BY o.customer_id, o.product_id, p.product_name) a
WHERE product_rank = 1 
