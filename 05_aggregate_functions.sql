/*
=========================================================
FILE : 05_aggregate_functions.sql
=========================================================

Definition:
Aggregate Functions perform calculations on multiple rows
and return a single value.

Instead of displaying every record, Aggregate Functions
summarize the data.

Real-Time Example:

Suppose a company has 10,000 employees.

The manager wants to know:

• Total Employees
• Highest Salary
• Lowest Salary
• Total Salary Paid
• Average Salary

Instead of calculating manually, SQL provides Aggregate
Functions.

Topics Covered

✔ COUNT()
✔ MAX()
✔ MIN()
✔ SUM()
✔ AVG()
✔ GROUP BY
✔ HAVING

=========================================================
*/

-- =========================================
-- COUNT()
-- =========================================

-- Meaning:
-- COUNT() returns the total number of rows.

-- Count all employees

SELECT COUNT(*)
FROM Employee;

--------------------------------------------------

-- Count employees in IT Department

SELECT COUNT(*)
FROM Employee
WHERE dept_id=103;

--------------------------------------------------

-- Count employees whose salary is greater than 50000

SELECT COUNT(*)
FROM Employee
WHERE salary>50000;

--------------------------------------------------

-- =========================================
-- MAX()
-- =========================================

-- Meaning:
-- MAX() returns the highest value.

-- Highest Salary

SELECT MAX(salary)
FROM Employee;

--------------------------------------------------

-- Maximum Age

SELECT MAX(age)
FROM Employee;

--------------------------------------------------

-- =========================================
-- MIN()
-- =========================================

-- Meaning:
-- MIN() returns the lowest value.

-- Lowest Salary

SELECT MIN(salary)
FROM Employee;

--------------------------------------------------

-- Youngest Employee Age

SELECT MIN(age)
FROM Employee;

--------------------------------------------------

-- =========================================
-- SUM()
-- =========================================

-- Meaning:
-- SUM() returns the total of a numeric column.

-- Total Salary Paid

SELECT SUM(salary)
FROM Employee;

--------------------------------------------------

-- Total Salary of IT Department

SELECT SUM(salary)
FROM Employee
WHERE dept_id=103;

--------------------------------------------------

-- =========================================
-- AVG()
-- =========================================

-- Meaning:
-- AVG() returns the average value.

-- Average Salary

SELECT AVG(salary)
FROM Employee;

--------------------------------------------------

-- Average Age

SELECT AVG(age)
FROM Employee;

--------------------------------------------------

-- =========================================
-- GROUP BY
-- =========================================

-- Meaning:
-- GROUP BY groups rows having the same values
-- and performs aggregate functions on each group.

-- Count employees in each department

SELECT dept_id,
COUNT(*)
FROM Employee
GROUP BY dept_id;

--------------------------------------------------

-- Total salary in each department

SELECT dept_id,
SUM(salary)
FROM Employee
GROUP BY dept_id;

--------------------------------------------------

-- Average salary department-wise

SELECT dept_id,
AVG(salary)
FROM Employee
GROUP BY dept_id;

--------------------------------------------------

-- Highest salary department-wise

SELECT dept_id,
MAX(salary)
FROM Employee
GROUP BY dept_id;

--------------------------------------------------

-- =========================================
-- HAVING
-- =========================================

-- Meaning:
-- HAVING filters grouped data.
-- WHERE filters individual rows.
-- HAVING filters groups after GROUP BY.

-- Departments having more than one employee

SELECT dept_id,
COUNT(*)
FROM Employee
GROUP BY dept_id
HAVING COUNT(*)>1;

--------------------------------------------------

-- Departments where average salary is above 55000

SELECT dept_id,
AVG(salary)
FROM Employee
GROUP BY dept_id
HAVING AVG(salary)>55000;

--------------------------------------------------

-- Departments where total salary is above 100000

SELECT dept_id,
SUM(salary)
FROM Employee
GROUP BY dept_id
HAVING SUM(salary)>100000;

--------------------------------------------------

/*
=========================================================
INTERVIEW QUESTIONS
=========================================================

Q1. Difference between COUNT(*) and COUNT(column)?

Answer:
COUNT(*) counts all rows.
COUNT(column) counts only non-NULL values.

--------------------------------------------------

Q2. Difference between WHERE and HAVING?

WHERE filters rows before grouping.

HAVING filters groups after GROUP BY.

--------------------------------------------------

Q3. Can HAVING be used without GROUP BY?

Yes, but it is mainly used with GROUP BY.

=========================================================
SUMMARY
=========================================================

COUNT()   -> Counts rows

MAX()     -> Highest value

MIN()     -> Lowest value

SUM()     -> Total value

AVG()     -> Average value

GROUP BY  -> Groups rows

HAVING    -> Filters grouped data

=========================================================
*/