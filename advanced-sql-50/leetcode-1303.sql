-- Write your PostgreSQL query statement below

SELECT a.employee_id, count(b.employee_id) as team_size 
FROM employee a
LEFT JOIN employee b 
ON a.team_id = b.team_id
group by a.employee_id;