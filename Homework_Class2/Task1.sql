--select * from Student
--go

select * from Student 
where FirstName = 'Antonio'
go

select * from Student 
where DateOfBirth > '1999-01-01'
go

select * from Student 
where Gender = 'M'
go

select * from Student 
where LastName like 's%'
go

select * from Student 
where EnrolledDate like '1998-01%'
go

select * from Student 
where LastName like 'j%' and EnrolledDate like '1998-01%'
go