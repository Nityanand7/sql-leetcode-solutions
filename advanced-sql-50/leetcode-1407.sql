-- Write your PostgreSQL query statement below

SELECT
  u.name,
  CASE
    WHEN SUM(r.distance) IS NULL THEN 0
    ELSE SUM(r.distance)
  END AS travelled_distance
FROM Users u
LEFT JOIN Rides r
  ON u.id = r.user_id
GROUP BY
  u.id,
  u.name
ORDER BY
  travelled_distance DESC,
  u.name;