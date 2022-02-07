SELECT cohorts.name AS cohort, COUNT(*) AS total_submissions
FROM cohorts
  JOIN students ON students.cohort_id = cohorts.id
  JOIN assignment_submissions on assignment_submissions.student_id = students.id
GROUP BY cohort
ORDER BY total_submissions DESC;