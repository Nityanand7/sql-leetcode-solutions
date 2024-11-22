WITH cte AS
(SELECT requester_id as id, accepter_id
FROM RequestAccepted
UNION
SELECT accepter_id as id, requester_id 
FROM RequestAccepted)


SELECT id, COUNT(DISTINCT accepter_id) as num
FROM cte
GROUP BY id
ORDER BY num DESC
LIMIT 1
