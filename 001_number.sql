--Знайти 5 студентів із найбільшим середнім балом з усіх предметів.

SELECT s.full_name_student, ROUND(avg(g.grade), 0) AS avg_grate
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
GROUP BY s.id 
ORDER BY avg_grate DESC
LIMIT 5;