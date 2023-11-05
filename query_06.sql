--6.Знайти список студентів у певній групі.
SELECT
	s.id,
	s.fullname,
	g.group_name
FROM students s
JOIN groups g ON g.id = s.group_id
WHERE g.id = 1
GROUP BY s.id
ORDER BY g.group_name;