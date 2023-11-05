--4.Знайти середній бал на потоці (по всій таблиці оцінок)
SELECT
	ROUND(AVG(m.mark), 2) AS average_mark
from marks m;