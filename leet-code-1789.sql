SELECT employee_id, CASE WHEN COUNT(department_id) = 1 THEN department_id
WHEN COUNT(department_id) > 1 THEN SUM((primary_flag = 'Y')*department_id) END AS department_id
FROM Employee 
GROUP BY employee_id


# Using a Nested query
SELECT employee_id, department_id
FROM Employee
WHERE employee_id IN (
    SELECT employee_id
    FROM Employee
    GROUP BY employee_id
    HAVING COUNT(employee_id) = 1
) OR primary_flag = 'Y'

# Using a Union

SELECT employee_id, department_id
FROM Employee
GROUP BY employee_id
HAVING COUNT(department_id)=1

UNION

SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'
