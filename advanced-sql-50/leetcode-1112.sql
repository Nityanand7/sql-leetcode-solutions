-- Write your PostgreSQL query statement below

SELECT
  e1.student_id,
  MIN(e1.course_id)  AS course_id,
  e2.max_grade       AS grade
FROM Enrollments e1
JOIN (
    SELECT
      student_id,
      MAX(grade) AS max_grade
    FROM Enrollments
    GROUP BY student_id
) e2
  ON e1.student_id = e2.student_id
 AND e1.grade      = e2.max_grade
GROUP BY
  e1.student_id,
  e2.max_grade
ORDER BY
  e1.student_id;

-- using ROW_NUMBER

SELECT
  student_id,course_id, grade
FROM (
  SELECT
    student_id, course_id, grade,
    ROW_NUMBER() OVER (PARTITION BY student_id ORDER BY grade   DESC, course_id ASC) AS rn
  FROM Enrollments
) e
WHERE e.rn = 1
ORDER BY student_id;