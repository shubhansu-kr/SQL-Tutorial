-- Wildcards are used to filter out result which match a specific pattern.

-- Find any client who are an LLC 
SELECT * 
FROM client
WHERE client_name LIKE '%LLC';
-- Here '%' sign stands for any number of char, so sql will look for LLC 
-- in the string with suffix having any number of char. 


-- % -> Any number of characters
-- _ -> One character

-- Find any branch supplier who are in label business 
SELECT * 
FROM branch_supplier
WHERE supplier_name LIKE '%Labels';

-- Find any employee born in February
SELECT * 
FROM employee
WHERE birth_day LIKE '____-02%';

-- Find any client who are schools
SELECT *
FROM client
WHERE client_name LIKE '%school%';