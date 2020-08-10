select * from Grade
go

alter table Grade
add constraint student_id
foreign key (StudentID) references Student(ID)
go

alter table Grade
add constraint course_id
foreign key (CourseID) references Course(ID)
go

alter table Grade
add constraint teacher_id
foreign key (TeacherID) references Teacher(ID)
go

alter table GradeDetails
add constraint grade_id
foreign key (GradeID) references Grade(ID)
go

alter table GradeDetails
add constraint achtype_id
foreign key (AchievementTypeID) references AchievementType(ID)
go