--1
select e.Surname, e.Name, e.Patronymic, e.Birthday, e.BirthdayCity from Employee e
union all
select  s.Surname, s.Name, s.Patronymic, s.Birthday, s.BirthdayCity from Student s;

--2
select e.Surname, e.Name, e.Patronymic, e.Birthday, e.BirthdayCity from Employee e
union
select s.Surname, s.Name, s.Patronymic, s.Birthday, s.BirthdayCity from Student s;

--3
select BirthdayCity from Employee e
except
select s.BirthdayCity from Student s;

--4
select BirthdayCity from Employee e
intersect
select s.BirthdayCity from Student s;

--5
select distinct e.Surname, e.Name, e.Patronymic, e.Birthday, e.BirthdayCity from Employee e, Exam ex, Discipline d
where ex.EmployeeId = e.EmployeeId and d.DisciplineId = ex.DisciplineId and d.Name in ('Математика','Фізика');

--6
CREATE DATABASE zkVnzCopy;
use zkVnzCopy;
--копіюємо всі дані в нову таблицю, таблиця створюється автоматична
select * into SubdivisionCopyA from Lab1ClassWork.dbo.Subdivision s;
select * from SubdivisionCopyA;
--копіюємо всі дані в нову таблицю + пуста колонка, таблиця створюється автоматична
select *, null as Abbreviation into SubdivisionCopyB from Lab1ClassWork.dbo.Subdivision s;
select * from SubdivisionCopyB;
--копіюємо лише структуру, таблиця створюється автоматична
select * into SubdivisionCopyC from Lab1ClassWork.dbo.Subdivision s where 1 = 2;
select * from SubdivisionCopyC;

--7
insert into SubdivisionCopyC(Name) select s.Name from Lab1ClassWork.dbo.Subdivision s where s.SubdivisionId > 5;
select * from SubdivisionCopyC;

--8
use zkVnzCopy;
select * into DisciplineCopy from Lab1ClassWork.dbo.Discipline d where d.DisciplineId > 3 and d.DisciplineId < 6;
select * into DisciplineCopy from Lab1ClassWork.dbo.Discipline d where 1=0;
select * from DisciplineCopy;
drop table DisciplineCopy;


use Lab1ClassWork;
select *  into zkVnzCopy.dbo.DisciplineCopy from Discipline

--9
use Lab1ClassWork;
select *  into zkVnzCopy.dbo.ExamCopy from Exam where Mark = 5;
select *  from zkVnzCopy.dbo.ExamCopy;

--10
use Lab1ClassWork;
select *  into zkVnzCopy.dbo.DisciplineCopyNew from Discipline;
select *  from zkVnzCopy.dbo.DisciplineCopyNew;

--11
Update Student
set RecordBook = 'ІК-24-03-0'
where Surname = 'Персиков';

select * from Student where Surname = 'Персиков'

--12
Update Student
set BirthdayCity = 'Прага'
where StudentId between 5 and 10;

select * from Student where StudentId between 5 and 10;

--13
select * from Employee e where e.DutiesId in 
(select d.DutiesId from Duties d where d.PositionId in 
(select p.PositionId from Position p where p.Name in ('професор','доцент')));

update Employee set Oklad = selected.Oklad*1.25 from
(select * from Employee e where e.DutiesId in 
(select d.DutiesId from Duties d where d.PositionId in 
(select p.PositionId from Position p where p.Name in ('професор','доцент')))) as selected
where Employee.EmployeeId = selected.EmployeeId;

--14
select * from Employee e where e.Oklad = (select min(e2.Oklad) from Employee e2);

update Employee set Oklad = selected.Oklad + 0.7 from
(select * from Employee e where e.Oklad = (select min(e2.Oklad) from Employee e2)) as selected
where Employee.EmployeeId = selected.EmployeeId;

--15
select * from Employee e where e.Oklad = (select max(e2.Oklad) from Employee e2);

update Employee set Oklad = selected.Oklad * 2 from
(select * from Employee e where e.Oklad = (select max(e2.Oklad) from Employee e2)) as selected
where Employee.EmployeeId = selected.EmployeeId;

--16
alter table Student 
add EnterDate date not null default '2003.09.01';

alter table Student drop constraint DF__Student__EnterDa__47DBAE45;
alter table Student drop column EnterDate;

select * from Student s where s.StudyGroupId in (select sg.StudyGroupId from StudyGroup sg where sg.Name = 'ІК-11') 

update Student set EnterDate = '2005.09.01' from
(select * from Student s where s.StudyGroupId in (select sg.StudyGroupId from StudyGroup sg where sg.Name = 'ІК-11'))as selected
where Student.StudentId = selected.StudentId

--17
select * from Exam order by StudentId;
delete Exam where StudentId > 3 and StudentId < 5;

--18
select * from Exam ex where ex.StudentId in (select st.StudentId from Student st where st.BirthdayCity = 'Одеса');

delete Exam from
(select * from Exam ex where ex.StudentId in (select st.StudentId from Student st where st.BirthdayCity = 'Одеса')) as Selected
where Exam.ExamId = Selected.ExamId;

--19
-- do not work
delete Student where StudentId > 4 and StudentId < 8;
--work
alter table Exam drop FK_Exam_Student;

alter table Exam add CONSTRAINT FK_Exam_Student FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
ON DELETE CASCADE ON UPDATE CASCADE;

delete Exam from
(select * from Exam ex where ex.StudentId in (select st.StudentId from Student st where st.StudentId > 4 and st.StudentId < 8)) as Selected
where Exam.ExamId = Selected.ExamId;
delete Student where StudentId > 4 and StudentId < 8;



