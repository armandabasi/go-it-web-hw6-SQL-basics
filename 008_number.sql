-- Знайти середній бал, який ставить певний викладач зі своїх предметів.

SELECT t.full_name_teacher, ROUND(avg(g.grade),0) AS avg_grate
FROM grades g
LEFT JOIN subjects s ON g.subject_id = s.id 
LEFT JOIN teachers t ON t.id = s.teacher_id 
WHERE t.id = 5;