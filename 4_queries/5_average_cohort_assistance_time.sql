SELECT
  c.name AS name,
  avg(ar.completed_at - ar.started_at) AS average_assistance_request_duration
FROM assistance_requests ar
  JOIN students s ON s.id = ar.student_id
  JOIN cohorts c ON s.cohort_id = c.id
GROUP BY c.name
ORDER BY average_assistance_request_duration;