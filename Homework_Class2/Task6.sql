--select * from Course
--go

--select * from AchievementType
--go

--select * from GradeDetails
--go

--select * from Grade
--go



select distinct Course.Name, AchievementType.Name from Course
left join Grade on Grade.CourseID = Course.ID
left join GradeDetails on GradeDetails.GradeID = Grade.ID
left join AchievementType on GradeDetails.AchievementTypeID = AchievementType.ID
go
--select distinct Course.Name, AchievementType.Name from Course
--inner join Grade on Grade.CourseID = Course.ID
--inner join GradeDetails on GradeDetails.GradeID = Grade.ID
--inner join AchievementType on GradeDetails.AchievementTypeID = AchievementType.ID
--go



select distinct Teacher.ID, FirstName, LastName from Teacher
inner join Grade on Teacher.ID = Grade.TeacherID
order by Teacher.ID
go
--select distinct Teacher.ID, FirstName, LastName from Teacher
--left join Grade on Teacher.ID = Grade.TeacherID
--where Grade.TeacherID is not null
--order by Teacher.ID
--go



select Teacher.ID, FirstName, LastName from Teacher
left join Grade on Teacher.ID = Grade.TeacherID
where Grade.TeacherID is null
order by Teacher.ID
go



select Student.ID, Student.FirstName, Student.LastName from Grade
right join Student on Student.ID = Grade.StudentID
where Grade.StudentID is null
order by Student.ID
go

