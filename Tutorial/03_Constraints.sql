DROP TABLE student;

CREATE TABLE student (
    student_id INT,
    st_name VARCHAR(26) NOT NULL, -- name can't be empty
    major VARCHAR(26) UNIQUE, -- Data had to be unique in the row
    PRIMARY KEY(student_id)
);

INSERT INTO student VALUES(
    2, NULL, 'Economics' 
    -- Throws error since name cant be null 
);

INSERT INTO student VALUES(2, 'John', 'Economics'),(3, 'Angel', 'English'),(4, 'David', 'Maths');

INSERT INTO student (student_id, st_name) VALUES (1, 'Jake');
INSERT INTO student (student_id, st_name) VALUES (5, 'Philip');

-- Major should be unique in the column, however there can be more 
-- than one null entries in the column.

-- Primary key is basically Not Null && Unique 

DROP TABLE student;

CREATE TABLE student (
    student_id INT,
    st_name VARCHAR(26), 
    major VARCHAR(26) DEFAULT 'Undecided', --  
    PRIMARY KEY(student_id)
);

INSERT INTO student VALUES(2, 'John', 'Economics'),(3, 'Angel', 'English'),(4, 'David', 'Maths');

INSERT INTO student (student_id, st_name) VALUES (1, 'Jake');
INSERT INTO student (student_id, st_name) VALUES (5, 'Philip');

DROP TABLE student;

CREATE TABLE student (
    student_id INT AUTO_INCREMENT,
    st_name VARCHAR(26), 
    major VARCHAR(26) DEFAULT 'Undecided', --  
    PRIMARY KEY(student_id)
);

--  Auto inserts value for student id 
INSERT INTO student (st_name, major) VALUES ('Jake', 'Biology');
INSERT INTO student (st_name, major) VALUES ('Philip', 'English');

INSERT INTO student VALUES (5, 'Angel', 'English'),(4, 'David', 'Maths');

-- Entry made at the last row 
INSERT INTO student (st_name, major) VALUES ('Connor', 'Vloggin');

