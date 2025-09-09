-- Write your PostgreSQL query stat

WITH all_dates AS
(
    SELECT user_id, visit_date
    FROM UserVisits
    UNION 
    SELECT user_id, '2021-01-01'::date AS visit_date 
    FROM UserVisits
),

date_ranks AS
(SELECT *, RANK() OVER(PARTITION BY user_id ORDER BY visit_date) AS date_rnk
FROM all_dates)

SELECT a.user_id, MAX(b.visit_date - a.visit_date) as biggest_window
FROM date_ranks a 
JOIN date_ranks b 
ON a.user_id = b.user_id
AND b.date_rnk = a.date_rnk + 1
GROUP BY a.user_id
ORDER BY a.user_id