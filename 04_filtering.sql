/*
=========================================================
FILE : 04_filtering.sql
=========================================================

Definition:
Filtering is the process of retrieving only the required
records from a table based on one or more conditions.

Instead of displaying all records, SQL allows us to filter
the data according to our requirements.

Topics Covered

✔ WHERE
✔ DISTINCT
✔ ORDER BY
✔ LIMIT
✔ BETWEEN
✔ IN
✔ NOT IN
✔ IS NULL
✔ IS NOT NULL
✔ LIKE
✔ Wildcards

Real-Time Example:

Suppose a company has 10,000 employees.

You don't want all employees.

You want:

• Employees working in IT.
• Employees earning above 50,000.
• Employees whose names start with J.
• Top 5 highest-paid employees.

These requirements are achieved using Filtering Commands.

=========================================================
*/

-- =========================================
-- WHERE
-- =========================================

-- Meaning:
-- WHERE filters records based on a specified condition.

-- Syntax

SELECT *
FROM Employee
WHERE condition;

--------------------------------------------------

-- Employees earning more than 50000

SELECT *
FROM Employee
WHERE salary > 50000;

--------------------------------------------------

-- Employees older than 30

SELECT *
FROM Employee
WHERE age > 30;

--------------------------------------------------

-- Employees from IT Department

SELECT *
FROM Employee
WHERE dept_id = 103;

--------------------------------------------------

-- Employee named John

SELECT *
FROM Employee
WHERE emp_name='John';

--------------------------------------------------

-- Salary less than 60000

SELECT *
FROM Employee
WHERE salary < 60000;

--------------------------------------------------

-- =========================================
-- DISTINCT
-- =========================================

-- Meaning:
-- DISTINCT removes duplicate values.

-- Without DISTINCT

SELECT dept_id
FROM Employee;

--------------------------------------------------

-- With DISTINCT

SELECT DISTINCT dept_id
FROM Employee;

--------------------------------------------------

-- =========================================
-- ORDER BY
-- =========================================

-- Meaning:
-- ORDER BY sorts data in Ascending or Descending order.

-- Ascending (Default)

SELECT *
FROM Employee
ORDER BY salary;

--------------------------------------------------

-- Descending

SELECT *
FROM Employee
ORDER BY salary DESC;

--------------------------------------------------

-- Sort by Name

SELECT *
FROM Employee
ORDER BY emp_name;

--------------------------------------------------

-- =========================================
-- LIMIT
-- =========================================

-- Meaning:
-- LIMIT returns only a specified number of rows.

-- First 5 employees

SELECT *
FROM Employee
LIMIT 5;

--------------------------------------------------

-- First 3 employees

SELECT *
FROM Employee
LIMIT 3;

--------------------------------------------------

-- =========================================
-- BETWEEN
-- =========================================

-- Meaning:
-- BETWEEN retrieves values within a range.

-- Salary between 50000 and 65000

SELECT *
FROM Employee
WHERE salary BETWEEN 50000 AND 65000;

--------------------------------------------------

-- Age between 25 and 30

SELECT *
FROM Employee
WHERE age BETWEEN 25 AND 30;

--------------------------------------------------

-- =========================================
-- IN
-- =========================================

-- Meaning:
-- IN checks multiple values in a single condition.

SELECT *
FROM Employee
WHERE dept_id IN(101,103,105);

--------------------------------------------------

-- Employees from HR or Finance

SELECT *
FROM Employee
WHERE dept_id IN(101,102);

--------------------------------------------------

-- =========================================
-- NOT IN
-- =========================================

-- Meaning:
-- NOT IN excludes specified values.

SELECT *
FROM Employee
WHERE dept_id NOT IN(101,105);

--------------------------------------------------

-- =========================================
-- IS NULL
-- =========================================

-- Meaning:
-- Finds NULL values.

SELECT *
FROM Employee
WHERE email IS NULL;

--------------------------------------------------

-- =========================================
-- IS NOT NULL
-- =========================================

-- Meaning:
-- Finds records that contain values.

SELECT *
FROM Employee
WHERE email IS NOT NULL;

--------------------------------------------------

-- =========================================
-- LIKE
-- =========================================

-- Meaning:
-- LIKE searches for patterns in text.

-- Starts with J

SELECT *
FROM Employee
WHERE emp_name LIKE 'J%';

--------------------------------------------------

-- Ends with a

SELECT *
FROM Employee
WHERE emp_name LIKE '%a';

--------------------------------------------------

-- Contains 'an'

SELECT *
FROM Employee
WHERE emp_name LIKE '%an%';

--------------------------------------------------

-- =========================================
-- WILDCARDS
-- =========================================

-- Meaning:
-- Wildcards are special characters used with LIKE.

-- %  -> Any number of characters
-- _  -> Exactly one character

--------------------------------------------------

-- Starts with J

SELECT *
FROM Employee
WHERE emp_name LIKE 'J%';

--------------------------------------------------

-- Ends with n

SELECT *
FROM Employee
WHERE emp_name LIKE '%n';

--------------------------------------------------

-- Contains 'oh'

SELECT *
FROM Employee
WHERE emp_name LIKE '%oh%';

--------------------------------------------------

-- Second character is 'o'

SELECT *
FROM Employee
WHERE emp_name LIKE '_o%';

--------------------------------------------------

-- Five-letter names

SELECT *
FROM Employee
WHERE emp_name LIKE '_____';

--------------------------------------------------

/*
=========================================================
SUMMARY
=========================================================

WHERE          -> Filters records

DISTINCT       -> Removes duplicate values

ORDER BY       -> Sorts records

LIMIT          -> Displays limited rows

BETWEEN        -> Range search

IN             -> Matches multiple values

NOT IN         -> Excludes values

IS NULL        -> Finds NULL values

IS NOT NULL    -> Finds non-NULL values

LIKE           -> Pattern matching

Wildcards      -> %, _

=========================================================
*/