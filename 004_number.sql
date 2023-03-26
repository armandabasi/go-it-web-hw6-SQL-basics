--Знайти середній бал на потоці (по всій таблиці оцінок)

SELECT gr.name_group, ROUND(avg(g.grade), 0) AS avg_grate
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN [groups] gr ON gr.id = s.group_id
WHERE gr.id = 3
GROUP BY gr.id; 