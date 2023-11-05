--2.Знайти студента із найвищим середнім балом з певного предмета.
SELECT
    s.id,
    s.fullname,
    ROUND(AVG(m.mark), 2) AS average_mark
FROM marks m
JOIN students s ON s.id = m.student_id
where m.subject_id = 3
GROUP BY s.id
ORDER BY average_mark DESC
LIMIT 1;