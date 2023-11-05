--9.Знайти список курсів, які відвідує студент.
SELECT
	m.id,
	m.student_id,
	s.fullname,
	(SELECT s2.subject_name
	FROM subjects s2
	WHERE m.subject_id = s2.id) AS kurs
FROM marks m
JOIN students s ON m.student_id = s.id
GROUP BY m.id
ORDER BY s.fullname;