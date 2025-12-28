-- HOW TO CREATE A DATABASE USING A SCRIPT
-- CREATE DATABASE is a DDL command used to create a new database container
CREATE DATABASE SchoolP16;

---

-- HOW TO CREATE TABLES
-- DDL: Data Definition Language
-- Used to define or modify database structures (not the data inside them)
-- Main DDL commands: CREATE / ALTER / DROP

-- Creating the School table
CREATE TABLE School (
SchoolID INT PRIMARY KEY,              -- Primary Key uniquely identifies each school
School_Name VARCHAR(30),                -- Stores the school name
School_Address VARCHAR(50)              -- Stores the school address
);

-- Creating the Students table
CREATE TABLE Students (
StudentID INT PRIMARY KEY,              -- Primary Key for students
SchoolID INT,                           -- Foreign Key column
Gender CHAR(1),                          -- M or F (CHAR is preferred for fixed-length values)
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
CONSTRAINT FK_Students_School FOREIGN KEY (SchoolID)
REFERENCES School(SchoolID)          -- Enforces relationship with School table
);

---

-- HOW TO EDIT TABLE STRUCTURE (NOT DATA)
-- USE ALTER TABLE

-- Add a new column
ALTER TABLE Teacher
ADD Gender CHAR(1);                          -- Adds a Gender column to the Teacher table

-- Delete a column
ALTER TABLE Teacher
DROP COLUMN Gender;                          -- Removes the Gender column

---
--**ALTER TABLE can:
-- ADD column
-- ALTER COLUMN
-- DROP COLUMN
-- ADD constraint
-- DROP constraint
-- ENABLE / DISABLE constraint
-- ADD DEFAULT


---

-- HOW TO DELETE A TABLE
-- USE DROP TABLE
-- DROP TABLE TableName;

-- IMPORTANT:
-- If a table has relationships (foreign keys),
-- you must drop the child table (dependent table) first.
-- Creation order: Parent -> Child
-- Deletion order: Child -> Parent

---

-- HOW TO MANIPULATE DATA INSIDE TABLES (ROWS)
-- DML: Data Manipulation Language
-- Used to work with data inside tables
-- Commands: INSERT / UPDATE / DELETE (Row-level operations)

-- INSERT DATA
-- First way: Explicit column list (recommended and safe)
INSERT INTO School (SchoolID, School_Name, School_Address)
VALUES (1, 'King School', 'Amman');

-- Notes:
-- Text values must be inside single quotes
-- If SchoolID were IDENTITY (auto-increment), we would NOT insert it manually

---

-- Second way: BULK INSERT (used for large datasets from files)
-- BULK INSERT TableName
-- FROM 'full_file_path'
-- WITH (...);

---

-- UPDATE DATA
UPDATE School
SET School_Address = 'Irbid',               -- Multiple columns are separated by commas
School_Name = 'WOW'
WHERE SchoolID = 1;                          -- WHERE is critical to avoid updating all rows

---

-- DELETE DATA
DELETE FROM School
WHERE SchoolID = 1;                          -- WHERE limits deletion to specific rows

-- WARNING:
-- DELETE without WHERE will remove ALL rows from the table
/* =========================================================
   SQL QUICK NOTES – IDENTITY & CONSTRAINTS
   ========================================================= */

/* -------------------------------
   IDENTITY (Auto-Increment)
   -------------------------------
   - Used to automatically generate values
   - Commonly used for Primary Keys
   - IDENTITY(seed, increment)
*/

CREATE TABLE Teacher (
    TeacherID INT IDENTITY(1,1) PRIMARY KEY,  -- starts at 1, increases by 1
    TeacherName VARCHAR(50) NOT NULL           -- cannot be NULL
);

/* NOTE:
   - Do NOT insert values into an IDENTITY column
*/
INSERT INTO Teacher (TeacherName)
VALUES ('Ahmad');

/* -------------------------------
   NOT NULL Constraint
   -------------------------------
   - Forces the column to always have a value
*/

CREATE TABLE Students (
    StudentID INT IDENTITY(1,1) PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,   -- required
    Last_Name VARCHAR(50) NOT NULL
);

/* Using ALTER to add NOT NULL */
ALTER TABLE Students
ALTER COLUMN First_Name VARCHAR(50) NOT NULL;

/* -------------------------------
   UNIQUE Constraint
   -------------------------------
   - Prevents duplicate values
*/

CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Email VARCHAR(100) UNIQUE           -- must be unique
);

/* Add UNIQUE using ALTER */
ALTER TABLE Users
ADD CONSTRAINT UQ_Email UNIQUE (Email);

/* -------------------------------
   CHECK Constraint
   -------------------------------
   - Limits allowed values in a column
*/

CREATE TABLE Employees (
    EmpID INT IDENTITY(1,1) PRIMARY KEY,
    EmpName VARCHAR(50) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M','F')),
    Salary INT CHECK (Salary > 0)
);

/* Add CHECK using ALTER */
ALTER TABLE Employees
ADD CONSTRAINT CK_Age CHECK (Age >= 18);

/* -------------------------------
   MEMORY SUMMARY 
   -------------------------------
   IDENTITY  -> auto-increment
   NOT NULL  -> value is required
   UNIQUE    -> no duplicates
   CHECK     -> allowed values only
   PRIMARY KEY -> unique + not null
*/



--conclusion 
--CREATE    → build structure
--ALTER     → change structure
--DROP      → destroy structure
--TRUNCATE  → empty table
--DML       → works on rows
