-- Знайти список курсів, які відвідує студент.

SELECT s.full_name_student, sub.subject 
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN subjects sub ON sub.id = g.subject_id 
WHERE s.id = 12
GROUP BY sub.id; 