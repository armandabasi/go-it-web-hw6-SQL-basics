-- Знайти середній бал у групах з певного предмета.

SELECT gr.name_group, sub.subject, ROUND(avg(g.grade), 0) AS avg_grate 
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN subjects sub ON sub.id = g.subject_id
LEFT JOIN [groups] gr ON gr.id = s.group_id  
WHERE sub.id = 2
GROUP BY gr.id 
ORDER BY avg_grate DESC;