SELECT COUNT(a) AS total_assistances, t.name AS name
FROM assistance_requests a
  JOIN teachers t ON a.teacher_id = t.id
  GROUP BY name
  HAVING t.name = 'Waylon Boehm';