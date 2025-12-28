/* =========================================================
   SQL QUICK NOTES – DQL (ADVANCED)
   ========================================================= */

/* -------------------------------
   DQL Overview
   -------------------------------
   - DQL: Data Query Language
   - Used to retrieve data from tables
   - Main commands: SELECT / FROM / WHERE
*/

/* -------------------------------
   IMPORTANT NOTES
   -------------------------------
   - WHERE is used to filter rows BEFORE aggregation
   - WHERE cannot be used with aggregate functions (AVG, COUNT, SUM)
   - HAVING is used to filter results AFTER aggregation

/* SQL order (writing order)
   SELECT
   FROM
   WHERE
   GROUP BY
   HAVING
   ORDER BY

   SQL logical execution order (how SQL works internally)
   FROM
   WHERE
   GROUP BY
   HAVING
   SELECT
   ORDER BY
*/


   - Column aliases are recognized only in SELECT and ORDER BY
   - Aliases cannot be used in WHERE
   - Any non-aggregated column in SELECT must appear in GROUP BY
*/

/* -------------------------------
   HAVING – filter aggregated results
   ------------------------------- */

/* Teachers with average salary greater than 700 */
SELECT AVG(Salary) AS Avg_Salary, Gender
FROM Teachers
GROUP BY Gender
HAVING AVG(Salary) > 700;

/* -------------------------------
   JOINs – combining tables
   ------------------------------- */

/* INNER JOIN
   - Returns only schools that have students
*/
SELECT SchoolName, COUNT(StudentID) AS Total_Students
FROM School1
INNER JOIN Students
    ON School1.SchoolID = Students.SchoolID
GROUP BY SchoolName;

/* LEFT JOIN
   - Returns all schools, even if they have 0 students
*/
SELECT SchoolName, School1.SchoolID, COUNT(StudentID) AS Total_Students
FROM School1
LEFT JOIN Students
    ON School1.SchoolID = Students.SchoolID
GROUP BY SchoolName, School1.SchoolID;

/* RIGHT JOIN
   - Returns all students, even if they are not linked to a school
*/
SELECT SchoolName, School1.SchoolID, COUNT(StudentID) AS Total_Students
FROM School1
RIGHT JOIN Students
    ON School1.SchoolID = Students.SchoolID
GROUP BY SchoolName, School1.SchoolID;

/* FULL OUTER JOIN
   - Returns:
     • students with schools
     • students without schools
     • schools without students
*/
SELECT St.FirstName + ' ' + St.LastName AS FullName,
       St.StudentID,
       SchoolName,
       School1.SchoolID
FROM School1
FULL OUTER JOIN Students St
    ON School1.SchoolID = St.SchoolID;

/* -------------------------------
   Aggregation with multiple JOINs
   ------------------------------- */

/* -------------------------------
   Schools with total students and total teachers
   -------------------------------
   - LEFT JOIN is used to include all schools
   - COUNT(DISTINCT ...) is used to avoid duplicate counts
     caused by joining multiple tables
*/

SELECT Sc.SchoolName,
       COUNT(DISTINCT St.StudentID) AS Count_Of_Students,
       COUNT(DISTINCT Te.TeacherID) AS Count_Of_Teachers
FROM School1 Sc
LEFT JOIN Students St
    ON St.SchoolID = Sc.SchoolID
LEFT JOIN Teachers Te
    ON Te.SchoolID = Sc.SchoolID
GROUP BY Sc.SchoolID, Sc.SchoolName;

/* Output:
   - All schools
   - Schools with 0 students or 0 teachers are included
*/


/* How many subjects each teacher teaches */
SELECT Te.FirstName,
       COUNT(Tc.SubjectID) AS Total_Subjects
FROM Teachers Te
LEFT JOIN TeacherSubject Tc
    ON Te.TeacherID = Tc.TeacherID
LEFT JOIN Subjects Su
    ON Su.SubjectID = Tc.SubjectID
GROUP BY Te.FirstName;
/* LEFT JOIN is used to include teachers with 0 subjects */

/* How many students each teacher teaches */
SELECT Te.FirstName,
       COUNT(StudentID) AS Total_Students
FROM Teachers Te
LEFT JOIN TeacherStudent Ts
    ON Te.TeacherID = Ts.TeacherID
GROUP BY Te.FirstName;

/* How many subjects each student takes */
SELECT St.FirstName,
       COUNT(Ss.SubjectID) AS Total_Subjects
FROM Students St
LEFT JOIN StudentSubject Ss
    ON St.StudentID = Ss.StudentID
GROUP BY St.FirstName;

/* List each student with subjects taken */
SELECT St.FirstName,
       Su.SubjectNameEn
FROM Students St
INNER JOIN StudentSubject Ss
    ON St.StudentID = Ss.StudentID
INNER JOIN Subjects Su
    ON Su.SubjectID = Ss.SubjectID;

/* Average mark for each student (all subjects) */
SELECT St.FirstName,
       COUNT(Ss.SubjectID) AS Total_Subjects,
       AVG(Mark) AS Avg_Mark
FROM Students St
LEFT JOIN StudentSubject Ss
    ON St.StudentID = Ss.StudentID
LEFT JOIN Marks Ma
    ON Ss.StudentSubjectID = Ma.Student_SubjectID
GROUP BY St.FirstName;

/* -------------------------------
   CASE – conditional logic
   ------------------------------- */

/* Pass / Fail based on average mark */
SELECT St.FirstName,
       COUNT(Ss.SubjectID) AS Total_Subjects,
       AVG(Mark) AS Avg_Mark,
       CASE
           WHEN AVG(Mark) >= 75 THEN 'Success'
           ELSE 'Fail'
       END AS Result
FROM Students St
LEFT JOIN StudentSubject Ss
    ON St.StudentID = Ss.StudentID
LEFT JOIN Marks Ma
    ON Ss.StudentSubjectID = Ma.Student_SubjectID
GROUP BY St.FirstName;

/* Grade classification using CASE */
SELECT St.FirstName,
       COUNT(Ss.SubjectID) AS Total_Subjects,
       AVG(Mark) AS Avg_Mark,
       CASE
           WHEN AVG(Mark) >= 90 THEN 'A'
           WHEN AVG(Mark) >= 80 THEN 'B'
           WHEN AVG(Mark) >= 70 THEN 'C'
           WHEN AVG(Mark) >= 60 THEN 'D'
           ELSE 'F'
       END AS Grade
FROM Students St
LEFT JOIN StudentSubject Ss
    ON St.StudentID = Ss.StudentID
LEFT JOIN Marks Ma
    ON Ss.StudentSubjectID = Ma.Student_SubjectID
GROUP BY St.FirstName;
