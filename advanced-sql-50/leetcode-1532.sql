-- Write your PostgreSQL query statement below

WITH first_three AS
(SELECT order_id, order_date, customer_id, 
ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date DESC) as rn 
FROM Orders)

SELECT c.name AS customer_name, c.customer_id, f.order_id, f.order_date
FROM Customers c 
JOIN first_three f 
ON c.customer_id = f.customer_id
WHERE rn IN (1,2,3)
ORDER BY 1, 2, 4 DESC