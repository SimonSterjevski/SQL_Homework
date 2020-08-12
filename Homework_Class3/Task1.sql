
--  List all student First Name that are duplicated more than 3 time

 select FirstName, count(ID) as NameCounter from Student
 group by Firstname
 having count(ID) > 3
 go


--  List the First Name for all the student's that their Last Name is duplicated and they are born in 1985  (Hint use View)

 create view vw_LastNameDuplicates
 as
 select LastName, count(ID) as CountNumber from Student
 where DateOfBirth > '1984-12-31' and DateOfBirth < '1986-01-01'
 group by LastName
 having count(ID) > 1
 go

 select Student.FirstName, vw_LastNameDuplicates.CountNumber from Student
 join vw_LastNameDuplicates on Student.LastName = vw_LastNameDuplicates.LastName
 where Student.DateOfBirth > '1984-12-31' and Student.DateOfBirth < '1986-01-01'
 go


--  Find how many courses each student (using Name and Last Name) has attended

 select Student.FirstName, Student.LastName, count(Grade.CourseID) as CourcesAttended from Student
 left join Grade on Student.ID = Grade.StudentID
 group by Student.FirstName, Student.LastName
 go


--  Find the students (using Name and Last Name) that have attended less than 20 courses and get their Min, Max and Average grade ordered by the Average Grade ascending

 create view vw_LessThan20Courses
 as
 select Student.FirstName, Student.LastName, Student.ID, count(Grade.CourseID) as CourcesAttended from Student
 left join Grade on Student.ID = Grade.StudentID
 group by Student.FirstName, Student.LastName, Student.ID
 having count(Grade.CourseID) < 20
 go

 select vw_LessThan20Courses.FirstName, vw_LessThan20Courses.LastName, min(Grade.Grade) as MinGrade, max(Grade.Grade) as MaxGrade, 
 avg(Grade.Grade) as AverageGrade from vw_LessThan20Courses
 left join Grade on vw_LessThan20Courses.ID = Grade.StudentID
 group by vw_LessThan20Courses.FirstName, vw_LessThan20Courses.LastName
 go


--  For all the students (using First Name and Last Name) get their Min, Max and Average grade (Create view vv_StudentSuccess)

 create view vw_StudentSuccess
 as
 select Student.FirstName, Student.LastName, min(Grade.Grade) as MinGrade, max(Grade.Grade) as MaxGrade, 
 avg(Grade.Grade) as AverageGrade from Student
 left join Grade on Student.ID = Grade.StudentID
 group by Student.FirstName, Student.LastName
 go


--  Find all the students that have achieved less than 25% from the AchievementMaxPoints for the AchievementType  'Domasni'

create view vw_HomeworkHatersIDs
as
select Grade.StudentID from GradeDetails
join AchievementType on GradeDetails.AchievementTypeID = AchievementType.ID
join Grade on GradeDetails.GradeID = Grade.ID
where AchievementType.Name = 'Domasni' and AchievementPoints*4 < AchievementMaxPoints
go

create view vw_HomeworkHatersStudents
as
select ID, FirstName, LastName, DateOfBirth, EnrolledDate, Gender, NationalIDNumber, StudentCardNumber, Count(ID) as BadHomeworkNumOfCourses from Student
join vw_HomeworkHatersIDs on Student.ID = vw_HomeworkHatersIDs.StudentID
group by ID, FirstName, LastName, DateOfBirth, EnrolledDate, Gender, NationalIDNumber, StudentCardNumber
go


--  For the Students from the above list check what is their Success (Min, Max and Average grade) and order them by the AVG grade
 
 select vw_HomeworkHatersStudents.ID, FirstName, LastName, DateOfBirth, EnrolledDate, Gender, NationalIDNumber, StudentCardNumber, min(Grade.Grade) as MinGrade,
 max(Grade.Grade) as MaxGrade, avg(Grade.Grade) as AverageGrade from vw_HomeworkHatersStudents
 join Grade on Grade.StudentID = vw_HomeworkHatersStudents.ID
 group by vw_HomeworkHatersStudents.ID, FirstName, LastName, DateOfBirth, EnrolledDate, Gender, NationalIDNumber, StudentCardNumber
 order by AverageGrade desc
 go


 --select * from Student
 --go
 --select * from AchievementType
 --go
 --select * from Grade
 --go
 --select * from GradeDetails
 --go


 





 






