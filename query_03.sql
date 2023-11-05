--3.Знайти середній бал у групах з певного предмета.
SELECT
	s.group_id,
	(SELECT g.group_name
	FROM groups g
	WHERE s.group_id = g.id) AS group_name,
	ROUND(AVG(m.mark), 2) AS average_mark
FROM marks m
JOIN students s ON s.id = m.student_id
WHERE m.subject_id = 3
GROUP BY s.group_id;