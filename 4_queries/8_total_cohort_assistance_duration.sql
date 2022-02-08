SELECT
  c.name AS name,
  SUM(ar.completed_at - ar.started_at) AS total_duration
FROM assistance_requests ar
  JOIN students s ON s.id = ar.student_id
  JOIN cohorts c ON s.cohort_id = c.id
GROUP BY c.name
ORDER BY total_duration;