SELECT avg(ar.completed_at - ar.started_at) AS average_assistance_request_duration
FROM assistance_requests ar;