--select * from Student
--go

select * from Student
where FirstName = 'Antonio'
order by LastName
go

select * from Student
order by FirstName
go

select * from Student
where Gender = 'M'
order by EnrolledDate desc
go