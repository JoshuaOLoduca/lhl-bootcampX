select a.day, count(a.id) AS number_of_assignments, sum(a.duration) AS duration
FROM assignments a
GROUP BY a.day
ORDER BY a.day;