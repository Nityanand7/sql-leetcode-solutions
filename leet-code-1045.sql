SELECT customer_id
FROM Customer 
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(DISTINCT product_key) from Product)

# using cte
  
WITH cte as
(SELECT customer_id, count(DISTINCT product_key) as num_products
FROM Customer 
GROUP BY customer_id)

SELECT customer_id 
FROM cte 
WHERE num_products = (SELECT count(DISTINCT product_key) from Product)

