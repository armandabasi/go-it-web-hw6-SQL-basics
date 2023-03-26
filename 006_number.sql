-- Знайти список студентів у певній групі

SELECT g.id, g.name_group, s.full_name_student 
FROM groups g 
LEFT JOIN students s ON s.group_id = g.id 
WHERE g.id = 3;