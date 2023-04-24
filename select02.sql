SELECT * FROM student;
SELECT `name`,(chinese + english + math) FROM student;
SELECT `name`,(chinese + english + math +10) FROM student;
SELECT `name`AS `名`,(chinese + english + math +10) AS total_score FROM student;