--1
select * from Position where Name like 'Доцент';
--2
select * from Discipline where Name like 'Англійська';
--3
select Surname+' '+Name+' '+Patronymic as 'ПІП' from Employee;
--4
select Position.Name, Duties.SubdivisionId from Position, Duties where Duties.PositionId = Position.PositionId order by 1;
--5
select * from Duties, Subdivision;
--check the number of lines in the answer
select (select count(*) From Duties)*(select count(*) from Subdivision);
--6
select StudyGroup.Name,Subdivision.Name from StudyGroup,Subdivision;
--7
select g.Name,d.Name from StudyGroup g,Subdivision d;
--8
--•	Неявний синтаксис з’єднання 
select Student.Surname+' '+Student.Name+' '+Student.Patronymic as 'ПІП', StudyGroup.Name from Student, StudyGroup where StudyGroup.StudyGroupId = Student.StudyGroupId;
--•	Неявний синтаксис з використанням псевдонімів
select s.Surname+' '+s.Name+' '+s.Patronymic as 'ПІП', g.Name from Student s, StudyGroup g where g.StudyGroupId = s.StudyGroupId;
--•	Явний синтаксис з’єднання 
select Student.Surname+' '+Student.Name+' '+Student.Patronymic as 'ПІП', StudyGroup.Name from Student Join StudyGroup ON StudyGroup.StudyGroupId = Student.StudyGroupId;
--•	Явний синтаксис з використанням псевдонімів
select s.Surname+' '+s.Name+' '+s.Patronymic as 'ПІП', g.Name from Student s Join StudyGroup g ON g.StudyGroupId = s.StudyGroupId;

--9
-- Розповісти про різницю в роботі та часі виконання запиту з підзапитами та з'єднанням
select Position.PositionId, Position.Name from Position where Position.PositionId in 
(select Duties.PositionId from Duties where Duties.SubdivisionId in 
(select SubdivisionId from Subdivision where Name like 'Кафедра 1'));

--•	Неявний синтаксис з’єднання select Student.Surname+' '+Student.Name+' '+Student.Patronymic as 'ПІП', StudyGroup.Name from Student, StudyGroup where StudyGroup.StudyGroupId = Student.StudyGroupId;
select Position.PositionId, Position.Name from Position, Duties, Subdivision where 
 Position.PositionId = Duties.PositionId and Duties.SubdivisionId = Subdivision.SubdivisionId and Subdivision.Name like 'Кафедра 1';
--•	Неявний синтаксис з використанням псевдонімів
select p.PositionId, p.Name from Position p, Duties d, Subdivision s where 
p.PositionId = d.PositionId and d.SubdivisionId = s.SubdivisionId and s.Name like 'Кафедра 1';
--•	Явний синтаксис з’єднання 
select Position.PositionId, Position.Name from Position 
join Duties on Position.PositionId = Duties.PositionId 
join Subdivision on Duties.SubdivisionId = Subdivision.SubdivisionId and Subdivision.Name like 'Кафедра 1';
--•	Явний синтаксис з використанням псевдонімів
select p.PositionId, p.Name from Position p
join Duties d on p.PositionId = d.PositionId 
join Subdivision s on d.SubdivisionId = s.SubdivisionId and s.Name like 'Кафедра 1';

--10
select s.Surname+' '+s.Name+' '+s.Patronymic as 'ПІП', g.Name, s.BirthdayCity, s.Stipendia from Student s 
Join StudyGroup g ON g.StudyGroupId = s.StudyGroupId and (s.BirthdayCity like 'Ялта' or s.BirthdayCity like 'Луцьк') order by s.Surname;

--11 розповісти про прикольчик (попередньє можна написати аналогічно)
select s.Surname+' '+s.Name+' '+s.Patronymic as 'Full name', g.Name as 'Group name', s.BirthdayCity, s.Stipendia from 
((select * from Student where Stipendia between 620 and 800) Union (select * from Student where Stipendia is null)) s
Join StudyGroup g ON g.StudyGroupId = s.StudyGroupId order by s.Surname, 4;

select s.Surname+' '+s.Name+' '+s.Patronymic as 'Full name', g.Name as 'Group name', s.BirthdayCity, s.Stipendia from Student s 
Join StudyGroup g ON g.StudyGroupId = s.StudyGroupId and ((s.Stipendia between 620 and 800) or s.Stipendia is null) order by s.Surname, 4;

--12
select s.Surname+' '+s.Name+' '+s.Patronymic as 'Full students` name', e.Mark, d.Name,
em.Surname+' '+em.Name+' '+em.Patronymic as 'Full teachers` name', p.Name from Student s
join Exam e on e.StudentId = s.StudentId
join Discipline d on d.DisciplineId = e.DisciplineId
join Employee em on e.EmployeeId = em.EmployeeId
join Duties du on du.DutiesId = em.DutiesId
join Position p on p.PositionId = du.PositionId order by s.Name;

--13
--немає викладачіів з такою датою
select em.EmployeeId, em.Surname+' '+em.Name+' '+em.Patronymic as 'Full teachers` name', p.Name as 'Position', s.Name as 'Subdivision' 
from (select * from Employee where Oklad > 3400 and (DataVuplaty between '2013-01-01 ' and '2013-04-01')) em join Duties du on du.DutiesId = em.DutiesId
join Position p on p.PositionId = du.PositionId
join Subdivision s on s.SubdivisionId = du.SubdivisionId;

--14
select em.EmployeeId, em.Surname+' '+em.Name+' '+em.Patronymic as 'Full teachers` name', p.Name as 'Position', s.Name as 'Subdivision' 
from Employee em join Duties du on du.DutiesId = em.DutiesId
join Position p on p.PositionId = du.PositionId
join Subdivision s on s.SubdivisionId = du.SubdivisionId where s.Name  not in('Кафедра 1','Кафедра 2') order by em.Surname;

--15
select distinct em.EmployeeId, em.Surname+' '+em.Name+' '+em.Patronymic as 'Full teachers` name', p.Name as 'Position', s.Name as 'Subdivision',
d.Name, sg.Name from Employee em join Duties du on du.DutiesId = em.DutiesId
join Position p on p.PositionId = du.PositionId
join Subdivision s on s.SubdivisionId = du.SubdivisionId
join Exam e on e.EmployeeId = em.EmployeeId
join Discipline d on d.DisciplineId = e.DisciplineId
join Student st on st.StudentId = e.StudentId
join StudyGroup sg on sg.StudyGroupId = st.StudyGroupId order by 1;

--16
select COUNT(s.StudentId), sg.Name from Student s
join StudyGroup sg on sg.StudyGroupId = s.StudyGroupId group by  sg.Name;

--17
--це для перевірки кількості
select COUNT(s.StudentId) from Student as s where exists (Select * from Exam e where e.Mark = 5 and e.StudentId = s.StudentId);

--а це саме ззавдання
select COUNT(s.StudentId), sg.Name from Student s
join StudyGroup sg on sg.StudyGroupId = s.StudyGroupId
where exists (Select * from Exam e where e.Mark = 5 and (e.StudentId = s.StudentId))
group by  sg.Name;

--18
select em.EmployeeId,em.Surname,p.Name,s.Name , count(sg.StudyGroupId) as 'Nember of groups' from Employee em join Duties du on du.DutiesId = em.DutiesId
join Position p on p.PositionId = du.PositionId
join Subdivision s on s.SubdivisionId = du.SubdivisionId
join Exam e on e.EmployeeId = em.EmployeeId
join Discipline d on d.DisciplineId = e.DisciplineId
join Student st on st.StudentId = e.StudentId
join StudyGroup sg on sg.StudyGroupId = st.StudyGroupId group by em.EmployeeId, em.Surname,p.Name,s.Name;

--19
select distinct d.Name as 'Subject name',em.EmployeeId, em.Surname+' '+em.Name+' '+em.Patronymic as 'Full teachers` name',
e.DateExam from Exam e
join Discipline d on d.DisciplineId = e.DisciplineId
join Employee em on em.EmployeeId = e.EmployeeId
where (DAY(e.DateExam) between 1 and 7) and (MONTH(e.DateExam) = 6)  order by 1, 2;

--2
select p.Name as 'Position', s.Name as 'Subdivision' from Position p 
join Duties d on d.PositionId = p.PositionId
left join Subdivision s on s.SubdivisionId = d.SubdivisionId order by 1;

--21
select s.Name as 'Subdivision', sg.Name as 'Groups` name' from Subdivision s
left join StudyGroup sg on s.SubdivisionId = sg.SubdivisionId;













