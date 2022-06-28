-- # SQL

--  SQL stands for Structured Query Language
--  Standardized language for interacting with RDBMS
--  Used to perform CRUD operation as well as other administrative tasks
--  Used to define structures and tables 
--  SQL code used for one RDBMS is not always portable to another 
--  without modification.

/* 
    SQL is actually a hybrid language, it's basically 4 types of language 
    in one : 

    Data Query Language (DQL)
        - Query information from database 
        - Gets information that is already stored in the database 

    Data Definition Language (DFL)
        - Used for defining database schemas. 

    Data Control Language (DCL) 
        - Used for controlling access to the data in the database
        - User and permission management 

    Data Manipulation Language (DML)  
        - Used for inserting, Updating and deleting data from the database 

*/

/* 
    Query is a set of instructions given to the RDBMS (written in Sql)
    that tells the RDBMS what information you want. 
        - Schemas are usually complex 
        - Tons of data in DB 
        - Goal is to get the data you need 

    SELECT employee.name, employee.age 
    FROM employee 
    WHERE employee.salary > 100000;
*/

--  BASIC DATA TYPES IN SQL 

-- INT              -- WHOLE NUMBERS 
-- DECIMAL(M,N)     -- DECIMAL VALUES  (lENGTH M- DECIMAL DIGIT N)
-- VARCHAR(L)       -- STRING OF TEXT  (LENGTH - L)
-- BLOB             -- BINARY LARGE OBJECT 
-- DATE             -- 'YYYY-MM-DD'
-- TIMESTAMP        -- 'YYYY-MM-DD HH:MM:SS' USED FOR RECORDING 


