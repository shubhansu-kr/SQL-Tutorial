CREATE TABLE client (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(26),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);  

