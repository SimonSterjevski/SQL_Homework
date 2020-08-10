select * from Teacher
go

select Teacher.FirstName
from Teacher
union all
select Student.FirstName
from Student
go

select Teacher.LastName
from Teacher
union 
select Student.LastName
from Student
go

--select distinct Teacher.LastName
--from Teacher
--union 
--select distinct Student.LastName
--from Student
--go

select Teacher.FirstName
from Teacher
intersect
select Student.FirstName
from Student
go