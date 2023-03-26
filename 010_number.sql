-- Список курсів, які певному студенту читає певний викладач.

SELECT t.full_name_teacher, s.full_name_student, sub.subject 
FROM grades g
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN subjects sub ON sub.id = g.subject_id 
LEFT JOIN teachers t ON t.id = sub.teacher_id 
WHERE t.id = 3 AND s.id = 6
GROUP BY sub.id;