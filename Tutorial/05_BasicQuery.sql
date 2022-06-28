-- Lets insert some data into tables 
INSERT INTO student (st_name, major) VALUES ('Shivam', 'Science'),('Raushan', 'Science'),('Aditya', 'Commerce'),('Jha', 'Arts');

SELECT * FROM student;

-- Select is used to retrieve information from database 
-- * (Astrix) represents all 

-- Select all columns from student 
SELECT * 
FROM student ;

-- Select only name columns from table
SELECT st_name 
FROM student;

-- Select specific columns from table
SELECT major, st_name
FROM student;

-- We can specify the table name in column rendring for better 
-- readability and sort the result based on different parameters.
SELECT student.st_name, student.major
FROM student
ORDER BY st_name;

SELECT student.st_name, student.major
FROM student
ORDER BY st_name DESC; -- Sorts in descending order 

SELECT student.st_name, student.major
FROM student
ORDER BY student_id; -- Even though we are not requesting id, we can use 
-- it as a parameter to sort 

SELECT *
FROM student
ORDER BY major, student_id; -- First by major, then by id if Clashes are there

-- Limit is used to define the number of rows in the output 
SELECT *
FROM student
ORDER BY major, student_id;
-- LIMIT 2; -- Displays only 2 rows 

SELECT *
FROM student
WHERE major = 'Science' OR student_id <> 4 ;
-- <, >, <=, >=, AND, OR, <> --> Stands for notEqual to

SELECT *
FROM student
WHERE major IN ('Bio', 'Science', 'Arts');

