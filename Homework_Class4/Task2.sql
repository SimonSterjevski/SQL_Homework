

--Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId in the following format:
--	- StudentCardNumber without “sc-”
--	- “ – “
--	- First character of student FirstName
--	- “.”
--	- Student LastName
	
--	example:
--	sc-77712 => 77712-K.Spasevska

	--select * from Student
	--go

	create function dbo.fn_FormatStudentName (@StudentId int)
	returns nchar(100)
	as
	begin
	declare @NewDescription nchar(100)
	select @NewDescription = replace(StudentCardNumber, 'sc-', '') + '-' + substring(FirstName, 1, 1) + '.' + LastName
	from Student
	where @StudentId = ID
	return @NewDescription
	end

	select *, dbo.fn_FormatStudentName(Student.ID) as [Description] from Student
	go