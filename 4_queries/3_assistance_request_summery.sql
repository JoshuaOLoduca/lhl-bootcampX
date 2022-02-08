SELECT t.name AS teacher,
  s.name AS student,
  a.name as assignment,
  ar.completed_at - ar.started_at as duration
FROM assistance_requests ar
  JOIN teachers t ON t.id = ar.teacher_id
  JOIN assignments a ON a.id = ar.assignment_id
  JOIN students s ON s.id = ar.student_id
WHERE ar.completed_at IS NOT NULL
ORDER BY duration;