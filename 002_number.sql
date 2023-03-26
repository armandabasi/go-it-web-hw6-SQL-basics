-- Знайти студента із найвищим середнім балом з певного предмета.

SELECT sub.subject, s.full_name_student, ROUND(avg(g.grade), 0) AS avg_grate
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN subjects sub ON sub.id = g.subject_id
WHERE sub.id = 3
GROUP BY s.id 
ORDER BY avg_grate DESC
LIMIT 1;
