-- Write your PostgreSQL query statement below

WITH cte AS
(
    SELECT e.exam_id, e.student_id, s.student_name,
    RANK() OVER(PARTITION BY exam_id ORDER BY score) AS low_score,
    RANK() OVER(PARTITION BY exam_id ORDER BY score DESC) AS high_score
    FROM exam e 
    LEFT JOIN Student s 
    ON e.student_id = s.student_id
) 

SELECT DISTINCT student_id, student_name 
FROM cte 
WHERE student_id NOT IN(SELECT student_id FROM cte WHERE low_score = 1 OR high_score =1)
ORDER BY student_id