-- Знайти які курси читає певний викладач.

SELECT t.id, t.full_name_teacher, s.subject 
FROM subjects s 
LEFT JOIN teachers t ON s.teacher_id = t.id 
WHERE t.id = 5;