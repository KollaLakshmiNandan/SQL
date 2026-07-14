/*
=========================================================
FILE : SQL_COMMAND_CATEGORIES.sql
=========================================================

Definition:
SQL (Structured Query Language) is used to communicate
with relational databases.

SQL commands are divided into five categories:

1. DDL (Data Definition Language)
2. DML (Data Manipulation Language)
3. DQL (Data Query Language)
4. DCL (Data Control Language)
5. TCL (Transaction Control Language)

=========================================================
*/

-- =====================================================
-- DDL (Data Definition Language)
-- =====================================================

-- Definition:
-- DDL commands are used to create, modify and delete
-- database objects such as databases and tables.

-- Commands:
-- CREATE
-- ALTER
-- TRUNCATE
-- DROP

----------------------------------------------------------

-- Create Database

CREATE DATABASE office_db;

----------------------------------------------------------

-- Use Database

USE office_db;

----------------------------------------------------------

-- Create Table

CREATE TABLE Employee
(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary DECIMAL(10,2)
);

----------------------------------------------------------

-- Alter Table

ALTER TABLE Employee
ADD age INT;

----------------------------------------------------------

-- Truncate Table

TRUNCATE TABLE Employee;

----------------------------------------------------------

-- Drop Table

DROP TABLE Employee;

----------------------------------------------------------

-- Drop Database

DROP DATABASE office_db;

=========================================================
-- DML (Data Manipulation Language)
=========================================================

-- Definition:
-- DML commands are used to insert, update and delete
-- records from a table.

-- Commands:
-- INSERT
-- UPDATE
-- DELETE

----------------------------------------------------------

-- Insert Record

INSERT INTO Employee
VALUES
(1,'John',50000);

----------------------------------------------------------

-- Update Record

UPDATE Employee
SET salary=60000
WHERE emp_id=1;

----------------------------------------------------------

-- Delete Record

DELETE FROM Employee
WHERE emp_id=1;

=========================================================
-- DQL (Data Query Language)
=========================================================

-- Definition:
-- DQL commands are used to retrieve data from a table.

-- Command:
-- SELECT

----------------------------------------------------------

-- Display All Records

SELECT *
FROM Employee;

----------------------------------------------------------

-- Display Employee Name

SELECT emp_name
FROM Employee;

----------------------------------------------------------

-- Display Employee Name and Salary

SELECT emp_name,
salary
FROM Employee;

=========================================================
-- DCL (Data Control Language)
=========================================================

-- Definition:
-- DCL commands are used to control user permissions
-- and database security.

-- Commands:
-- GRANT
-- REVOKE

----------------------------------------------------------

-- Create User

CREATE USER 'developer'@'%'
IDENTIFIED BY 'Dev@123';

----------------------------------------------------------

-- Grant Permission

GRANT SELECT,INSERT
ON office_db.*
TO 'developer'@'%';

----------------------------------------------------------

-- Show Permissions

SHOW GRANTS
FOR 'developer'@'%';

----------------------------------------------------------

-- Revoke Permission

REVOKE INSERT
ON office_db.*
FROM 'developer'@'%';

=========================================================
-- TCL (Transaction Control Language)
=========================================================

-- Definition:
-- TCL commands are used to manage transactions
-- in a database.

-- Commands:
-- START TRANSACTION
-- COMMIT
-- ROLLBACK

----------------------------------------------------------

-- Start Transaction

START TRANSACTION;

----------------------------------------------------------

-- Update Salary

UPDATE Employee
SET salary=70000
WHERE emp_id=1;

----------------------------------------------------------

-- Save Changes

COMMIT;

----------------------------------------------------------

-- Start Another Transaction

START TRANSACTION;

----------------------------------------------------------

-- Update Salary

UPDATE Employee
SET salary=90000
WHERE emp_id=1;

----------------------------------------------------------

-- Undo Changes

ROLLBACK;

=========================================================
SUMMARY
=========================================================

DDL
→ Creates and modifies database objects.

Commands:
CREATE
ALTER
TRUNCATE
DROP

----------------------------------------------------------

DML
→ Manipulates data.

Commands:
INSERT
UPDATE
DELETE

----------------------------------------------------------

DQL
→ Retrieves data.

Command:
SELECT

----------------------------------------------------------

DCL
→ Controls user permissions.

Commands:
GRANT
REVOKE

----------------------------------------------------------

TCL
→ Controls transactions.

Commands:
START TRANSACTION
COMMIT
ROLLBACK

=========================================================