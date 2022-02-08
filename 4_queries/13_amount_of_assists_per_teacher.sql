select
  t.name as teacher,
  c.name as cohort,
  count(ar.id) as total_assistances
FROM assistance_requests ar
  JOIN teachers t ON t.id = ar.teacher_id
  JOIN students s ON s.id = ar.student_id
  JOIN cohorts c ON c.id = s.cohort_id
WHERE c.name = 'JUL02'
GROUP BY teacher, cohort
ORDER BY teacher ASC;