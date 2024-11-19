WITH cte AS
(SELECT *, SUM(weight) OVER(ORDER BY turn) as total
FROM Queue)

SELECT person_name 
FROM cte 
WHERE total <=1000
ORDER BY total DESC
LIMIT 1
