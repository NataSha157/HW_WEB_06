--8.Знайти середній бал, який ставить певний викладач зі своїх предметів.
SELECT
	(SELECT t.fullname FROM teachers t WHERE s.teacher_id = t.id AND t.id = 2) AS teacher,
	s.subject_name,
	m.mark
FROM marks m
JOIN subjects s ON m.subject_id = s.id
WHERE teacher NOT NULL
GROUP BY m.id
ORDER BY s.id;