-- Write your PostgreSQL query statement below
SELECT MIN(ABS(a.x - b.x)) as shortest
FROM Point a JOIN Point b 
ON a.x != b.x