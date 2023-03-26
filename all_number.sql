--Знайти 5 студентів із найбільшим середнім балом з усіх предметів.

SELECT s.full_name_student, ROUND(avg(g.grade), 0) AS avg_grate
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
GROUP BY s.id 
ORDER BY avg_grate DESC
LIMIT 5;


-- Знайти студента із найвищим середнім балом з певного предмета.

SELECT sub.subject, s.full_name_student, ROUND(avg(g.grade), 0) AS avg_grate
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN subjects sub ON sub.id = g.subject_id
WHERE sub.id = 3
GROUP BY s.id 
ORDER BY avg_grate DESC
LIMIT 1;


-- Знайти середній бал у групах з певного предмета.

SELECT gr.name_group, sub.subject, ROUND(avg(g.grade), 0) AS avg_grate 
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN subjects sub ON sub.id = g.subject_id
LEFT JOIN [groups] gr ON gr.id = s.group_id  
WHERE sub.id = 2
GROUP BY gr.id 
ORDER BY avg_grate DESC;


--Знайти середній бал на потоці (по всій таблиці оцінок)

SELECT gr.name_group, ROUND(avg(g.grade), 0) AS avg_grate
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN [groups] gr ON gr.id = s.group_id
WHERE gr.id = 3
GROUP BY gr.id; 


-- Знайти які курси читає певний викладач.

SELECT t.id, t.full_name_teacher, s.subject 
FROM subjects s 
LEFT JOIN teachers t ON s.teacher_id = t.id 
WHERE t.id = 5;


-- Знайти список студентів у певній групі

SELECT g.id, g.name_group, s.full_name_student 
FROM groups g 
LEFT JOIN students s ON s.group_id = g.id 
WHERE g.id = 3;


-- Знайти оцінки студентів у окремій групі з певного предмета.

SELECT gr.name_group, sub.subject, s.full_name_student, g.grade 
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN [groups] gr ON gr.id = s.group_id 
LEFT JOIN subjects sub ON g.subject_id = sub.id 
WHERE gr.id = 3 AND sub.id = 5;


-- Знайти середній бал, який ставить певний викладач зі своїх предметів.

SELECT t.full_name_teacher, ROUND(avg(g.grade),0) AS avg_grate
FROM grades g
LEFT JOIN subjects s ON g.subject_id = s.id 
LEFT JOIN teachers t ON t.id = s.teacher_id 
WHERE t.id = 5;


-- Знайти список курсів, які відвідує студент.

SELECT s.full_name_student, sub.subject 
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN subjects sub ON sub.id = g.subject_id 
WHERE s.id = 12
GROUP BY sub.id; 


-- Список курсів, які певному студенту читає певний викладач.

SELECT t.full_name_teacher, s.full_name_student, sub.subject 
FROM grades g
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN subjects sub ON sub.id = g.subject_id 
LEFT JOIN teachers t ON t.id = sub.teacher_id 
WHERE t.id = 3 AND s.id = 6
GROUP BY sub.id;


-- Середній бал, який певний викладач ставить певному студентові

SELECT t.full_name_teacher, s.full_name_student, ROUND(avg(g.grade), 0) AS avg_grate
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN subjects sub ON sub.id = g.subject_id 
LEFT JOIN teachers t ON t.id = sub.teacher_id
WHERE t.id = 3 AND s.id = 20;


-- Оцінки студентів у певній групі з певного предмета на останньому занятті.

SELECT gr.name_group, s.full_name_student, sub.subject, g.grade, DATE(g.date_of)  
FROM grades g 
LEFT JOIN students s ON s.id = g.student_id 
LEFT JOIN subjects sub ON sub.id = g.subject_id 
LEFT JOIN [groups] gr ON gr.id = s.group_id 
WHERE gr.id = 1 AND sub.id = 1 
GROUP BY s.id 
ORDER BY g.date_of DESC;




