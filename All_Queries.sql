-- ===========================================
-- SQL TRAINING - COMPLETE QUERIES
-- ===========================================

-- ===========================================
-- 1. CREATE DATABASE
-- ===========================================

CREATE DATABASE company_db;

SHOW DATABASES;

USE company_db;

SELECT DATABASE();


-- ===========================================
-- 2. CREATE DEPARTMENT TABLE
-- ===========================================

CREATE TABLE Department
(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

DESC Department;


-- ===========================================
-- 3. INSERT DEPARTMENT RECORDS
-- ===========================================

INSERT INTO Department
VALUES
(101,'HR'),
(102,'Finance'),
(103,'IT'),
(104,'Sales'),
(105,'Marketing'),
(106,'Support'),
(107,'Testing'),
(108,'Admin'),
(109,'Operations'),
(110,'Security');

SELECT * FROM Department;


-- ===========================================
-- 4. CREATE EMPLOYEE TABLE
-- ===========================================

CREATE TABLE Employee
(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) DEFAULT 30000,
    age INT CHECK(age>=18),
    dept_id INT,
    FOREIGN KEY(dept_id)
    REFERENCES Department(dept_id)
);

DESC Employee;


-- ===========================================
-- 5. INSERT EMPLOYEE RECORDS
-- ===========================================

INSERT INTO Employee
VALUES
(1,'John','john@gmail.com',45000,25,101),
(2,'David','david@gmail.com',50000,28,102),
(3,'Emma','emma@gmail.com',60000,30,103),
(4,'Sophia','sophia@gmail.com',55000,26,104),
(5,'James','james@gmail.com',70000,32,105),
(6,'Michael','michael@gmail.com',48000,27,103),
(7,'Olivia','olivia@gmail.com',52000,24,104),
(8,'Daniel','daniel@gmail.com',65000,31,102),
(9,'Charlotte','charlotte@gmail.com',58000,29,101),
(10,'Henry','henry@gmail.com',75000,35,105);

SELECT * FROM Employee;


-- ===========================================
-- 6. PRIMARY KEY EXAMPLE
-- ===========================================

INSERT INTO Employee
VALUES
(1,'Alex','alex@gmail.com',50000,25,101);


-- ===========================================
-- 7. UNIQUE EXAMPLE
-- ===========================================

INSERT INTO Employee
VALUES
(11,'Alex','john@gmail.com',50000,25,101);


-- ===========================================
-- 8. NOT NULL EXAMPLE
-- ===========================================

INSERT INTO Employee
(emp_id,email,salary,age,dept_id)
VALUES
(11,'alex@gmail.com',50000,25,101);


-- ===========================================
-- 9. DEFAULT EXAMPLE
-- ===========================================

INSERT INTO Employee
(emp_id,emp_name,email,age,dept_id)
VALUES
(11,'Alex','alex@gmail.com',25,101);

SELECT * FROM Employee
WHERE emp_id=11;


-- ===========================================
-- 10. CHECK EXAMPLE
-- ===========================================

INSERT INTO Employee
VALUES
(12,'Tom','tom@gmail.com',45000,15,101);


-- ===========================================
-- 11. FOREIGN KEY EXAMPLE
-- ===========================================

INSERT INTO Employee
VALUES
(13,'Sam','sam@gmail.com',45000,25,999);


-- ===========================================
-- 12. SELECT
-- ===========================================

SELECT * FROM Employee;

SELECT emp_name
FROM Employee;

SELECT emp_name,salary
FROM Employee;

SELECT emp_name,age
FROM Employee;

SELECT emp_id,emp_name,dept_id
FROM Employee;


-- ===========================================
-- 13. WHERE
-- ===========================================

SELECT *
FROM Employee
WHERE salary>50000;

SELECT *
FROM Employee
WHERE age>30;

SELECT *
FROM Employee
WHERE dept_id=103;

SELECT *
FROM Employee
WHERE emp_name='John';


-- ===========================================
-- 14. DISTINCT
-- ===========================================

SELECT DISTINCT dept_id
FROM Employee;


-- ===========================================
-- 15. ORDER BY
-- ===========================================

SELECT *
FROM Employee
ORDER BY salary;

SELECT *
FROM Employee
ORDER BY salary DESC;

SELECT *
FROM Employee
ORDER BY emp_name;


-- ===========================================
-- 16. LIMIT
-- ===========================================

SELECT *
FROM Employee
LIMIT 5;

SELECT *
FROM Employee
LIMIT 3;


-- ===========================================
-- 17. BETWEEN
-- ===========================================

SELECT *
FROM Employee
WHERE salary BETWEEN 50000 AND 65000;

SELECT *
FROM Employee
WHERE age BETWEEN 25 AND 30;


-- ===========================================
-- 18. IN
-- ===========================================

SELECT *
FROM Employee
WHERE dept_id IN (101,103,105);


-- ===========================================
-- 19. NOT IN
-- ===========================================

SELECT *
FROM Employee
WHERE dept_id NOT IN (101,105);


-- ===========================================
-- 20. IS NULL
-- ===========================================

SELECT *
FROM Employee
WHERE email IS NULL;


-- ===========================================
-- 21. IS NOT NULL
-- ===========================================

SELECT *
FROM Employee
WHERE email IS NOT NULL;


-- ===========================================
-- 22. LIKE
-- ===========================================

SELECT *
FROM Employee
WHERE emp_name LIKE 'J%';

SELECT *
FROM Employee
WHERE emp_name LIKE '%a';

SELECT *
FROM Employee
WHERE emp_name LIKE '%an%';

SELECT *
FROM Employee
WHERE emp_name LIKE '_o%';


-- ===========================================
-- 23. AGGREGATE FUNCTIONS
-- ===========================================

SELECT COUNT(*)
FROM Employee;

SELECT MAX(salary)
FROM Employee;

SELECT MIN(salary)
FROM Employee;

SELECT SUM(salary)
FROM Employee;

SELECT AVG(salary)
FROM Employee;


-- ===========================================
-- 24. GROUP BY
-- ===========================================

SELECT dept_id,
COUNT(*)
FROM Employee
GROUP BY dept_id;


-- ===========================================
-- 25. HAVING
-- ===========================================

SELECT dept_id,
COUNT(*)
FROM Employee
GROUP BY dept_id
HAVING COUNT(*)>1;


-- ===========================================
-- 26. ALIAS
-- ===========================================

SELECT emp_name AS Employee_Name,
salary AS Employee_Salary
FROM Employee;

SELECT e.emp_name,
e.salary
FROM Employee e;


-- ===========================================
-- 27. INNER JOIN
-- ===========================================

SELECT e.emp_name,
d.dept_name,
e.salary
FROM Employee e
INNER JOIN Department d
ON e.dept_id=d.dept_id;


-- ===========================================
-- 28. LEFT JOIN
-- ===========================================

SELECT e.emp_name,
d.dept_name
FROM Employee e
LEFT JOIN Department d
ON e.dept_id=d.dept_id;


-- ===========================================
-- 29. RIGHT JOIN
-- ===========================================

SELECT e.emp_name,
d.dept_name
FROM Employee e
RIGHT JOIN Department d
ON e.dept_id=d.dept_id;


-- ===========================================
-- 30. UPDATE
-- ===========================================

UPDATE Employee
SET salary=80000
WHERE emp_id=1;

SELECT *
FROM Employee
WHERE emp_id=1;


-- ===========================================
-- 31. DELETE
-- ===========================================

DELETE FROM Employee
WHERE emp_id=10;

SELECT * FROM Employee;


-- ===========================================
-- 32. TRANSACTIONS
-- ===========================================

START TRANSACTION;

UPDATE Employee
SET salary=90000
WHERE emp_id=2;

SELECT *
FROM Employee
WHERE emp_id=2;

ROLLBACK;

SELECT *
FROM Employee
WHERE emp_id=2;

START TRANSACTION;

UPDATE Employee
SET salary=90000
WHERE emp_id=2;

COMMIT;


-- ===========================================
-- 33. ALTER
-- ===========================================

ALTER TABLE Employee
ADD phone VARCHAR(15);

DESC Employee;


-- ===========================================
-- 34. TRUNCATE
-- ===========================================

TRUNCATE TABLE Employee;


-- ===========================================
-- 35. DROP
-- ===========================================

DROP TABLE Employee;

DROP TABLE Department;

DROP DATABASE company_db;