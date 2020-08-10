--select * from GradeDetails
--go

--select * from AchievementType
--go

alter table GradeDetails
add constraint max_points
default 100 for AchievementMaxPoints
go

alter table GradeDetails
add constraint points_check
check (AchievementPoints <= AchievementMaxPoints)
go

alter table AchievementType
add constraint name_unique
unique (Name)
go