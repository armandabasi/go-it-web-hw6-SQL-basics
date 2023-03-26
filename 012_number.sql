-- Оцінки студентів у певній групі з певного предмета на останньому занятті.

SELECT gr.name_group, s.full_name_student, sub.subject, g.grade, DATE(g.date_of)  
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN subjects sub ON sub.id = g.subject_id 
LEFT JOIN [groups] gr ON gr.id = s.group_id 
WHERE gr.id = 1 AND sub.id = 1 
GROUP BY s.id 
ORDER BY g.date_of DESC;