-- Write your PostgreSQL query statement below

SELECT DISTINCT page_id as recommended_page 
FROM 
(SELECT
    CASE
        WHEN user1_id = 1 THEN user2_id
        WHEN user2_id = 1 THEN user1_id
        END as user_id 
FROM Friendship) a 
JOIN Likes l
on a.user_id = l.user_id 
WHERE page_id NOT IN (SELECT page_id FROM likes WHERE user_id = 1)
    
