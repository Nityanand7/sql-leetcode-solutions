-- Write your PostgreSQL query statement below

SELECT
  c.customer_id,
  c.name
FROM Customers c
JOIN Orders o
  ON c.customer_id = o.customer_id
JOIN Product p
  ON p.product_id = o.product_id
WHERE o.order_date BETWEEN '2020-06-01' AND '2020-07-31'
GROUP BY c.customer_id, c.name
HAVING
    SUM(o.quantity * p.price)
        FILTER (WHERE EXTRACT(MONTH FROM o.order_date)=6) >= 100
AND SUM(o.quantity * p.price)
        FILTER (WHERE EXTRACT(MONTH FROM o.order_date)=7) >= 100

