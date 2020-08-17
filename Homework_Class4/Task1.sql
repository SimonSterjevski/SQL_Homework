
--Declare scalar variable for storing FirstName values
--	Assign value ‘Antonio’ to the FirstName variable
--	Find all Students having FirstName same as the variable

	declare @FirstName nchar(100)
	set @FirstName = 'Antonio'
	select * from Student
	where FirstName = @FirstName
	go


--Declare table variable that will contain StudentId, Student Name and DateOfBirth
--	Fill the table variable with all Female students

	--select * from Student
	--go

	declare @StudentTable table
	(StudentId int, StudentName nchar(100), DateOfBirth date)
	insert into @StudentTable(StudentId, StudentName, DateOfBirth)
	select ID, FirstName, DateOfBirth from Student
	where Gender = 'F'
	select * from @StudentTable
	go


--Declare temp table that will contain LastName and EnrolledDate columns
--	Fill the temp table with all Male students having First Name starting with ‘A’
--	Retrieve the students from the table which last name is with 7 characters

	create table #StudentTempTable
	(LastName nchar(100), EnrolledDate date)
	insert into #StudentTempTable
	select LastName, EnrolledDate from Student
	where FirstName like 'a%' and Gender = 'm'
	select * from #StudentTempTable
	where len(LastName) = 7
	go


--Find all teachers whose FirstName length is less than 5
--	, and the first 3 characters of their FirstName and LastName are the same

	--select * from Teacher
	--go

	select * from Teacher
	where len(FirstName) < 5 and left(FirstName, 3) = left(LastName, 3)
	go
	
