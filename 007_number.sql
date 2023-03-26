-- Знайти оцінки студентів у окремій групі з певного предмета.

SELECT gr.name_group, sub.subject, s.full_name_student, g.grade 
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN [groups] gr ON gr.id = s.group_id 
LEFT JOIN subjects sub ON g.subject_id = sub.id 
WHERE gr.id = 3 AND sub.id = 5;