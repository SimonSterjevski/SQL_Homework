/*
Create multi-statement table value function that for specific Teacher and Course will return list of students (FirstName, LastName) 
who passed the exam, together with Grade and CreatedDate
*/


create function fn_createStudentReport (@teacherId int, @courseId int)
returns @StudentReport table (FirstName nchar(100), LastName nchar(100), Grade int, CreatedDate date)
as
begin
insert into @StudentReport
select Student.FirstName, Student.LastName, Grade, CreatedDate from Grade
inner join Student on Student.ID = StudentID
where @teacherId = TeacherID and @courseId = CourseID
return
end

select * from dbo.fn_createStudentReport (0, 0)
go