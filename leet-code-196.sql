WITH cte AS
(SELECT MIN(id) as keepid
FROM Person
GROUP BY email)

DELETE 
FROM Person
WHERE id NOT IN (SELECT keepid FROM cte)

# Alernate solution

DELETE P2
FROM Person p1
LEFT JOIN Person p2
ON p1.email = p2.email
WHERE p1.id < p2.id


