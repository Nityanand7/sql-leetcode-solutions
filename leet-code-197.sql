# using window function and cte

WITH cte AS
(SELECT *, DATE_ADD(recordDate, INTERVAL - 1 DAY)
AS yesterdays_date, LAG(recordDate) OVER(ORDER BY recordDate) AS prev_recordDate, 
LAG(temperature) OVER(ORDER BY recordDate) AS prev_temp 
FROM Weather)

SELECT id
FROM cte
WHERE yesterdays_date = prev_recordDate
AND temperature > prev_temp


# using datediff function

SELECT w1.id 
FROM weather w1 ,weather w2 
WHERE datediff(w1.recordDate,w2.recordDate) = 1 
AND w1.temperature > w2.temperature;
