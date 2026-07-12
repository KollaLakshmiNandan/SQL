/*
=========================================================
FILE : 09_user_management.sql
=========================================================

Definition:

User Management is the process of creating users,
assigning permissions, modifying permissions,
and removing users from the database.

Every person should only have the permissions
required to perform their job.

For example

DBA
↓
Full Access

Developer
↓
Create Tables
Insert Data
Update Data

Tester
↓
Read Only

User Management improves

✔ Security
✔ Data Protection
✔ Controlled Access

Topics Covered

✔ CREATE USER
✔ SHOW USERS
✔ SHOW GRANTS
✔ GRANT
✔ REVOKE
✔ DROP USER
✔ localhost
✔ %
✔ Authentication
✔ Authorization

=========================================================
*/

-- =========================================
-- SHOW ALL USERS
-- =========================================

-- Meaning:
-- Displays all users available in MySQL.

SELECT user,
host
FROM mysql.user;

--------------------------------------------------

-- =========================================
-- CREATE USER
-- =========================================

-- Meaning:
-- CREATE USER creates a new MySQL account.

-- Syntax

CREATE USER 'test'@'%'
IDENTIFIED BY 'test@123';

--------------------------------------------------

-- Verify

SELECT user,
host
FROM mysql.user;

--------------------------------------------------

-- =========================================
-- SHOW GRANTS
-- =========================================

-- Meaning:
-- Displays permissions assigned to a user.

SHOW GRANTS
FOR 'test'@'%';

--------------------------------------------------

-- =========================================
-- GRANT
-- =========================================

-- Meaning:
-- GRANT gives permissions to users.

-- Give Read Permission

GRANT SELECT
ON company_db.*
TO 'test'@'%';

--------------------------------------------------

SHOW GRANTS
FOR 'test'@'%';

--------------------------------------------------

-- Give Insert Permission

GRANT INSERT
ON company_db.*
TO 'test'@'%';

--------------------------------------------------

SHOW GRANTS
FOR 'test'@'%';

--------------------------------------------------

-- Give Update Permission

GRANT UPDATE
ON company_db.*
TO 'test'@'%';

--------------------------------------------------

SHOW GRANTS
FOR 'test'@'%';

--------------------------------------------------

-- Give Multiple Permissions

GRANT
SELECT,
INSERT,
UPDATE
ON company_db.*
TO 'test'@'%';

--------------------------------------------------

SHOW GRANTS
FOR 'test'@'%';

--------------------------------------------------

-- =========================================
-- Practical Test
-- =========================================

-- Login as ruchi

SELECT *
FROM Employee;

--------------------------------------------------

INSERT INTO Employee
VALUES
(11,'Alex','alex@gmail.com',50000,26,101);

--------------------------------------------------

UPDATE Employee
SET salary=70000
WHERE emp_id=11;

--------------------------------------------------

-- DELETE will FAIL
-- because DELETE permission is not given

DELETE
FROM Employee
WHERE emp_id=11;

--------------------------------------------------

-- =========================================
-- REVOKE
-- =========================================

-- Meaning:
-- REVOKE removes permissions from a user.

REVOKE INSERT
ON company_db.*
FROM 'test'@'%';

--------------------------------------------------

SHOW GRANTS
FOR 'test'@'%';

--------------------------------------------------

-- Try Again

INSERT INTO Employee
VALUES
(12,'David','david@gmail.com',60000,27,102);

--------------------------------------------------

-- Expected Result

ERROR

INSERT command denied.

--------------------------------------------------

-- Remove All Permissions

REVOKE
SELECT,
UPDATE
ON company_db.*
FROM 'test'@'%';

--------------------------------------------------

SHOW GRANTS
FOR 'test'@'%';

--------------------------------------------------

-- =========================================
-- DROP USER
-- =========================================

-- Meaning:
-- DROP USER permanently removes a user.

DROP USER
'test'@'%';

--------------------------------------------------

Verify

SELECT user,
host
FROM mysql.user;

--------------------------------------------------

-- =========================================
-- localhost vs %
-- =========================================

-- localhost

CREATE USER
'test'@'localhost'
IDENTIFIED BY 'test@123';

--------------------------------------------------

Meaning

Only this computer
can connect.

--------------------------------------------------

-- %

CREATE USER
'test'@'%'
IDENTIFIED BY 'test@123';

--------------------------------------------------

Meaning

Any computer
can connect
(if remote access is enabled).

--------------------------------------------------

/*
=========================================================
AUTHENTICATION
=========================================================

Authentication

Means

Verifying

Who are you?

Example

Username

test

Password

test@123

If correct

↓

Login Success

=========================================================
AUTHORIZATION
=========================================================

Authorization

Means

What are you allowed to do?

Example

SELECT

YES

INSERT

YES

UPDATE

YES

DELETE

NO

=========================================================
REAL-TIME SCENARIO
=========================================================

You are DBA

↓

Create Database

↓

Create User

↓

Grant Permission

↓

Developer Connects

↓

Developer performs work

↓

If Developer leaves company

↓

REVOKE Permission

↓

DROP USER

=========================================================
INTERVIEW QUESTIONS
=========================================================

Q1

Difference between Authentication
and Authorization?

Authentication

Who are you?

Authorization

What can you do?

--------------------------------------------------

Q2

Difference between localhost and % ?

localhost

Only same computer.

%

Remote computers.

--------------------------------------------------

Q3

Difference between GRANT
and REVOKE?

GRANT

Gives permissions.

REVOKE

Removes permissions.

--------------------------------------------------

Q4

How do you check permissions?

SHOW GRANTS;

--------------------------------------------------

Q5

How do you remove a user?

DROP USER
'username'@'%';

=========================================================
SUMMARY
=========================================================

CREATE USER

Creates user.

--------------------------------------------------

GRANT

Gives permissions.

--------------------------------------------------

SHOW GRANTS

Displays permissions.

--------------------------------------------------

REVOKE

Removes permissions.

--------------------------------------------------

DROP USER

Deletes user.

--------------------------------------------------

localhost

Only local computer.

--------------------------------------------------

%

Any remote computer.

=========================================================
*/