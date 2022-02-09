const cohort = process.argv[2];
const limit = process.argv[3] || 5;

const values = [`%${cohort}%`, limit];
const queryString = `
SELECT s.id, s.name, c.name AS cohort
FROM students s
JOIN cohorts c ON s.cohort_id = c.id
WHERE c.name LIKE $1 
LIMIT $2;
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
    console.log(res.rows);
  })
  .catch(err => console.error('query error', err.stack));