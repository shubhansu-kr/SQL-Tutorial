CREATE TABLE student (
    student_id INT,
    st_name VARCHAR(26),
    major VARCHAR(26),
    PRIMARY KEY(student_id)
);

INSERT INTO student VALUES(
    -- Follow the order in which the table is created to insert the data.
    1, 'Jack', 'Biology'
);

-- Getting information from table 
SELECT * FROM student;

-- lets add more entries 
INSERT INTO student VALUES(
    2, 'John', 'Economics'
);

INSERT INTO student VALUES(
    3, 'Angel', 'English'
);

INSERT INTO student VALUES(
    4, 'David', 'Maths'
);

-- Or we can do this in one line 
INSERT INTO student VALUES(2, 'John', 'Economics'),(3, 'Angel', 'English'),(4, 'David', 'Maths');

-- Inserting specific col data 
INSERT INTO student (student_id, st_name) VALUES (5, 'Adam');

