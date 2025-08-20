-- Write your PostgreSQL query statement below
SELECT Email
FROM Person 
GROUP BY Email 
HAVING COUNT(Email) > 1