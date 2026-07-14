/*
=========================================================
FILE : 10_subqueries.sql
=========================================================

Definition:
A Subquery is a query written inside another SQL query.
The inner query executes first and its result is used
by the outer query.

Real-Time Scenario:

ABC Technologies has an Employee and Department database.
The HR Manager requires various reports without manually
calculating values.

Topics Covered

✔ Single Row Subquery
✔ Multiple Row Subquery
✔ Aggregate Subquery
✔ IN
✔ NOT IN

=========================================================
*/

-- ==========================================
-- TASK 1
-- Display employees earning more than
-- the company average salary.
-- ==========================================

SELECT *
FROM Employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM Employee
);

--------------------------------------------------------

-- ==========================================
-- TASK 2
-- Display employee(s) having
-- the highest salary.
-- ==========================================

SELECT *
FROM Employee
WHERE salary =
(
    SELECT MAX(salary)
    FROM Employee
);

--------------------------------------------------------

-- ==========================================
-- TASK 3
-- Display employee(s) having
-- the lowest salary.
-- ==========================================

SELECT *
FROM Employee
WHERE salary =
(
    SELECT MIN(salary)
    FROM Employee
);

--------------------------------------------------------

-- ==========================================
-- TASK 4
-- Display employees working
-- in the IT department.
-- ==========================================

SELECT *
FROM Employee
WHERE dept_id =
(
    SELECT dept_id
    FROM Department
    WHERE dept_name='IT'
);

--------------------------------------------------------

-- ==========================================
-- TASK 5
-- Display employees working
-- in the HR department.
-- ==========================================

SELECT *
FROM Employee
WHERE dept_id =
(
    SELECT dept_id
    FROM Department
    WHERE dept_name='HR'
);

--------------------------------------------------------

-- ==========================================
-- TASK 6
-- Display employees earning
-- more than John's salary.
-- ==========================================

SELECT *
FROM Employee
WHERE salary >
(
    SELECT salary
    FROM Employee
    WHERE emp_name='John'
);

--------------------------------------------------------

-- ==========================================
-- TASK 7
-- Display employees younger than
-- the average age.
-- ==========================================

SELECT *
FROM Employee
WHERE age <
(
    SELECT AVG(age)
    FROM Employee
);

--------------------------------------------------------

-- ==========================================
-- TASK 8
-- Display employees older than
-- the average age.
-- ==========================================

SELECT *
FROM Employee
WHERE age >
(
    SELECT AVG(age)
    FROM Employee
);

--------------------------------------------------------

-- ==========================================
-- TASK 9
-- Display departments that have employees.
-- ==========================================

SELECT *
FROM Department
WHERE dept_id IN
(
    SELECT dept_id
    FROM Employee
);

--------------------------------------------------------

-- ==========================================
-- TASK 10
-- Display departments that do not
-- have employees.
-- ==========================================

SELECT *
FROM Department
WHERE dept_id NOT IN
(
    SELECT dept_id
    FROM Employee
);

--------------------------------------------------------

-- ==========================================
-- TASK 11
-- Display second highest salary.
-- ==========================================

SELECT MAX(salary)
AS Second_Highest_Salary
FROM Employee
WHERE salary <
(
    SELECT MAX(salary)
    FROM Employee
);

--------------------------------------------------------

-- ==========================================
-- TASK 12
-- Display employees earning more than
-- the Finance department average salary.
-- ==========================================

SELECT *
FROM Employee
WHERE salary >
(
    SELECT AVG(salary)
    FROM Employee
    WHERE dept_id =
    (
        SELECT dept_id
        FROM Department
        WHERE dept_name='Finance'
    )
);

--------------------------------------------------------

-- ==========================================
-- TASK 13
-- Display departments having
-- more than 2 employees.
-- ==========================================

SELECT *
FROM Department
WHERE dept_id IN
(
    SELECT dept_id
    FROM Employee
    GROUP BY dept_id
    HAVING COUNT(*) > 2
);

--------------------------------------------------------

-- ==========================================
-- TASK 14
-- Display employee(s) whose salary is
-- equal to the average salary.
-- ==========================================

SELECT *
FROM Employee
WHERE salary =
(
    SELECT AVG(salary)
    FROM Employee
);

--------------------------------------------------------

-- ==========================================
-- TASK 15
-- Display employees working in the
-- department having Department ID 103
-- using a subquery.
-- ==========================================

SELECT *
FROM Employee
WHERE dept_id =
(
    SELECT dept_id
    FROM Department
    WHERE dept_id=103
);

--------------------------------------------------------

/*
=========================================================
END OF FILE
=========================================================
*/