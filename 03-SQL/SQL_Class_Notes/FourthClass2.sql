--advance query
--all students information with his age after 5 years
select *,DATEDIFF(year,s.Birthdate,DATEADD(YEAR,5,GETDATE())) AS [AGE AFTER 5 YEARS]
from Students s

--STUDENT INFORMATION + COUNT OF PASS SUBJECT AND FAIL SUBJECT __ 75> PASS//<75 FAIL
SELECT s.StudentID , s.FirstName+s.LastName as [full name],
sum( case when Mark >=75 then 1 else 0 end) as passcount ,
sum (case when Mark <=75 then 1 else 0 end) as failcount 
FROM Students s
inner join StudentSubject ss on s.StudentID=ss.StudentID
inner join Marks m on m.Student_SubjectID=ss.StudentSubjectID
group by s.StudentID, s.FirstName+s.LastName
-------------------------------------------
--methode 2
--cta
select t1.StudentID,SUM(t1.passcount)as pass ,SUM(t1.failcount) as fail
from (

SELECT s.StudentID , s.FirstName+s.LastName as [full name],
( case when Mark >=75 then 1 else 0 end) as passcount ,
(case when Mark <=75 then 1 else 0 end) as failcount 
FROM Students s
inner join StudentSubject ss on s.StudentID=ss.StudentID
inner join Marks m on m.Student_SubjectID=ss.StudentSubjectID ) t1
group by t1.StudentID ,t1.[full name]

------------------------------
--- Top 1 mark per each subject  with the name of student 

select s.StudentID ,FirstName+' '+LastName ,sub.SubjectNameEn ,Mark
from Marks m
inner join StudentSubject ss on m.Student_SubjectID=ss.StudentSubjectID
inner join Students s on s.StudentID=ss.StudentID 
inner join Subjects sub on sub.SubjectID=ss.SubjectID

 inner join 
 (select ss2.SubjectID, max(Mark) as max_mark
 from Marks  m2
 inner join StudentSubject ss2  on ss2.StudentSubjectID=m2.Student_SubjectID
 group by ss2.SubjectID)t1  

 on t1.SubjectID =ss.SubjectID 
 and t1.max_mark=m.Mark



 