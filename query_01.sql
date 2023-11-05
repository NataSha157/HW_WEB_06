--1.Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT 
    s.id, 
    s.fullname, 
    ROUND(AVG(m.mark), 2) AS average_mark
FROM students s
JOIN marks m ON s.id = m.student_id
GROUP BY s.id
ORDER BY average_mark DESC
LIMIT 5;
