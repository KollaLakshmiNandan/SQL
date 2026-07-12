/*
=========================================================
FILE : 06_joins.sql
=========================================================

Definition:
A JOIN is used to combine data from two or more tables
based on a common column.

Real-Time Example:

Suppose a company stores data in two tables.

Employee Table

emp_id | emp_name | dept_id
----------------------------
1      | John     | 101
2      | David    | 102
3      | Emma     | 103

Department Table

dept_id | dept_name
--------------------
101     | HR
102     | Finance
103     | IT

The Employee table contains only Department ID.

If we want Department Name also, we use JOINS.

Topics Covered

✔ ALIAS
✔ INNER JOIN
✔ LEFT JOIN
✔ RIGHT JOIN
✔ FULL OUTER JOIN

=========================================================
*/

-- =========================================
-- ALIAS
-- =========================================

-- Meaning:
-- Alias gives a temporary name to a column or table.

-- Column Alias

SELECT emp_name AS Employee_Name,
salary AS Employee_Salary
FROM Employee;

--------------------------------------------------

-- Table Alias

SELECT e.emp_name,
e.salary
FROM Employee e;

--------------------------------------------------

-- =========================================
-- INNER JOIN
-- =========================================

-- Meaning:
-- INNER JOIN returns only the matching records
-- from both tables.

-- Syntax

SELECT columns
FROM table1
INNER JOIN table2
ON table1.column = table2.column;

--------------------------------------------------

-- Example

SELECT
e.emp_id,
e.emp_name,
d.dept_name,
e.salary
FROM Employee e
INNER JOIN Department d
ON e.dept_id=d.dept_id;

--------------------------------------------------

-- Expected Output

/*
John      HR
David     Finance
Emma      IT
Sophia    Sales
James     Marketing
*/

--------------------------------------------------

-- =========================================
-- LEFT JOIN
-- =========================================

-- Meaning:
-- LEFT JOIN returns ALL rows from the left table
-- and matching rows from the right table.

-- Syntax

SELECT columns
FROM Employee e
LEFT JOIN Department d
ON e.dept_id=d.dept_id;

--------------------------------------------------

-- Example

SELECT
e.emp_name,
d.dept_name
FROM Employee e
LEFT JOIN Department d
ON e.dept_id=d.dept_id;

--------------------------------------------------

-- If a department is missing,
-- Employee data will still be displayed.

--------------------------------------------------

-- =========================================
-- RIGHT JOIN
-- =========================================

-- Meaning:
-- RIGHT JOIN returns ALL rows from the right table
-- and matching rows from the left table.

-- Syntax

SELECT columns
FROM Employee e
RIGHT JOIN Department d
ON e.dept_id=d.dept_id;

--------------------------------------------------

-- Example

SELECT
e.emp_name,
d.dept_name
FROM Employee e
RIGHT JOIN Department d
ON e.dept_id=d.dept_id;

--------------------------------------------------

-- If a department has no employees,
-- it will still appear.

--------------------------------------------------

-- =========================================
-- FULL OUTER JOIN
-- =========================================

-- Meaning:
-- FULL OUTER JOIN returns

-- All rows from Employee
-- +
-- All rows from Department

-- MySQL DOES NOT support FULL OUTER JOIN directly.

-- We achieve it using UNION.

SELECT
e.emp_name,
d.dept_name
FROM Employee e
LEFT JOIN Department d
ON e.dept_id=d.dept_id

UNION

SELECT
e.emp_name,
d.dept_name
FROM Employee e
RIGHT JOIN Department d
ON e.dept_id=d.dept_id;

--------------------------------------------------

/*
=========================================================
REAL-TIME EXAMPLE
=========================================================

Employee Table

John      101
David     102
Emma      103

Department Table

101 HR
102 Finance
103 IT
104 Sales

--------------------------------------------------

INNER JOIN

John    HR
David   Finance
Emma    IT

--------------------------------------------------

LEFT JOIN

John    HR
David   Finance
Emma    IT

(Shows all employees)

--------------------------------------------------

RIGHT JOIN

John    HR
David   Finance
Emma    IT
NULL    Sales

(Shows all departments)

--------------------------------------------------

FULL OUTER JOIN

John    HR
David   Finance
Emma    IT
NULL    Sales

(All Employees + All Departments)

=========================================================
INTERVIEW QUESTIONS
=========================================================

Q1. Difference between INNER JOIN and LEFT JOIN?

Answer

INNER JOIN returns only matching rows.

LEFT JOIN returns all rows from the left table
and matching rows from the right table.

--------------------------------------------------

Q2. Difference between LEFT JOIN and RIGHT JOIN?

LEFT JOIN

Returns all rows from left table.

RIGHT JOIN

Returns all rows from right table.

--------------------------------------------------

Q3. Does MySQL support FULL OUTER JOIN?

Answer

No.

It can be achieved using

LEFT JOIN
UNION
RIGHT JOIN

=========================================================
SUMMARY
=========================================================

ALIAS
→ Temporary name.

INNER JOIN
→ Matching rows only.

LEFT JOIN
→ All rows from left table.

RIGHT JOIN
→ All rows from right table.

FULL OUTER JOIN
→ All rows from both tables
(using UNION in MySQL)

=========================================================
*/