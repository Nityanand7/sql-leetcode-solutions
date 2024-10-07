WITH cte as
(SELECT *, RANK() OVER(PARTITION BY product_id
ORDER BY year) AS rnk
FROM Sales)

SELECT product_id, year AS first_year, quantity, price
FROM cte
WHERE rnk = 1
