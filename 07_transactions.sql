/*
=========================================================
FILE : 07_transactions.sql
=========================================================

Definition:
A Transaction is a group of one or more SQL statements
that are executed as a single unit of work.

A transaction ensures that either ALL operations are
completed successfully or NONE of them are performed.

Real-Time Example:

Suppose you transfer ₹10,000 from Account A to Account B.

Step 1 : Deduct ₹10,000 from Account A.
Step 2 : Add ₹10,000 to Account B.

If Step 2 fails after Step 1 succeeds,
the money will be lost.

Transactions prevent this problem.

Topics Covered

✔ Transactions
✔ START TRANSACTION
✔ COMMIT
✔ ROLLBACK

=========================================================
*/

-- =========================================
-- What is a Transaction?
-- =========================================

-- A transaction is a logical unit of work.

-- Example

START TRANSACTION;

UPDATE Employee
SET salary=90000
WHERE emp_id=2;

SELECT *
FROM Employee
WHERE emp_id=2;

--------------------------------------------------

-- At this point

-- Salary is updated only inside the transaction.

-- It is NOT permanently saved until COMMIT.

--------------------------------------------------

-- =========================================
-- COMMIT
-- =========================================

-- Meaning:
-- COMMIT permanently saves all changes.

COMMIT;

--------------------------------------------------

-- Verify

SELECT *
FROM Employee
WHERE emp_id=2;

--------------------------------------------------

-- =========================================
-- ROLLBACK
-- =========================================

-- Meaning:
-- ROLLBACK cancels all changes made after
-- START TRANSACTION.

START TRANSACTION;

UPDATE Employee
SET salary=100000
WHERE emp_id=2;

SELECT *
FROM Employee
WHERE emp_id=2;

--------------------------------------------------

ROLLBACK;

--------------------------------------------------

SELECT *
FROM Employee
WHERE emp_id=2;

--------------------------------------------------

-- Salary returns to previous value.

--------------------------------------------------

-- =========================================
-- Practical Example 1
-- =========================================

START TRANSACTION;

UPDATE Employee
SET salary=75000
WHERE emp_id=1;

UPDATE Employee
SET salary=85000
WHERE emp_id=2;

SELECT *
FROM Employee
WHERE emp_id IN (1,2);

--------------------------------------------------

COMMIT;

--------------------------------------------------

SELECT *
FROM Employee
WHERE emp_id IN (1,2);

--------------------------------------------------

-- =========================================
-- Practical Example 2
-- =========================================

START TRANSACTION;

UPDATE Employee
SET salary=60000
WHERE emp_id=3;

UPDATE Employee
SET salary=70000
WHERE emp_id=4;

ROLLBACK;

--------------------------------------------------

SELECT *
FROM Employee
WHERE emp_id IN (3,4);

--------------------------------------------------

-- Original values are restored.

--------------------------------------------------

/*
=========================================================
REAL-TIME EXAMPLE
=========================================================

ATM Withdrawal

Customer Balance

₹50,000

↓

Withdraw ₹10,000

↓

Balance should become

₹40,000

If the server crashes after deducting money
but before completing the transaction,

ROLLBACK restores the balance.

--------------------------------------------------

Online Shopping

Step 1

Reduce Product Quantity

↓

Step 2

Generate Invoice

↓

Step 3

Receive Payment

↓

If payment fails,

ROLLBACK restores product quantity.

=========================================================
ACID PROPERTIES
=========================================================

A → Atomicity

Either all operations happen
or none happen.

--------------------------------------------------

C → Consistency

Database remains valid before
and after the transaction.

--------------------------------------------------

I → Isolation

Multiple users can perform transactions
without interfering with each other.

--------------------------------------------------

D → Durability

After COMMIT,
data is permanently saved.

=========================================================
INTERVIEW QUESTIONS
=========================================================

Q1. What is a Transaction?

Answer

A Transaction is a group of SQL statements
executed as one logical unit.

--------------------------------------------------

Q2. Difference between COMMIT and ROLLBACK?

COMMIT

Permanently saves data.

ROLLBACK

Undoes changes.

--------------------------------------------------

Q3. Can we ROLLBACK after COMMIT?

Answer

No.

Once COMMIT is executed,
changes become permanent.

--------------------------------------------------

Q4. Which SQL category contains
COMMIT and ROLLBACK?

Answer

TCL
(Transaction Control Language)

=========================================================
SUMMARY
=========================================================

START TRANSACTION
→ Starts a transaction.

COMMIT
→ Saves changes permanently.

ROLLBACK
→ Cancels changes.

Transactions
→ Ensure data consistency.

=========================================================