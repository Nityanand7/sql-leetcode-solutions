-- Write your PostgreSQL query statement below
SELECT
  co.name AS country
FROM person p
JOIN country co
  ON LEFT(p.phone_number, 3) = co.country_code
JOIN calls c
  ON p.id = c.caller_id
   OR p.id = c.callee_id
GROUP BY
  co.name
HAVING
  AVG(c.duration) > (
    SELECT AVG(duration)
    FROM calls
  )
ORDER BY
  co.name;