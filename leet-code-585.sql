SELECT ROUND(SUM(tiv_2016),2) as tiv_2016
FROM
(SELECT tiv_2016,
COUNT(*) OVER(PARTITION BY tiv_2015) AS count_tiv,
COUNT(*) OVER(PARTITION BY lat, lon) AS count_latlon
FROM Insurance) AS sub_query
WHERE count_tiv > 1 AND count_latlon = 1


# another way

WITH cte AS
(SELECT CONCAT(lat,',',lon) AS location
FROM Insurance
GROUP BY lat, lon
HAVING COUNT(pid)>1),

cte2 AS
(SELECT DISTINCT I1.*
FROM Insurance I1
LEFT JOIN Insurance I2
ON I1.tiv_2015 = I2.tiv_2015
WHERE I1.pid <> I2.pid
AND CONCAT(I1.lat,',',I1.lon) NOT IN (SELECT location from cte))

SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM cte2
