-- Write your PostgreSQL query statement below

WITH CTE AS 
(
        SELECT Wimbledon AS id from Championships
        UNION ALL
        SELECT Fr_open AS id from Championships
        UNION ALL 
        SELECT US_open AS id from Championships
        UNION ALL
        SELECT Au_open AS id from Championships
)


SELECT player_id, player_name, 
COUNT(*) AS grand_slams_count
FROM Players p
JOIN CTE 
ON p.player_id = CTE.id 
GROUP BY player_id, player_name