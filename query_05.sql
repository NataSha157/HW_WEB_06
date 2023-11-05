--5.Знайти які курси читає певний викладач.
SELECT
	s.id,
	s.subject_name,
	t.fullname
FROM subjects s
JOIN teachers t on t.id = s.teacher_id
WHERE t.id = 2
GROUP BY s.id;