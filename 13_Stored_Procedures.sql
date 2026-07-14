/*
=========================================================
FILE : 11_stored_procedures.sql
=========================================================

Definition:
A Stored Procedure is a precompiled collection of one or
more SQL statements stored inside the database.

It can be executed multiple times using the CALL statement.

Real-Time Scenario:

ABC Technologies has an HR application.

Instead of writing the same SQL queries repeatedly,
the Database Administrator creates Stored Procedures
for common operations.

Topics Covered

✔ Procedure without Parameters
✔ Procedure with IN Parameters
✔ INSERT using Procedure
✔ UPDATE using Procedure
✔ DELETE using Procedure

=========================================================
*/

-- =====================================================
-- PROCEDURE 1
-- Display All Employees
-- =====================================================

DELIMITER $$

CREATE PROCEDURE GetAllEmployees()

BEGIN

SELECT *
FROM Employee;

END $$

DELIMITER ;

---------------------------------------------------------

CALL GetAllEmployees();

---------------------------------------------------------


-- =====================================================
-- PROCEDURE 2
-- Display Employees by Department
-- =====================================================

DELIMITER $$

CREATE PROCEDURE GetEmployeesByDepartment
(
IN p_dept_id INT
)

BEGIN

SELECT *
FROM Employee
WHERE dept_id = p_dept_id;

END $$

DELIMITER ;

---------------------------------------------------------

CALL GetEmployeesByDepartment(101);

CALL GetEmployeesByDepartment(103);

---------------------------------------------------------


-- =====================================================
-- PROCEDURE 3
-- Display Employees Above Given Salary
-- =====================================================

DELIMITER $$

CREATE PROCEDURE GetEmployeesBySalary
(
IN p_salary DECIMAL(10,2)
)

BEGIN

SELECT *
FROM Employee
WHERE salary > p_salary;

END $$

DELIMITER ;

---------------------------------------------------------

CALL GetEmployeesBySalary(50000);

---------------------------------------------------------


-- =====================================================
-- PROCEDURE 4
-- Insert New Employee
-- =====================================================

DELIMITER $$

CREATE PROCEDURE InsertEmployee
(
IN p_emp_id INT,
IN p_emp_name VARCHAR(50),
IN p_email VARCHAR(100),
IN p_salary DECIMAL(10,2),
IN p_age INT,
IN p_dept_id INT
)

BEGIN

INSERT INTO Employee
VALUES
(
p_emp_id,
p_emp_name,
p_email,
p_salary,
p_age,
p_dept_id
);

END $$

DELIMITER ;

---------------------------------------------------------

CALL InsertEmployee
(
11,
'Rahul',
'rahul@gmail.com',
55000,
26,
101
);

---------------------------------------------------------

SELECT *
FROM Employee;

---------------------------------------------------------


-- =====================================================
-- PROCEDURE 5
-- Update Employee Salary
-- =====================================================

DELIMITER $$

CREATE PROCEDURE UpdateSalary
(
IN p_emp_id INT,
IN p_salary DECIMAL(10,2)
)

BEGIN

UPDATE Employee
SET salary = p_salary
WHERE emp_id = p_emp_id;

END $$

DELIMITER ;

---------------------------------------------------------

CALL UpdateSalary(11,65000);

SELECT *
FROM Employee
WHERE emp_id=11;

---------------------------------------------------------


-- =====================================================
-- PROCEDURE 6
-- Delete Employee
-- =====================================================

DELIMITER $$

CREATE PROCEDURE DeleteEmployee
(
IN p_emp_id INT
)

BEGIN

DELETE
FROM Employee
WHERE emp_id=p_emp_id;

END $$

DELIMITER ;

---------------------------------------------------------

CALL DeleteEmployee(11);

SELECT *
FROM Employee;

---------------------------------------------------------


-- =====================================================
-- PROCEDURE 7
-- Count Total Employees
-- =====================================================

DELIMITER $$

CREATE PROCEDURE TotalEmployees()

BEGIN

SELECT COUNT(*) AS Total_Employees
FROM Employee;

END $$

DELIMITER ;

---------------------------------------------------------

CALL TotalEmployees();

---------------------------------------------------------


-- =====================================================
-- PROCEDURE 8
-- Display Employees Between Salary Range
-- =====================================================

DELIMITER $$

CREATE PROCEDURE SalaryRange
(
IN min_salary DECIMAL(10,2),
IN max_salary DECIMAL(10,2)
)

BEGIN

SELECT *
FROM Employee
WHERE salary BETWEEN min_salary
AND max_salary;

END $$

DELIMITER ;

---------------------------------------------------------

CALL SalaryRange(40000,60000);

---------------------------------------------------------


-- =====================================================
-- PROCEDURE 9
-- Display Employees by Age
-- =====================================================

DELIMITER $$

CREATE PROCEDURE EmployeeAge
(
IN p_age INT
)

BEGIN

SELECT *
FROM Employee
WHERE age >= p_age;

END $$

DELIMITER ;

---------------------------------------------------------

CALL EmployeeAge(30);

---------------------------------------------------------


-- =====================================================
-- PROCEDURE 10
-- Drop Procedure
-- =====================================================

DROP PROCEDURE IF EXISTS EmployeeAge;

---------------------------------------------------------

SHOW PROCEDURE STATUS
WHERE Db='office_db';

---------------------------------------------------------

/*
=========================================================
REAL-TIME USES

✔ HR Employee Reports

✔ Payroll System

✔ Banking Transactions

✔ Hospital Management

✔ Student Management

✔ E-Commerce Applications

=========================================================

INTERVIEW QUESTIONS

Q1. What is a Stored Procedure?

Answer:
A Stored Procedure is a precompiled collection of SQL
statements stored in the database that can be executed
multiple times.

---------------------------------------------------------

Q2. Why do we use Stored Procedures?

Answer:

✔ Reusability

✔ Better Performance

✔ Security

✔ Easy Maintenance

✔ Reduced Network Traffic

---------------------------------------------------------

Q3. How do you execute a Stored Procedure?

CALL Procedure_Name();

---------------------------------------------------------

Q4. How do you delete a Stored Procedure?

DROP PROCEDURE Procedure_Name;

=========================================================

END OF FILE
=========================================================
*/