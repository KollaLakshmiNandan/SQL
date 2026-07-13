/*
=========================================================
FILE : 03_crud_operations.sql
=========================================================

Definition:
CRUD stands for Create, Read, Update and Delete.

CRUD operations are the four basic operations performed
on data stored in a database.

C - Create  → INSERT
R - Read    → SELECT
U - Update  → UPDATE
D - Delete  → DELETE

Real-Time Example:
Suppose a company has an Employee Management System.

Create  -> Add a new employee.
Read    -> View employee details.
Update  -> Modify employee salary.
Delete  -> Remove an employee who resigned.

=========================================================
*/

-- =========================================
-- INSERT
-- =========================================

-- Meaning:
-- INSERT is used to add new records into a table.

-- Syntax

INSERT INTO Employee
VALUES
(emp_id, emp_name, email, salary, age, dept_id);

-- Example

INSERT INTO Employee
VALUES
(1,'John','john@gmail.com',45000,25,101);

INSERT INTO Employee
VALUES
(2,'David','david@gmail.com',50000,28,102);

INSERT INTO Employee
VALUES
(3,'Emma','emma@gmail.com',60000,30,103);

-- Display inserted records

SELECT * FROM Employee;

------------------------------------------------------------

-- =========================================
-- SELECT
-- =========================================

-- Meaning:
-- SELECT retrieves data from one or more tables.

-- Display all columns

SELECT *
FROM Employee;

------------------------------------------------------------

-- Display only Employee Name

SELECT emp_name
FROM Employee;

------------------------------------------------------------

-- Display Employee Name and Salary

SELECT emp_name,
salary
FROM Employee;

------------------------------------------------------------

-- Display Employee Name and Department

SELECT emp_name,
dept_id
FROM Employee;

------------------------------------------------------------

-- =========================================
-- UPDATE
-- =========================================

-- Meaning:
-- UPDATE modifies existing records in a table.

-- Increase John's salary

UPDATE Employee
SET salary = 55000
WHERE emp_id = 1;

-- Verify

SELECT *
FROM Employee
WHERE emp_id = 1;

------------------------------------------------------------

-- Change Department

UPDATE Employee
SET dept_id = 104
WHERE emp_id = 2;

SELECT *
FROM Employee
WHERE emp_id = 2;

------------------------------------------------------------

-- Change Employee Name

UPDATE Employee
SET emp_name = 'Michael'
WHERE emp_id = 3;

SELECT *
FROM Employee
WHERE emp_id = 3;

------------------------------------------------------------

-- =========================================
-- DELETE
-- =========================================

-- Meaning:
-- DELETE removes specific records from a table.

-- Delete Employee ID 3

DELETE FROM Employee
WHERE emp_id = 3;

-- Verify

SELECT *
FROM Employee;

------------------------------------------------------------

-- Delete Employee ID 2

DELETE FROM Employee
WHERE emp_id = 2;

SELECT *
FROM Employee;

------------------------------------------------------------

-- Important Note

-- DELETE removes only matching rows.

-- Without WHERE clause

DELETE FROM Employee;

-- This deletes ALL rows from Employee table.

------------------------------------------------------------

/*
=========================================================
SUMMARY
=========================================================

INSERT  -> Adds new records.

SELECT  -> Retrieves records.

UPDATE  -> Modifies existing records.

DELETE  -> Removes records.

These four operations are collectively called
CRUD Operations.

=========================================================
*/