--11.Середній бал, який певний викладач ставить певному студентові.
SELECT
	m.student_id,
	(SELECT s2.fullname
	FROM students s2
	WHERE m.student_id = s2.id) AS student,
	s.teacher_id,
	ROUND(AVG(m.mark), 2) AS average_mark
FROM marks m
JOIN subjects s ON m.subject_id  = s.id
WHERE s.teacher_id = 2 AND m.student_id  = 32;