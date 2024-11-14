WITH cte AS
(SELECT player_id, MIN(event_date) as first_login
FROM Activity
GROUP BY player_id),

cte2 AS
(SELECT player_id, DATE_ADD(first_login, INTERVAL 1 DAY) as next_date
FROM cte)

SELECT
ROUND((SELECT COUNT(DISTINCT player_id)
FROM Activity
WHERE(player_id, event_date) IN (SELECT player_id, next_date FROM cte2)) / 
(SELECT COUNT(DISTINCT player_id) from Activity), 2) AS fraction
