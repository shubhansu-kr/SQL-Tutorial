-- Unions are used to merge multiple select statements into one and get 
-- the result in a single column. 

    SELECT first_name as datad
    FROM employee
UNION
    SELECT branch_name
    FROM branch
UNION
    SELECT client_name
    FROM client;

-- Number of columns in both union select should be same 


-- Find a list of employee and branch names
SELECT employee.first_name AS Employee_Branch_Names
FROM employee
UNION
SELECT branch.branch_name
FROM branch;

-- Find a list of all clients & branch suppliers' names
SELECT client.client_name AS Non_Employee_Entities, client.branch_id AS Branch_ID
FROM client
UNION
SELECT branch_supplier.supplier_name, branch_supplier.branch_id
FROM branch_supplier;
