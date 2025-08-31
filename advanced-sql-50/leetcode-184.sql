# Write your MySQL query statement below

SELECT d.name as Department, e.name as Employee, e.Salary
FROM Employee e
JOIN Department d 
ON e.DepartmentId = d.id 
WHERE (e.DepartmentId, Salary) IN 
(SELECT DepartmentId, MAX(Salary)
FROM Employee GROUP BY DepartmentId) 