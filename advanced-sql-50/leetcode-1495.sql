-- Write your PostgreSQL query statement below

SELECT DISTINCT title
FROM Content c JOIN TVProgram t
ON c.content_id = t.content_id
WHERE Kids_content = 'Y' AND content_type = 'Movies' AND EXTRACT(MONTH FROM program_date) = 6 AND EXTRACT(YEAR FROM program_date) = 2020
