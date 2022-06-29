CREATE TABLE branch_supplier (
    branch_id INT,
    supplier_name VARCHAR(26),
    supplier_type VARCHAR (26),
    PRIMARY KEY(branch_id, supplier_name),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

