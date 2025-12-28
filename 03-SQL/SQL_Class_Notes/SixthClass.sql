-- CLASS 6
-- Stored Procedures

-- the main reason for using a stored procedure
-- is to connect data entry with the system logic
-- and prevent direct access to the tables


-- General syntax for creating a stored procedure
-- CREATE PROCEDURE dbo.ProcedureName
--     @Parameter1 datatype,
--     @Parameter2 datatype
-- AS
-- BEGIN
--     SQL statements
-- END;
------------------------------------------------
-- the stored procedure will be saved under:
-- Database Name
--   → Programmability
--       → Stored Procedures

------------------------------------------------
-- Procedure to insert a new student

CREATE PROCEDURE insertStudent
  @FirstName   VARCHAR(30),
  @LastName    VARCHAR(30),
  @Gender      CHAR(1),
  @Birthdate   DATE,
  @SchoolID    INT 
AS
BEGIN 
    INSERT INTO Students (FirstName, LastName, Gender, Birthdate, SchoolID)
    VALUES (@FirstName, @LastName, @Gender, @Birthdate, @SchoolID);
END;

-------------------------------------------------
-- query way
-- execute the procedure using a SQL query

EXEC insertStudent 'naser', 'saleh', 'm', '2005-09-01', 1;

-- check the inserted data
SELECT * FROM Students;

-- OR
-- right-click on the stored procedure
-- choose "Execute Stored Procedure"
-- then fill the parameters manually
-------------------------------------------------
-- Procedure to update a student mark for a specific subject

CREATE PROCEDURE UpdateStudentMark 
    @studentID INT, 
    @SubjectID INT, 
    @NewMark   INT 
AS
BEGIN      
    UPDATE m
    SET m.Mark = @NewMark
    FROM Marks m
    JOIN StudentSubject ss  
        ON ss.StudentSubjectID = m.Student_SubjectID  
    WHERE ss.StudentID = @studentID
      AND ss.SubjectID = @SubjectID;
END;

-------------------------------------------------
-- Check student marks before / after update

SELECT ss.StudentID, ss.SubjectID, m.Mark
FROM Marks m
JOIN StudentSubject ss  
    ON ss.StudentSubjectID = m.Student_SubjectID  
WHERE ss.StudentID = 1 
  AND ss.SubjectID = 2;

-------------------------------------------------
-- Procedure to get all marks for a student

CREATE PROCEDURE GetStudentMarks 
    @studentID INT 
AS
BEGIN 
    SELECT 
        s.FirstName + ' ' + s.LastName AS FullName,
        sub.SubjectNameEn,
        m.Mark
    FROM Students s 
    INNER JOIN StudentSubject ss 
        ON s.StudentID = ss.StudentID
    INNER JOIN Subjects sub 
        ON ss.SubjectID = sub.SubjectID 
    INNER JOIN Marks m 
        ON m.Student_SubjectID = ss.StudentSubjectID
    WHERE s.StudentID = @studentID;
END;

-------------------------------------------------
-- Execute procedure

EXEC GetStudentMarks 1;

-------------------------------------------------
-- PROCEDURE VS FUNCTION

-- Function
-- Scalar Function (returns a single value)

CREATE FUNCTION GetStudentAge (@Birthdate DATE)
RETURNS INT 
AS 
BEGIN 
    RETURN DATEDIFF(YEAR, @Birthdate, GETDATE());
END;

-------------------------------------------------
-- Using scalar function

SELECT FirstName, LastName, dbo.GetStudentAge(Birthdate) AS Age
FROM Students;

-------------------------------------------------
-- Table-Valued Function
-- Returns a table instead of a single value

CREATE FUNCTION GetStudentMarkTable (@studentID INT)
RETURNS TABLE 
AS
RETURN
(
    SELECT 
        s.FirstName + ' ' + s.LastName AS FullName,
        sub.SubjectNameEn,
        m.Mark
    FROM Students s 
    INNER JOIN StudentSubject ss 
        ON s.StudentID = ss.StudentID
    INNER JOIN Subjects sub 
        ON ss.SubjectID = sub.SubjectID 
    INNER JOIN Marks m 
        ON m.Student_SubjectID = ss.StudentSubjectID
    WHERE s.StudentID = @studentID
);

-------------------------------------------------
-- Using table-valued function

SELECT * 
FROM dbo.GetStudentMarkTable(8);
-------------------------------------------------
-- PROCEDURE VS FUNCTION
-- 1. Stored Procedure:
--    - Can INSERT, UPDATE, DELETE, SELECT
--    - Performs actions on the database
--    - Can have multiple statements and output

-- 2. Function:
--    - Cannot INSERT, UPDATE, or DELETE
--    - Only returns a value (scalar or table)
--    - Used to compute or retrieve a result
--    - Can be used in SELECT, WHERE, ORDER BY, etc.
-------------------------------------------------
-- INDEXES

-- Clustered Index
-- defines the physical order of rows in the table
-- only one clustered index is allowed per table

-- Nonclustered Index
-- a separate structure that improves search performance
-- it stores the indexed column values and pointers to the actual rows
---- usually used for columns that are searched very frequently

-- without an index:
-- SQL Server performs a table scan
-- it reads the table row by row to find the required data
-- this affects performance when:
--   - the table is very large
--   - there are complex joins
--   - the query is executed frequently

-- with an index:
-- SQL Server uses an index seek instead of a table scan
-- it goes directly to the indexed column
-- then jumps to the matching rows only
-- this significantly improves query performance


CREATE NONCLUSTERED INDEX IX_STUDENT_LASTNAME
ON dbo.Students (LastName);

-------------------------------------------------
-- Query performance comparison

SELECT * 
FROM Students
WHERE LastName = 'AZAZIEH';  
-- Example runtime without index: ~20 seconds

SELECT * 
FROM Students
WHERE LastName = 'AZAZIEH';  
-- Example runtime with index: ~15 seconds

-------------------------------------------------
-- PERFORMANCE BEST PRACTICES

-- avoid using SELECT *
-- it increases I/O and reduces performance
-- always select only the required columns

SELECT * FROM TableName;   -- bad practice

-- always filter when possible
SELECT *
FROM Students
WHERE StudentID = 2;

-- if no filter is needed, try to limit the result set
-- using TOP (n) to reduce returned rows
SELECT TOP (10) *
FROM Students;


-------------------------------------------------
-- Avoid using functions in WHERE clause

WHERE YEAR(Birthdate) = 2005;   -- Bad (breaks index usage)

WHERE Birthdate >= '2005-01-01'
  AND Birthdate <  '2006-01-01'; -- Good (index friendly)

-------------------------------------------------
-- LIKE performance

 WHERE LastName LIKE '%bed'   -- bad
-- SQL Server must scan the entire table
-- because the search starts with a wildcard
-- it cannot use the index efficiently

 WHERE LastName LIKE 'Abed%' -- good
-- SQL Server searches from the beginning of the word
-- it can use the index (index seek)
-- faster and more efficient


-------------------------------------------------
-- Subquery performance notes

-- Subquery inside JOIN can be very expensive
-- Subquery inside SELECT is lighter
-- JOIN is usually faster than subqueries

-------------------------------------------------
-- How to compare performance

SELECT * 
FROM Students 
WHERE YEAR(Birthdate) = 2005;

SELECT * 
FROM Students 
WHERE Birthdate >= '2005-01-01'
  AND Birthdate <  '2006-01-01';

-------------------------------------------------
-- Enable / disable execution time statistics

SET STATISTICS TIME ON;
-- SET STATISTICS TIME OFF;

-------------------------------------------------
-- SQL Server Jobs
-- Used for scheduled tasks (backups, cleanup, reports)

-------------------------------------------------
--Self Study
-- Triggers / Login / User
--  DBA (Database Administrator)
