--7.Знайти оцінки студентів у окремій групі з певного предмета.
SELECT
	m.id,
	m.mark,
	s.fullname
FROM marks m
inner JOIN students s ON s.id = m.student_id
WHERE m.subject_id = 3 AND s.group_id = 1
GROUP BY m.id
ORDER BY s.fullname;