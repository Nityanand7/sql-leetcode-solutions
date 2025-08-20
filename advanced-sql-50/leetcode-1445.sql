-- Write your PostgreSQL query statement below

SELECT sale_date, 
    SUM(CASE WHEN fruit = 'apples' THEN sold_num
             WHEN fruit = 'oranges' THEN (sold_num)*-1 END) AS diff
FROM Sales
GROUP BY Sale_date 
ORDER BY Sale_date 