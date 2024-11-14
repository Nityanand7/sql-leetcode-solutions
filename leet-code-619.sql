WITH cte as 
(SELECT num
FROM MyNumbers
GROUP BY num
Having COUNT(num) = 1)

select max(num) as num from cte
