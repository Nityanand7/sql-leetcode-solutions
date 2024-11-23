WITH cte AS
(SELECT e.name as Employee, d.name as Department, e.salary as Salary, 
DENSE_RANK() OVER(PARTITION BY d.id ORDER BY e.salary DESC) as ranking
FROM Employee e 
LEFT JOIN Department d
ON e.departmentID = d.id)

SELECT Employee, Department, Salary
FROM cte
WHERE ranking in (1,2,3)
