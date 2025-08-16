-- Write your PostgreSQL query statement below

SELECT user_id, MAX(time_stamp) as last_stamp
FROM Logins
WHERE extract(year from time_stamp) = '2020'
GROUP BY user_id