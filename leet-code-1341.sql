WITH cte AS (
    SELECT mr.*, m.title, u.name
    FROM MovieRating mr
    LEFT JOIN Movies m ON mr.movie_id = m.movie_id
    LEFT JOIN Users u ON mr.user_id = u.user_id
)

(SELECT name as results
FROM cte
GROUP BY name
ORDER BY COUNT(*) DESC, name
LIMIT 1)
UNION ALL
(SELECT title AS results
FROM cte
WHERE DATE_FORMAT(created_at, "%Y-%m") = '2020-02'
GROUP BY title
ORDER BY AVG(rating) DESC, title
LIMIT 1)
