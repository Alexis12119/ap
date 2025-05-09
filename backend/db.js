// backend/db.js
const mysql = require('mysql2');

// MySQL connection configuration
const connection = mysql.createConnection({
  host: 'localhost',
  user: 'franklin',
  password: '123',
  database: 'ap',
});

connection.connect((err) => {
  if (err) {
    console.error('Error connecting to MySQL:', err.stack);
  } else {
    console.log('Connected to MySQL as id ' + connection.threadId);
  }
});

module.exports = connection;

