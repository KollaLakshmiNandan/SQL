/*
=========================================================
FILE : 08_ddl_commands.sql
=========================================================

Definition:
DDL (Data Definition Language) is used to create, modify,
and delete database objects such as databases and tables.

DDL Commands

✔ CREATE
✔ ALTER
✔ TRUNCATE
✔ DROP

In this file, we will cover

✔ ALTER
✔ TRUNCATE
✔ DROP

=========================================================
*/

-- =========================================
-- ALTER
-- =========================================

-- Meaning:
-- ALTER is used to modify the structure of an existing table.

-- We can

-- Add a column
-- Modify a column
-- Rename a column
-- Drop a column

--------------------------------------------------

-- Display Existing Table

DESC Employee;

--------------------------------------------------

-- Add a new column

ALTER TABLE Employee
ADD phone VARCHAR(15);

--------------------------------------------------

-- Verify

DESC Employee;

--------------------------------------------------

-- Add another column

ALTER TABLE Employee
ADD city VARCHAR(30);

--------------------------------------------------

DESC Employee;

--------------------------------------------------

-- Modify column datatype

ALTER TABLE Employee
MODIFY phone VARCHAR(20);

--------------------------------------------------

DESC Employee;

--------------------------------------------------

-- Rename Column

ALTER TABLE Employee
RENAME COLUMN city TO location;

--------------------------------------------------

DESC Employee;

--------------------------------------------------

-- Drop a column

ALTER TABLE Employee
DROP COLUMN phone;

--------------------------------------------------

DESC Employee;

--------------------------------------------------

-- =========================================
-- TRUNCATE
-- =========================================

-- Meaning:
-- TRUNCATE removes ALL rows from a table.

-- It keeps

-- Table Structure ✔
-- Column Names ✔
-- Constraints ✔

-- It removes

-- Data Only

--------------------------------------------------

-- Display records

SELECT *
FROM Employee;

--------------------------------------------------

TRUNCATE TABLE Employee;

--------------------------------------------------

-- Verify

SELECT *
FROM Employee;

--------------------------------------------------

-- Table exists

DESC Employee;

--------------------------------------------------

-- =========================================
-- DROP
-- =========================================

-- Meaning:
-- DROP permanently removes a database object.

-- It removes

-- Structure
-- Data
-- Constraints

--------------------------------------------------

-- Drop Table

DROP TABLE Employee;

--------------------------------------------------

SHOW TABLES;

--------------------------------------------------

-- Drop Department Table

DROP TABLE Department;

--------------------------------------------------

SHOW TABLES;

--------------------------------------------------

-- Drop Database

DROP DATABASE company_db;

--------------------------------------------------

SHOW DATABASES;

--------------------------------------------------

/*
=========================================================
REAL-TIME EXAMPLE
=========================================================

Suppose a company wants to store
Employee Mobile Number.

Current Table

Employee

emp_id
emp_name
salary

↓

Need Phone Number

↓

ALTER TABLE Employee
ADD phone VARCHAR(15);

--------------------------------------------------

Suppose every month
temporary employee data is loaded.

After processing,
the company wants to clear all records
but keep the table.

↓

TRUNCATE TABLE Employee;

--------------------------------------------------

Suppose a test database
is no longer required.

↓

DROP DATABASE test_db;

=========================================================
INTERVIEW QUESTIONS
=========================================================

Q1. Difference between DELETE and TRUNCATE?

DELETE

• Removes selected rows
• WHERE clause can be used
• Can rollback (inside a transaction)

TRUNCATE

• Removes all rows
• WHERE cannot be used
• Faster than DELETE
• Keeps table structure

--------------------------------------------------

Q2. Difference between TRUNCATE and DROP?

TRUNCATE

• Deletes data only
• Table still exists

DROP

• Deletes entire table
• Table no longer exists

--------------------------------------------------

Q3. Difference between ALTER and UPDATE?

ALTER

Changes table structure.

UPDATE

Changes data inside rows.

--------------------------------------------------

Q4. Which SQL category contains
ALTER, TRUNCATE and DROP?

Answer

DDL
(Data Definition Language)

=========================================================
SUMMARY
=========================================================

ALTER

✔ Modify table structure

--------------------------------------------------

TRUNCATE

✔ Remove all records
✔ Keep table

--------------------------------------------------

DROP

✔ Delete complete table/database

=========================================================
*/