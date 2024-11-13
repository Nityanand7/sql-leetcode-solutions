WITH cte AS
(SELECT query_name, rating/position as ratio,
CASE WHEN rating < 3 THEN 1
ELSE 0 END AS value
FROM Queries
WHERE query_name IS NOT NULL)

SELECT query_name, ROUND(AVG(ratio), 2) as quality, ROUND((SUM(value)/COUNT(*)) * 100, 2) as poor_query_percentage
FROM cte
GROUP BY query_name
