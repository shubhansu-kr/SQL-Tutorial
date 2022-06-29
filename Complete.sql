CREATE TABLE student(
    student_id INT PRIMARY KEY,
    st_name VARCHAR(26), 
    major VARCHAR(26) 
);

DESCRIBE student;

DROP TABLE student;

INSERT INTO student VALUES(
    -- Follow the order in which the table is created to insert the data.
    1, 'Jack', 'Biology'
);

SELECT * FROM student;

INSERT INTO student VALUES(
    2, 'John', 'Economics'
);

INSERT INTO student VALUES(
    3, 'Angel', 'English'
);

INSERT INTO student VALUES(
    4, 'David', 'Maths'
);

INSERT INTO student (student_id, st_name) VALUES (5, 'Adam');

DROP TABLE student;

CREATE TABLE student (
    student_id INT,
    st_name VARCHAR(26) NOT NULL, -- name can't be empty
    major VARCHAR(26) UNIQUE, -- Data had to be unique in the row
    PRIMARY KEY(student_id)
);

DESCRIBE student;

INSERT INTO student VALUES(
    2, NULL, 'Economics' 
    -- Throws error since name cant be null 
);

INSERT INTO student VALUES(2, 'John', 'Economics'),(3, 'Angel', 'English'),(4, 'David', 'Maths');

SELECT * FROM student;

INSERT INTO student (student_id, st_name) VALUES (1, 'Jake');

INSERT INTO student (student_id, st_name) VALUES (5, 'Philip'); 

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

SELECT * FROM student;

DROP TABLE  student;

CREATE TABLE student (
    student_id INT AUTO_INCREMENT,
    st_name VARCHAR(26), 
    major VARCHAR(26) DEFAULT 'Undecided', --  
    PRIMARY KEY(student_id)
);

INSERT INTO student (st_name, major) VALUES ('Jake', 'Biology');
INSERT INTO student (st_name, major) VALUES ('Philip', 'English');

INSERT INTO student VALUES (5, 'Angel', 'English'),(4, 'David', 'Maths');

INSERT INTO student (st_name, major) VALUES ('Connor', 'Vloggin');

SELECT * FROM student ;

UPDATE student 
SET major = 'Mathematics'
WHERE major = 'Maths';

UPDATE student 
SET major = 'French'
WHERE student_id = 2 ;

UPDATE student 
SET major = 'Language'
WHERE major = 'English' OR major = 'French';

SELECT * from student ;

DELETE FROM student 
WHERE student_id = 5; 

INSERT INTO student (st_name, major) VALUES ('Shivam', 'Science'),('Raushan', 'Science'),('Aditya', 'Commerce'),('Jha', 'Arts');

SELECT st_name 
FROM student;

SELECT major, st_name
FROM student;

SELECT student.st_name, student.major
FROM student
ORDER BY st_name;

SELECT student.st_name, student.major
FROM student
ORDER BY st_name DESC; 

SELECT student.st_name, student.major
FROM student
ORDER BY student_id;

SELECT *
FROM student
ORDER BY major, student_id
LIMIT 2 ;

SELECT *
FROM student
WHERE major = 'Science' ;

SELECT *
FROM student
WHERE major = 'Science' AND student_id <> 8 ;

DROP TABLE student;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(26),
    last_name VARCHAR(26),
    birth_day DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT, -- super_id & branch_id are foreign keys, but we cannot
    branch_id INT -- set them as foreign key since we dont have tables available to link.
);

CREATE TABLE branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(26),
    mgr_id INT,
    mgr_start_date DATE,
    FOREIGN KEY (mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL
);

ALTER TABLE employee 
ADD FOREIGN KEY (branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

ALTER TABLE employee 
ADD FOREIGN KEY (super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

CREATE TABLE client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(26),
    branch_id INT,
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

CREATE TABLE works_with (
    emp_id INT,
    client_id INT, 
    total_sales INT, 
    PRIMARY KEY (emp_id, client_id), 
    FOREIGN KEY (emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (client_id) REFERENCES client(client_id) ON DELETE CASCADE
);

CREATE TABLE branch_supplier (
    branch_id INT,
    supplier_name VARCHAR(26),
    supplier_type VARCHAR (26),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE cascade
);

-- Entering corporate branch (branch_id 1) employee data 

INSERT INTO employee VALUES(100, 'David', 'Wallace', '1967-11-17', 'M', 250000, NULL, NULL);
-- We have to initialise the branch_id with null, since branch is not created 
-- yet and foreign key will throw error. 

INSERT INTO branch VALUES(1, 'Corporate', 100, '2006-02-09');

-- Updating foreign key val since branch is created 
UPDATE employee
SET branch_id = 1
WHERE emp_id = 100;

INSERT INTO employee VALUES(101, 'Jan', 'Levinson', '1961-05-11', 'F', 110000, 100, 1);

SELECT * FROM employee;
SELECT * FROM branch;

INSERT INTO employee VALUES(102, 'Michael', 'Scott', '1964-03-15', 'M', 75000, 100, NULL);

INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');

UPDATE employee
SET branch_id = 2
WHERE emp_id = 102;

INSERT INTO employee VALUES(103, 'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, 2);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05', 'F', 55000, 102, 2);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, 2);

-- Stamford
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);

INSERT INTO branch VALUES(3, 'Stamford', 106, '1998-02-13');

UPDATE employee
SET branch_id = 3
WHERE emp_id = 106;

INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, 3);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M', 71000, 106, 3);

-- BRANCH SUPPLIER
INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

-- CLIENT
INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);
INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper', 3);
INSERT INTO client VALUES(406, 'FedEx', 2);

-- WORKS_WITH
INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

SELECT *
FROM employee;

-- Find all clients
SELECT *
FROM client;

-- Find all employees ordered by salary
SELECT *
from employee
ORDER BY salary DESC;

-- Find all employees ordered by sex then name
SELECT *
from employee
ORDER BY sex, first_name;

-- Find the first 5 employees in the table
SELECT *
from employee
LIMIT 5;

-- Find the first and last names of all employees
SELECT first_name, employee.last_name
FROM employee;

-- Find the forename and surnames names of all employees
SELECT first_name AS forename, employee.last_name AS surname
FROM employee;

-- Find out all the different genders
SELECT DISCTINCT sex
FROM employee;

-- Find all male employees
SELECT *
FROM employee
WHERE sex = 'M';

-- Find all employees at branch 2
SELECT *
FROM employee
WHERE branch_id = 2;

-- Find all employee's id's and names who were born after 1969
SELECT emp_id, first_name, last_name
FROM employee
WHERE birth_day >= 1970-01-01;

-- Find all female employees at branch 2
SELECT *
FROM employee
WHERE branch_id = 2 AND sex = 'F';

-- Find all employees who are female & born after 1969 or who make over 80000
SELECT *
FROM employee
WHERE (birth_day >= '1970-01-01' AND sex = 'F') OR salary > 80000;

-- Find all employees born between 1970 and 1975
SELECT *
FROM employee
WHERE birth_day BETWEEN '1970-01-01' AND '1975-01-01';

-- Find all employees named Jim, Michael, Johnny or David
SELECT *
FROM employee
WHERE first_name IN ('Jim', 'Michael', 'Johnny', 'David');


-- Find the number of employees
SELECT COUNT(super_id)
FROM employee;

-- Find the average of all employee's salaries
SELECT AVG(salary)
FROM employee;

-- Find the sum of all employee's salaries
SELECT SUM(salary)
FROM employee;

-- Find out how many males and females there are
SELECT COUNT(sex), sex
FROM employee
GROUP BY sex;

-- Find the total sales of each salesman
SELECT SUM(total_sales), emp_id
FROM works_with
GROUP BY client_id;

-- Find the total amount of money spent by each client
SELECT SUM(total_sales), client_id
FROM works_with
GROUP BY client_id;

SELECT * 
FROM client
WHERE client_name LIKE '%LLC';

SELECT * 
FROM branch_supplier
WHERE supplier_name LIKE '%Labels';

SELECT * 
FROM employee
WHERE birth_day LIKE '____-02%';

SELECT *
FROM client
WHERE client_name LIKE '%school%';

SELECT first_name 
FROM employee
UNION
SELECT branch_name 
FROM branch;

    SELECT first_name
    FROM employee
UNION
    SELECT branch_name
    FROM branch
UNION
    SELECT client_name
    FROM client;

INSERT INTO branch VALUES(4, "Buffalo", NULL, NULL);

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch    -- LEFT JOIN, RIGHT JOIN
ON employee.emp_id = branch.mgr_id;

select * FROM branch;
SELECT * FROM employee;

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch   
ON employee.emp_id = branch.mgr_id;

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch   
ON employee.emp_id = branch.mgr_id;

SELECT emp_id
FROM works_with
WHERE total_sales > 100000;

SELECT employee.first_name, employee.last_name
FROM employee
WHERE emp_id IN (101, 103, 102);

SELECT employee.first_name, employee.last_name
FROM employee
WHERE emp_id IN (
    SELECT emp_id
    FROM works_with
    WHERE total_sales > 30000
);
