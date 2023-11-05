--10.Список курсів, які певному студенту читає певний викладач.
SELECT
	(SELECT s2.fullname
	FROM students s2
	WHERE m.student_id = s2.id) AS student,
	s.subject_name,
	(SELECT t.fullname
	FROM teachers t
	WHERE s.teacher_id = t.id AND t.id = 4) AS teacher
FROM marks m
JOIN subjects s ON m.subject_id = s.id
WHERE m.student_id = 24 AND teacher NOT NULL
GROUP BY m.subject_id
ORDER BY student;