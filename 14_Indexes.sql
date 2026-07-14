/*
=========================================================
FILE : 12_indexes.sql
=========================================================

Definition:
An Index is a database object that improves the speed
of data retrieval operations on one or more columns.

Instead of scanning every row in a table, MySQL uses
an index to quickly locate the required records.

Indexes improve SELECT query performance but require
additional storage and can slightly slow INSERT,
UPDATE and DELETE operations because the index also
needs to be updated.

Real-Time Scenario:

ABC Technologies has an HR Management System.

The Employee table contains more than 5 million records.

HR frequently searches employees using:

✔ Employee Name
✔ Email
✔ Department
✔ Salary

Searching the complete table takes time.

To improve performance, the DBA creates indexes.

=========================================================

TOPICS COVERED

✔ CREATE INDEX
✔ CREATE UNIQUE INDEX
✔ COMPOSITE INDEX
✔ SHOW INDEXES
✔ DROP INDEX

=========================================================
*/


-- =====================================================
-- DISPLAY EMPLOYEE TABLE
-- =====================================================

SELECT *
FROM Employee;

---------------------------------------------------------


-- =====================================================
-- TASK 1
-- CREATE INDEX ON EMPLOYEE NAME
-- =====================================================

-- Meaning:
-- Creates an index on Employee Name.

CREATE INDEX idx_emp_name
ON Employee(emp_name);

---------------------------------------------------------

SHOW INDEXES
FROM Employee;

---------------------------------------------------------


-- =====================================================
-- TASK 2
-- SEARCH EMPLOYEE USING NAME
-- =====================================================

SELECT *
FROM Employee
WHERE emp_name='John';

---------------------------------------------------------


-- =====================================================
-- TASK 3
-- CREATE INDEX ON EMAIL
-- =====================================================

-- Meaning:
-- Frequently used while Login and Employee Search.

CREATE INDEX idx_email
ON Employee(email);

---------------------------------------------------------

SHOW INDEXES
FROM Employee;

---------------------------------------------------------


-- =====================================================
-- TASK 4
-- SEARCH EMPLOYEE USING EMAIL
-- =====================================================

SELECT *
FROM Employee
WHERE email='john@gmail.com';

---------------------------------------------------------


-- =====================================================
-- TASK 5
-- CREATE INDEX ON DEPARTMENT
-- =====================================================

CREATE INDEX idx_department
ON Employee(dept_id);

---------------------------------------------------------

SHOW INDEXES
FROM Employee;

---------------------------------------------------------


-- =====================================================
-- TASK 6
-- SEARCH EMPLOYEES BY DEPARTMENT
-- =====================================================

SELECT *
FROM Employee
WHERE dept_id=103;

---------------------------------------------------------


-- =====================================================
-- TASK 7
-- CREATE COMPOSITE INDEX
-- =====================================================

-- Meaning:
-- One Index on Multiple Columns.

CREATE INDEX idx_dept_salary
ON Employee(dept_id,salary);

---------------------------------------------------------

SHOW INDEXES
FROM Employee;

---------------------------------------------------------


-- =====================================================
-- TASK 8
-- SEARCH USING COMPOSITE INDEX
-- =====================================================

SELECT *
FROM Employee
WHERE dept_id=103
AND salary>50000;

---------------------------------------------------------


-- =====================================================
-- TASK 9
-- CREATE UNIQUE INDEX
-- =====================================================

-- Meaning:
-- Prevents duplicate values.

-- NOTE:
-- Run this ONLY if email is not already UNIQUE.

CREATE UNIQUE INDEX idx_unique_email
ON Employee(email);

---------------------------------------------------------

SHOW INDEXES
FROM Employee;

---------------------------------------------------------


-- =====================================================
-- TASK 10
-- SEARCH EMPLOYEE BY EMAIL
-- =====================================================

SELECT *
FROM Employee
WHERE email='emma@gmail.com';

---------------------------------------------------------


-- =====================================================
-- TASK 11
-- DISPLAY ALL INDEXES
-- =====================================================

SHOW INDEXES
FROM Employee;

---------------------------------------------------------


-- =====================================================
-- TASK 12
-- DROP NORMAL INDEX
-- =====================================================

DROP INDEX idx_department
ON Employee;

---------------------------------------------------------

SHOW INDEXES
FROM Employee;

---------------------------------------------------------


-- =====================================================
-- TASK 13
-- DROP COMPOSITE INDEX
-- =====================================================

DROP INDEX idx_dept_salary
ON Employee;

---------------------------------------------------------

SHOW INDEXES
FROM Employee;

---------------------------------------------------------


-- =====================================================
-- TASK 14
-- DROP EMAIL INDEX
-- =====================================================

DROP INDEX idx_email
ON Employee;

---------------------------------------------------------

SHOW INDEXES
FROM Employee;

---------------------------------------------------------


-- =====================================================
-- TASK 15
-- DROP EMPLOYEE NAME INDEX
-- =====================================================

DROP INDEX idx_emp_name
ON Employee;

---------------------------------------------------------

SHOW INDEXES
FROM Employee;

---------------------------------------------------------


-- =====================================================
-- OPTIONAL
-- DISPLAY QUERY PERFORMANCE
-- =====================================================

EXPLAIN
SELECT *
FROM Employee
WHERE emp_name='John';

---------------------------------------------------------

EXPLAIN
SELECT *
FROM Employee
WHERE dept_id=103;

---------------------------------------------------------

EXPLAIN
SELECT *
FROM Employee
WHERE email='john@gmail.com';

---------------------------------------------------------


/*
=========================================================
REAL-TIME EXAMPLES
=========================================================

1. HR APPLICATION

Search Employee by Name

SELECT *
FROM Employee
WHERE emp_name='John';

---------------------------------------------------------

2. BANKING

Search Customer by Account Number

---------------------------------------------------------

3. E-COMMERCE

Search Product by Product Name

---------------------------------------------------------

4. HOSPITAL

Search Patient by Patient ID

---------------------------------------------------------

5. STUDENT MANAGEMENT

Search Student by Roll Number

=========================================================
ADVANTAGES
=========================================================

✔ Faster SELECT Queries

✔ Faster Searching

✔ Faster Filtering

✔ Faster Sorting

✔ Improves Overall Performance

=========================================================
DISADVANTAGES
=========================================================

✘ Requires Extra Storage

✘ INSERT becomes slightly slower

✘ UPDATE becomes slightly slower

✘ DELETE becomes slightly slower

=========================================================
INTERVIEW QUESTIONS
=========================================================

Q1. What is an Index?

Answer:

An Index is a database object used to improve
the speed of data retrieval.

---------------------------------------------------------

Q2. Why do we use Indexes?

Answer:

To improve query performance and reduce
search time.

---------------------------------------------------------

Q3. Which queries benefit from Indexes?

Answer:

SELECT Queries

---------------------------------------------------------

Q4. Which operations become slightly slower
after creating an Index?

Answer:

INSERT

UPDATE

DELETE

---------------------------------------------------------

Q5. What is a Composite Index?

Answer:

An Index created on multiple columns.

Example

(dept_id,salary)

---------------------------------------------------------

Q6. What is a Unique Index?

Answer:

An Index that prevents duplicate values.

---------------------------------------------------------

Q7. How do you display all indexes?

Answer:

SHOW INDEXES FROM Employee;

---------------------------------------------------------

Q8. How do you remove an Index?

Answer:

DROP INDEX index_name
ON table_name;

=========================================================
SUMMARY
=========================================================

CREATE INDEX

→ Creates a Normal Index

---------------------------------------------------------

CREATE UNIQUE INDEX

→ Prevents Duplicate Values

---------------------------------------------------------

COMPOSITE INDEX

→ Index on Multiple Columns

---------------------------------------------------------

SHOW INDEXES

→ Displays Existing Indexes

---------------------------------------------------------

DROP INDEX

→ Removes an Index

---------------------------------------------------------

EXPLAIN

→ Shows Query Execution Plan

=========================================================
END OF FILE
=========================================================