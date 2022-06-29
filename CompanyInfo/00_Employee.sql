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

-- Adding foreign key to branch table
ALTER TABLE employee 
ADD FOREIGN KEY (branch_id)
REFERENCES branch(branch_id)
ON DELETE SET NULL;

-- Adding foreign key to superviser id 
ALTER TABLE employee 
ADD FOREIGN KEY (super_id)
REFERENCES employee(emp_id)
ON DELETE SET NULL;

