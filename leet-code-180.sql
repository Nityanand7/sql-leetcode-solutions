WITH cte AS
(SELECT *, LEAD(num, 1) OVER() AS next, 
LEAD(num, 2) OVER() AS next2next
FROM Logs)

SELECT DISTINCT num AS ConsecutiveNums
FROM cte
WHERE num = next
AND next = next2next
