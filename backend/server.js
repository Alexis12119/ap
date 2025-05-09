const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const connection = require('./db');

const app = express();
const port = 3002;

// Middleware
app.use(cors());
app.use(bodyParser.json());

// GET lessons by grade level
app.get('/api/lessons', (req, res) => {
  const gradeLevel = req.query.gradeLevel; // Get the gradeLevel from query parameters
  console.log(gradeLevel);

  let query = 'SELECT * FROM lessons';
  const queryParams = [];

  if (gradeLevel) {
    query += ' WHERE grade_level = ?';  // Add condition to filter by grade level
    queryParams.push(gradeLevel);
  }

  connection.query(query, queryParams, (err, results) => {
    if (err) {
      console.error('Error fetching lessons from database:', err);
      return res.status(500).json({ error: 'Error fetching lessons' });
    }

    res.json(results);
  });
});

app.post('/api/login', (req, res) => {
  const { email, password, role } = req.body;

  // Validate input
  if (!email || !password || !role) {
    return res.status(400).json({ error: 'Email and password are required' });
  }

  // Query database for user
  const query = 'SELECT * FROM users WHERE email = ?';
  connection.query(query, [email], (err, results) => {
    if (err) {
      console.error('Error checking user credentials:', err);
      return res.status(500).json({ error: 'Error logging in' });
    }

    // Check if user exists
    if (results.length === 0) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }

    const user = results[0];

    if (user.role !== role) {
      return res.status(401).json({ error: 'Invalid role' });
    }

    // Compare password (you should use bcrypt for hashing passwords in a real-world app)
    if (user.password !== password) {
      return res.status(401).json({ error: 'Invalid credentials' });
    }

    // Login successful
    res.status(200).json({
      message: 'Login successful',
      userId: user.id,
      role: user.role,
      email: user.email,
    });
  });
});

// POST add a new lesson
app.post('/api/lessons', (req, res) => {
  const { gradeLevel, title, fileId } = req.body;

  // Validate data
  if (!gradeLevel || !title || !fileId) {
    return res.status(400).json({ error: 'Grade level, title, and fileId are required' });
  }

  const query = 'INSERT INTO lessons (grade_level, title, fileId) VALUES (?, ?, ?)';
  connection.query(query, [gradeLevel, title, fileId], (err, results) => {
    if (err) {
      console.error('Error inserting lesson:', err);
      return res.status(500).json({ error: 'Failed to add lesson' });
    }

    res.status(201).json({ message: 'Lesson added successfully', id: results.insertId });
  });
});

// DELETE delete a lesson
app.delete('/api/lessons/:id', (req, res) => {
  const { id } = req.params;
  const query = 'DELETE FROM lessons WHERE id = ?';
  connection.query(query, [id], (err, results) => {
    if (err) {
      console.error('Error deleting lesson:', err);
      return res.status(500).json({ error: 'Error deleting lesson' });
    }
    if (results.affectedRows === 0) {
      return res.status(404).json({ error: 'Lesson not found' });
    }
    res.status(200).json({ message: 'Lesson deleted successfully' });
  });
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
