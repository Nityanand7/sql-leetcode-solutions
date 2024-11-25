WITH cte AS
(SELECT *, DENSE_RANK() OVER(ORDER BY salary DESC) as position
FROM Employee)

SELECT MAX(CASE WHEN position = 2 THEN salary
ELSE null END) AS SecondHighestSalary
FROM cte
