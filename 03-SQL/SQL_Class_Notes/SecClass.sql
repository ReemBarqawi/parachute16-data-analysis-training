/* =========================================================
   SQL QUICK NOTES – DQL / Data Query Language
   ========================================================= */

/* -------------------------------
   DQL Overview
   -------------------------------
   - DQL: Data Query Language
   - Used to retrieve data from tables
   - Main commands: SELECT / FROM / WHERE
*/

/* Retrieve all columns */
SELECT * FROM School1;   -- * retrieves all columns

/* Retrieve specific columns */
SELECT SchoolName, SchoolAddress 
FROM School1;   -- Retrieve only these columns
-- Tip: First use * to see column names, then select specific columns

/* -------------------------------
   WHERE Clause – Filtering data
   ------------------------------- */

/* Single condition with one value */
SELECT SchoolName
FROM School1
WHERE SchoolID = 1;

/* Single condition with multiple values */
SELECT SchoolName
FROM School1
WHERE SchoolID IN (1, 2);

/* Multiple conditions */
SELECT *
FROM School1
WHERE SchoolID IN (1, 2, 3) AND SchoolAddress = 'Irbid';

/* -------------------------------
   Column Alias (AS) – Rename output columns
   ------------------------------- */

/* Using AS */
SELECT PhoneNo AS phone_number_In_Irbid
FROM School1
WHERE SchoolID = 3;

/* Using brackets for spaces or keywords */
SELECT PhoneNo AS [phone number from Irbid]
FROM School1
WHERE SchoolID = 3;

/* -------------------------------
   More examples – WHERE
   ------------------------------- */

/* StudentID greater than 10 */
SELECT * FROM Students
WHERE StudentID > 10;

/* StudentID between 5 and 10 */
SELECT * FROM Students
WHERE StudentID BETWEEN 5 AND 10;

/* StudentID NOT between 5 and 10 */
SELECT * FROM Students
WHERE StudentID NOT BETWEEN 5 AND 10;

/* LIKE – search inside strings */
SELECT * FROM Students
WHERE FirstName LIKE 'a%';        -- starts with 'a'

SELECT * FROM Students
WHERE FirstName LIKE 'a%m';       -- starts with 'a' and ends with 'm'

SELECT * FROM Students
WHERE FirstName LIKE '%a%m%';     -- contains 'a' then 'm' anywhere

SELECT * FROM Students
WHERE FirstName LIKE '_a%';       -- second letter is 'a' (_ skips first letter)

/* -------------------------------
   ORDER BY – Sorting results
   ------------------------------- */

/* Order by StudentID descending */
SELECT * FROM Students
ORDER BY StudentID DESC;

/* Order by StudentID ascending (default) */
SELECT * FROM Students
ORDER BY StudentID;

/* Order by multiple columns */
SELECT * FROM Students
ORDER BY FirstName, LastName;

/* -------------------------------
   TOP N rows
   ------------------------------- */
SELECT TOP(5) * FROM Students;     -- Retrieve first 5 rows

/* -------------------------------
   Functions
   ------------------------------- */

/* CONCAT – join two columns */
SELECT CONCAT(FirstName, ' ', LastName) AS [Full Name]
FROM Students;

/* CONCAT_WS – join columns with separator */
SELECT CONCAT_WS('#', FirstName, LastName) AS [Full Name]
FROM Students;

/* Combining CONCAT with YEAR function */
SELECT CONCAT(FirstName, ' ', LastName) AS [Full Name],
       YEAR(Birthdate) AS [Year of Birth]
FROM Students
ORDER BY 2 ASC;

/* Calculate Age using DATEDIFF */
SELECT CONCAT(FirstName, ' ', LastName) AS [Full Name],
       DATEDIFF(YEAR, Birthdate, GETDATE()) AS [Age]
FROM Students
ORDER BY 2 DESC;

/* -------------------------------
   GROUP BY – Aggregation
   ------------------------------- */

/* Count of students by year of birth */
SELECT YEAR(Birthdate) AS [Year], 
       COUNT(StudentID) AS [Total Students]
FROM Students
GROUP BY YEAR(Birthdate);

/* Average salary based on gender */
SELECT AVG(Salary) AS [Salary Avg], Gender
FROM Teachers
GROUP BY Gender;


/* =========================================================
    ADDITIONAL DQL CONCEPTS
   ========================================================= */

/* -------------------------------
   DISTINCT – remove duplicates
   ------------------------------- */
SELECT DISTINCT Gender
FROM Students;

/* -------------------------------
   TOP N with ORDER BY
   ------------------------------- */
SELECT TOP(5) *
FROM Students
ORDER BY StudentID ASC;   -- ensures first 5 by StudentID

/* -------------------------------
   Table Aliases – shorten table names
   ------------------------------- */
SELECT s.FirstName, s.LastName, sc.SchoolName
FROM Students s
JOIN School1 sc
ON s.SchoolID = sc.SchoolID;

/* -------------------------------
   JOINs – combining data from tables
   ------------------------------- */

/* INNER JOIN – only matching records */
SELECT s.FirstName, sc.SchoolName
FROM Students s
INNER JOIN School1 sc
ON s.SchoolID = sc.SchoolID;

/* LEFT JOIN – all students, even without a school */
SELECT s.FirstName, sc.SchoolName
FROM Students s
LEFT JOIN School1 sc
ON s.SchoolID = sc.SchoolID;

/* -------------------------------
   ORDER BY multiple columns
   ------------------------------- */
SELECT * FROM Students
ORDER BY Gender ASC, LastName DESC; -- ASC/DESC defines sort order

/* -------------------------------
   Using functions in WHERE
   ------------------------------- */
-- Search students born in a specific year
SELECT * FROM Students
WHERE YEAR(Birthdate) = 2005;

/* -------------------------------
   Best Practices & Notes
   ------------------------------- */
/* 1. Comment your queries for clarity */
/* 2. Use uppercase for SQL keywords (SELECT, WHERE, FROM) */
/* 3. Indent columns for long SELECT lists */
/* 4. Combine functions with WHERE, ORDER BY, and SELECT for analysis */
/* 5. Always use TOP with ORDER BY to control which rows are returned */
