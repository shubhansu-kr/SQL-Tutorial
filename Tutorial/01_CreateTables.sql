CREATE TABLE student(
    student_id INT PRIMARY KEY,
    st_name VARCHAR(26), 
    major VARCHAR(26) 
);

-- Used to get information about the table student 
-- DESCRIBE student;

-- delete the table student 
DROP TABLE student;

-- Add a column to the table 
ALTER TABLE student ADD gpa DECIMAL(3, 2);

-- Delete a column in the table 
ALTER TABLE student DROP COLUMN gpa;