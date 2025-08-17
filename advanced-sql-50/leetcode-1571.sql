-- Write your PostgreSQL query statement below

WITH totals as
(SELECT product_id, SUM(Width * Length * Height) as val
FROM Products 
GROUP BY product_id)

SELECT w.name as warehouse_name, SUM(w.units * t.val) as volume
FROM Warehouse w
LEFT JOIN totals t 
ON w.product_id = t.product_id
GROUP BY w.name