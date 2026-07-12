/*
=========================================================
TOPIC : CONSTRAINTS
=========================================================

Definition:
Constraints are rules applied to table columns to ensure
that only valid, accurate, and consistent data is stored.

Types of Constraints:
1. PRIMARY KEY
2. FOREIGN KEY
3. UNIQUE
4. NOT NULL
5. DEFAULT
6. CHECK
=========================================================
*/

-- =========================================
-- PRIMARY KEY
-- =========================================

-- Meaning:
-- A PRIMARY KEY uniquely identifies every record in a table.
-- It cannot contain duplicate values or NULL values.

CREATE TABLE Department
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- =========================================
-- UNIQUE
-- =========================================

-- Meaning:
-- UNIQUE prevents duplicate values in a column.
-- Example: Two employees cannot have the same email address.

CREATE TABLE Employee
(
    emp_id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);

-- Test

INSERT INTO Employee
VALUES
(1,'john@gmail.com');

-- Duplicate email (Will fail)

INSERT INTO Employee
VALUES
(2,'john@gmail.com');

------------------------------------------------------------

-- =========================================
-- NOT NULL
-- =========================================

-- Meaning:
-- NOT NULL ensures that a column must always contain a value.
-- It cannot be left empty.

CREATE TABLE Employee
(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL
);

-- Valid

INSERT INTO Employee
VALUES
(1,'John');

-- Invalid (Will fail because emp_name is NULL)

INSERT INTO Employee(emp_id)
VALUES
(2);

------------------------------------------------------------

-- =========================================
-- DEFAULT
-- =========================================

-- Meaning:
-- DEFAULT automatically assigns a value if no value is provided.

CREATE TABLE Employee
(
    emp_id INT PRIMARY KEY,
    salary DECIMAL(10,2) DEFAULT 30000
);

-- Salary will automatically become 30000

INSERT INTO Employee(emp_id)
VALUES
(1);

------------------------------------------------------------

-- =========================================
-- CHECK
-- =========================================

-- Meaning:
-- CHECK validates data before inserting it.

CREATE TABLE Employee
(
    emp_id INT PRIMARY KEY,
    age INT CHECK(age>=18)
);

-- Valid

INSERT INTO Employee
VALUES
(1,25);

-- Invalid (Will fail)

INSERT INTO Employee
VALUES
(2,15);

------------------------------------------------------------

-- =========================================
-- FOREIGN KEY
-- =========================================

-- Meaning:
-- FOREIGN KEY creates a relationship between two tables.

CREATE TABLE Department
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employee
(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY(dept_id)
    REFERENCES Department(dept_id)
);

-- Valid

INSERT INTO Department
VALUES
(101,'HR');

INSERT INTO Employee
VALUES
(1,'John',101);

-- Invalid (Department 999 doesn't exist)

INSERT INTO Employee
VALUES
(2,'David',999);


CREATE TABLE Employee
(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) DEFAULT 30000,
    age INT CHECK(age >= 18),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);