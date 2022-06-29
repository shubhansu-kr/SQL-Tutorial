-- Joins are used to add two or more columns from different tables based on 
-- a common column

-- Add the extra branch
INSERT INTO branch VALUES(4, "Buffalo", NULL, NULL);

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch    -- LEFT JOIN, RIGHT JOIN
ON employee.emp_id = branch.mgr_id;

-- Only those entries are returned which are present on both mgr id as 
-- well as emp_id, so basically we are retrieving the data of managers
-- and their branch.

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
LEFT JOIN branch   
ON employee.emp_id = branch.mgr_id;

-- Left Join prints all the rows from the left table (in this case: employee table)
-- even if it is not present in the right table
-- Basically : Select all the rows from the left table and only matching rows 
-- from right

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
RIGHT JOIN branch   
ON employee.emp_id = branch.mgr_id;

-- Opposite to left 
