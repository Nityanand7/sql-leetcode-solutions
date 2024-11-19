WITH cte AS
(SELECT *, RANK() OVER(PARTITION BY product_id ORDER BY change_date DESC) AS latest_change
FROM Products
WHERE change_date <='2019-08-16')

SELECT product_id, new_price AS price
FROM cte
WHERE latest_change = 1

UNION

SELECT product_id, 10 AS price
FROM Products WHERE product_id NOT IN (SELECT product_id from cte)
