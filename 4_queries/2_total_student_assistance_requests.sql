SELECT COUNT(a) AS total_assistances, s.name AS name
FROM assistance_requests a
  JOIN students s ON a.student_id = s.id
  GROUP BY name
  HAVING s.name = 'Elliot Dickinson';