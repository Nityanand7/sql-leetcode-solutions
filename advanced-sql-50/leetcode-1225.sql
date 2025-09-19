-- Write your PostgreSQL query statement below

WITH a AS
(
    SELECT fail_date AS visit_date,
    'failed' AS period_state
    FROM failed

    UNION ALL

    SELECT success_date AS visit_date,
    'succeeded' AS period_state
    FROM succeeded
),

b AS 
(
    SELECT visit_date, period_state, 
    ROW_NUMBER() OVER(PARTITION BY period_state ORDER BY visit_date) AS seq
    FROM a 
    WHERE visit_date BETWEEN '2019-01-01' AND '2019-12-31'
),

c AS
(
    SELECT visit_date, period_state, seq,
    visit_date - (seq * INTERVAL '1 day') AS seq_start
    FROM b 
)

SELECT period_state, MIN(visit_date) AS start_date, MAX(visit_date) AS end_date
FROM c 
GROUP BY period_state, seq_start 
ORDER BY start_date