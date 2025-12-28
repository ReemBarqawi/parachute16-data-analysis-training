-- class 4
-- Nested Query (Subquery)

-- Give me the students with marks above the average
-- If the subquery returns a SINGLE value → use it in WHERE or HAVING
-- If the subquery returns a COLUMN → use it in SELECT

SELECT st.FirstName, COUNT(Ss.SubjectID), AVG(Mark) AS avg_mark  
FROM Students St 
LEFT JOIN StudentSubject Ss 
    ON St.StudentID = Ss.StudentID
LEFT JOIN Marks Ma 
    ON Ss.StudentSubjectID = Ma.Student_SubjectID
GROUP BY st.FirstName
HAVING AVG(Ma.Mark) >
       (
           SELECT AVG(Mark)
           FROM Marks
       );

----------------------------------------------------
-- Teachers with salary above the average salary

SELECT *
FROM Teachers
WHERE Salary > (SELECT AVG(Salary) FROM Teachers);

-------------------------------------------------------------------
-- Get each student and the count of subjects
-- This can be done using JOIN or a nested query
-- Sometimes nested queries are simpler and clearer than joins

SELECT s.StudentID, 
       S.FirstName + S.LastName AS FullName,  
       (SELECT COUNT(*) 
        FROM StudentSubject ss 
        WHERE ss.StudentID = S.StudentID) AS subject_count
FROM Students S;

----------------------------------------------------
-- Who is the best student in the Art subject

SELECT TOP 1  
       -- If more than one student has the same MAX mark,
       -- TOP 1 will return only one row (not fully correct)
       s.FirstName + ' ' + s.LastName AS FullName,
       m.Mark
FROM Marks m
JOIN StudentSubject st 
     ON st.StudentSubjectID = m.Student_SubjectID
JOIN Students s 
     ON s.StudentID = st.StudentID
JOIN Subjects sub 
     ON sub.SubjectID = st.SubjectID
WHERE sub.SubjectNameEn = 'Art'
ORDER BY m.Mark DESC;

----------------------------------------------------
-- Correct way using TOP 1 WITH TIES
-- WITH TIES returns all students who share the same MAX mark

SELECT TOP 1 WITH TIES  
       s.FirstName + ' ' + s.LastName AS FullName,
       m.Mark
FROM Marks m
JOIN StudentSubject st 
     ON st.StudentSubjectID = m.Student_SubjectID
JOIN Students s 
     ON s.StudentID = st.StudentID
JOIN Subjects sub 
     ON sub.SubjectID = st.SubjectID
WHERE sub.SubjectNameEn = 'Art'
ORDER BY m.Mark DESC;

----------------------------------------------------
-- The TRUE and most accurate way using a subquery

SELECT 
    s.FirstName + ' ' + s.LastName AS FullName,
    m.Mark
FROM Marks m
JOIN StudentSubject st 
    ON st.StudentSubjectID = m.Student_SubjectID
JOIN Students s 
    ON s.StudentID = st.StudentID
JOIN Subjects sub 
    ON sub.SubjectID = st.SubjectID
WHERE sub.SubjectNameEn = 'Art'
AND m.Mark = (
    SELECT MAX(mm.Mark)
    FROM Marks mm
    JOIN StudentSubject stt 
        ON stt.StudentSubjectID = mm.Student_SubjectID
    JOIN Subjects subb 
        ON subb.SubjectID = stt.SubjectID
    WHERE subb.SubjectNameEn = 'Art'
);

----------------------------------------------------------------
-- Maximum average mark among all students
-- Method 1: Subquery

SELECT MAX(t1.AVERAGE_STU)
FROM (
    SELECT FirstName, AVG(Mark) AS AVERAGE_STU
    FROM Students s
    INNER JOIN StudentSubject st 
        ON s.StudentID = st.StudentID
    INNER JOIN Marks m 
        ON m.Student_SubjectID = st.StudentSubjectID
    GROUP BY FirstName
) t1;

----------------------------------------------------
-- Method 2: CTE (Common Table Expression)
-- When to use CTE?
-- 1) When the query is long
-- 2) When the result is reused
-- 3) When dividing work into logical steps
-- Performance is usually similar to subqueries

WITH table_avg_student AS
(
    SELECT FirstName, AVG(Mark) AS AVERAGE_STU
    FROM Students s
    INNER JOIN StudentSubject st 
        ON s.StudentID = st.StudentID
    INNER JOIN Marks m 
        ON m.Student_SubjectID = st.StudentSubjectID
    GROUP BY FirstName
) -- Saved temporarily in tempdb

SELECT MAX(AVERAGE_STU) 
FROM table_avg_student;

----------------------------------------------------
-- VIEW
-- Similar to CTE but NOT temporary
-- Stored permanently in the database
-- Automatically updates when base tables change
-- Useful for security, roles, and reuse

CREATE VIEW student_avg AS
(
    SELECT FirstName, AVG(Mark) AS AVERAGE_STU
    FROM Students s
    INNER JOIN StudentSubject st 
        ON s.StudentID = st.StudentID
    INNER JOIN Marks m 
        ON m.Student_SubjectID = st.StudentSubjectID
    GROUP BY FirstName
); -- Stored under Views in the database

----------------------------------------------------
-- Create a table from another table (copy data)

SELECT * 
INTO student2
FROM Students;

----------------------------------------------------
-- UNION
-- UNION removes duplicates
-- UNION ALL keeps duplicates

SELECT * FROM student2
UNION
SELECT * FROM Students;

----------------------------------------------------
-- EXISTS
-- Returns TRUE if the subquery returns at least one row

SELECT FirstName 
FROM Students s
WHERE EXISTS
(
    SELECT 1 
    FROM student2 s2 
    WHERE s.FirstName = s2.FirstName
);

----------------------------------------------------
-- TRUNCATE (DML)
-- Faster than DELETE
-- Resets IDENTITY (auto-increment)
-- Cannot be used with WHERE

----------------------------------------------------
-- CAST
-- Converts data types during retrieval only

SELECT 'My name is ' + FirstName + 
       ' and my birth year is ' + CAST(YEAR(Birthdate) AS VARCHAR(4))
FROM Students;

----------------------------------------------------
-- IS NULL
-- Used to check NULL values
-- Very useful with COUNT and filtering

SELECT * 
FROM Students 
WHERE SchoolID IS NULL;

-- IS NOT NULL does the opposite

----------------------------------------------------
-- COALESCE
-- Returns the first NOT NULL value
-- Can mix columns and text

SELECT COALESCE(FirstName, LastName, 'NO NAME')
FROM Students;
   