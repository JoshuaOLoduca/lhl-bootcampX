const cohort = process.argv[2] || 'JUL02';

const values = [`%${cohort}%`];

const queryString = `
SELECT 
  DISTINCT t.name AS teacher,
  c.name AS cohort
FROM assistance_requests ar
  JOIN students s ON ar.student_id = s.id
  JOIN cohorts c ON s.cohort_id = c.id
  JOIN teachers t ON ar.teacher_id = t.id
WHERE c.name LIKE $1 
ORDER BY teacher ASC;
`;

const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(queryString, values)
  .then(res => {
    res.rows.forEach(teacher => {
      console.log(`${teacher.cohort}: ${teacher.teacher}`);
    });
  })
  .catch(err => console.error('query error', err.stack));