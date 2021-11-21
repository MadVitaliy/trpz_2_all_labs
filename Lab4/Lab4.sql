--1
select * from Employee e where e.EmployeeId in (select distinct EmployeeId from Exam) order by Surname;
select * from Employee e where exists(select * from Exam ex where ex.EmployeeId = e.EmployeeId)  order by Surname;
--2
select * from Employee e where e.EmployeeId not in (select distinct EmployeeId from Exam) order by Surname;
select * from Employee e where not exists(select * from Exam ex where ex.EmployeeId = e.EmployeeId)  order by Surname;
--3
select * from Student st where exists(select * from Exam ex where st.StudentId = ex.StudentId and ex.Mark <= 2) order by st.Surname;
--4
select * from Subdivision s where exists(select * from Duties d where d.SubdivisionId = s.SubdivisionId and 
exists(select * from Employee e where e.DutiesId = d.DutiesId)) order by s.Name;
--5
select * from Subdivision s where not exists(select * from StudyGroup sg where sg.SubdivisionId = s.SubdivisionId) order by s.Name;
--6
select  ex.StudentId, ex.Mark from Exam ex where Mark = 5;

select st.Surname+' '+st.Name+' '+st.Patronymic as [Full name], 
(select sg.Name from StudyGroup sg where sg.StudyGroupId = st.StudyGroupId) [Group name] from Student st where 
st.StudentId in (select  distinct ex.StudentId from Exam ex where Mark = 5) order by [Full name];

select st.Surname+' '+st.Name+' '+st.Patronymic as [Full name], sg.Name [Group name] from Student st, StudyGroup sg where 
st.StudentId in (select  distinct ex.StudentId from Exam ex where Mark = 5) and sg.StudyGroupId = st.StudyGroupId order by [Full name];
--7
select em.Surname+' '+em.Name+' '+em.Patronymic as [Full name], p.Name as [Position name]  from Employee em, Duties du, Position p where 
exists(select * from Exam ex where ex.EmployeeId = em.EmployeeId and 
exists(select * from Discipline d where d.DisciplineId = ex.DisciplineId and d.Name = 'математика'))
and du.DutiesId = em.DutiesId and p.PositionId = du.PositionId;
--8
select em.Surname+' '+em.Name+' '+em.Patronymic as [Full name], em.Oklad, em.Nadbavka, p.Name as [Position name], s.Name 
from Employee em, Duties du, Position p, Subdivision s where 
em.Nadbavka >= 450 and em.Oklad > (select AVG(em2.Oklad) from Employee em2) and
du.DutiesId = em.DutiesId and p.PositionId = du.PositionId and s.SubdivisionId = du.SubdivisionId;
--9
select st.Surname+' '+st.Name+' '+st.Patronymic as [Full name], sg.Name [Group name], ex.Mark from Student st, StudyGroup sg, Exam ex where 
sg.StudyGroupId = st.StudyGroupId and ex.StudentId = st.StudentId and ex.Mark >= (select AVG(ex2.Mark) from Exam ex2) order by [Full name] ;
--10
select st.StudentId, st.Surname+' '+st.Name+' '+st.Patronymic as [Full name] from Student st where 
exists(select * from Exam ex where ex.StudentId = st.StudentId and ex.StudentId in 
(select ex.StudentId from Exam ex group by ex.StudentId having AVG(ex.Mark) > (select AVG(ex2.Mark) from Exam ex2)));

select ex.StudentId from Exam ex group by ex.StudentId having AVG(ex.Mark) > (select AVG(ex2.Mark) from Exam ex2)
--11
select * from Employee e1 where e1.BirthdayCity = (select e2.BirthdayCity from Employee e2 where e2.EmployeeId = '1');
--12
--select e1.* from Employee e1, Duties d where d.DutiesId = e1.DutiesId and d.DutiesId in 
--(select e2.DutiesId from Employee e2 where e2.Surname = 'Бобков') order by Surname, Name;
select e1.* from Employee e1, Duties d where d.DutiesId = e1.DutiesId and d.PositionId in 
(select d2.PositionId from Duties d2 where d2.DutiesId in(select e2.DutiesId from Employee e2 where e2.Surname = 'Бобков'));
--13
select * from Student s where s.StudyGroupId 
in(select sg.StudyGroupId from StudyGroup sg where sg.StudyGroupId = 
(select s2.StudyGroupId  from Student s2 where s2.Surname = 'Масливець'));
--14
--select Count(temp.EmployeeId), temp.Name from (select em.EmployeeId, p.Name  from Employee em, Duties du, Position p where 
--du.DutiesId = em.DutiesId and p.PositionId = du.PositionId) as temp group by temp.Name ;

select count(temp.cout1) from(select count(em.EmployeeId) as cout1, p.Name  from Employee em, Duties du, Position p where 
du.DutiesId = em.DutiesId and p.PositionId = du.PositionId group by p.Name having count(em.EmployeeId) > 2) as temp;

--15
select count(count1) from (select Count(s.StudentId) as count1, sg.Name from Student s,StudyGroup sg 
where sg.StudyGroupId = s.StudyGroupId group by sg.Name having Count(s.StudentId) > 5) as temp;

--16
-- відображає ід студента, ід дисципліни та кількість спроб здачі
select ex3.StudentId, ex3.DisciplineId, count(ex3.DisciplineId)  from Exam ex3
 group by ex3.StudentId, ex3.DisciplineId order by 1;

 -- відображає ід студента, ід дисципліни та кількість спроб здачі > 1
 select ex3.StudentId, ex3.DisciplineId, count(ex3.DisciplineId)  from Exam ex3
 group by ex3.StudentId, ex3.DisciplineId having count(ex3.DisciplineId) > 1  order by 1;

 select stdid.StudentId, stdid.DisciplineId, st.StudyGroupId from 
 (select ex3.StudentId, ex3.DisciplineId, count(ex3.DisciplineId) as [count]  from Exam ex3
 group by ex3.StudentId, ex3.DisciplineId having count(ex3.DisciplineId) > 1) as [stdid],
 Student st where stdid.StudentId = st.StudentId;

 --
 select *from
 ( select stdid2.StudentId, stdid2.DisciplineId, st2.StudyGroupId from 
 (select ex2.StudentId, ex2.DisciplineId, count(ex2.DisciplineId) as [count]  from Exam ex2
 group by ex2.StudentId, ex2.DisciplineId having count(ex2.DisciplineId) > 1) as [stdid2],
 Student st2 where stdid2.StudentId = st2.StudentId) as [student2],
 (select stdid3.StudentId, stdid3.DisciplineId, st3.StudyGroupId from 
 (select ex3.StudentId, ex3.DisciplineId, count(ex3.DisciplineId) as [count]  from Exam ex3
 group by ex3.StudentId, ex3.DisciplineId having count(ex3.DisciplineId) > 1) as [stdid3],
 Student st3 where stdid3.StudentId = st3.StudentId) as [student3]

 --даний запит виведе лише ід тих одногрупників, які здавали один і той самий предмет
 --при чому кожен з них це робив більше разу.
 --а також ід їх групи
  select student2.StudentId, student2.StudyGroupId from
 ( select stdid2.StudentId, stdid2.DisciplineId, st2.StudyGroupId from 
 (select ex2.StudentId, ex2.DisciplineId, count(ex2.DisciplineId) as [count]  from Exam ex2
 group by ex2.StudentId, ex2.DisciplineId having count(ex2.DisciplineId) > 1) as [stdid2],
 Student st2 where stdid2.StudentId = st2.StudentId) as [student2],
 (select stdid3.StudentId, stdid3.DisciplineId, st3.StudyGroupId from 
 (select ex3.StudentId, ex3.DisciplineId, count(ex3.DisciplineId) as [count]  from Exam ex3
 group by ex3.StudentId, ex3.DisciplineId having count(ex3.DisciplineId) > 1) as [stdid3],
 Student st3 where stdid3.StudentId = st3.StudentId) as [student3] where
 student2.StudyGroupId = student3.StudyGroupId and student2.DisciplineId = student3.DisciplineId
 and student2.StudentId != student3.StudentId;


 --хто зна, шо за фігня вище, але повино бути як нище
 select ex3.StudentId, ex3.DisciplineId, count(ex3.DisciplineId)  from Exam ex3
 group by ex3.StudentId, ex3.DisciplineId order by 1;

 -- відображає ід студента, ід дисципліни та кількість спроб здачі > 1
 select ex3.StudentId, ex3.DisciplineId, count(ex3.DisciplineId)  from Exam ex3
 group by ex3.StudentId, ex3.DisciplineId having count(ex3.DisciplineId) > 1  order by 1;

 select stdid.StudentId, stdid.DisciplineId, st.StudyGroupId from 
 (select ex3.StudentId, ex3.DisciplineId, count(ex3.DisciplineId) as [count]  from Exam ex3
 group by ex3.StudentId, ex3.DisciplineId having count(ex3.DisciplineId) > 1) as [stdid],
 Student st where stdid.StudentId = st.StudentId;

 select count(stdid.StudentId), st.StudyGroupId from 
 (select ex3.StudentId, ex3.DisciplineId, count(ex3.DisciplineId) as [count]  from Exam ex3
 group by ex3.StudentId, ex3.DisciplineId having count(ex3.DisciplineId) > 1) as [stdid],
 Student st where stdid.StudentId = st.StudentId group by st.StudyGroupId;
--17
--гавно
select ex.StudentId, avg(ex.Mark) from Exam ex group by ex.StudentId;

select (select st.Surname+' '+st.Name+' '+st.Patronymic  from Student st where st.StudentId = ex.StudentId) as [Full name], avg(ex.Mark) from Exam ex group by ex.StudentId;

select st.Surname+' '+st.Name+' '+st.Patronymic as [Full name], sg.Name [Group name] from Student st, Exam ex, StudyGroup sg 
where ex.StudentId = st.StudentId and sg.StudyGroupId = st.StudyGroupId;

select st.StudentId, AVG(ex.Mark), sg.Name [Group name] from Student st, Exam ex, StudyGroup sg  
where ex.StudentId = st.StudentId and sg.StudyGroupId = st.StudyGroupId group by st.StudentId, sg.Name;

select st.StudentId, AVG(ex.Mark) as [Avg mark], sg.Name [Group name], sd.Name as [Subdivision] from Student st, Exam ex, StudyGroup sg, Subdivision sd  
where ex.StudentId = st.StudentId and sg.StudyGroupId = st.StudyGroupId and sd.SubdivisionId = sg.SubdivisionId group by st.StudentId, sg.Name, sd.Name;


select avg(ex2.Mark), sg2.StudyGroupId from Exam ex2, Student st2, StudyGroup sg2 where 
ex2.StudentId = st2.StudentId and sg2.StudyGroupId = st2.StudyGroupId group by sg2.StudyGroupId;

--тут почалося шось нормальне
--середні оцінки в гупах з їхнім ід
select avg(ex2.Mark), st2.StudyGroupId from Exam ex2, Student st2 where 
ex2.StudentId = st2.StudentId and st2.StudyGroupId = st2.StudyGroupId group by st2.StudyGroupId;

--середні оцінки кожного студенту з їхнім ід
select avg(ex3.Mark), st3.StudentId from Exam ex3, Student st3 where 
ex3.StudentId = st3.StudentId group by st3.StudentId;

--верхні два об'єднані по кожному студенту
select st.StudentId, stavg.avg , gravg.avg from 
(select avg(ex2.Mark) as [avg], st2.StudyGroupId from Exam ex2, Student st2 where 
ex2.StudentId = st2.StudentId and st2.StudyGroupId = st2.StudyGroupId group by st2.StudyGroupId) as [gravg],
(select avg(ex3.Mark) as [avg], st3.StudentId from Exam ex3, Student st3 where 
ex3.StudentId = st3.StudentId group by st3.StudentId) as [stavg],
Student st where stavg.StudentId = st.StudentId and gravg.StudyGroupId = st.StudyGroupId;

select st.StudentId, st.Surname+' '+st.Name+' '+st.Patronymic as [Full name], stavg.avg , gravg.avg from 
(select avg(ex2.Mark) as [avg], st2.StudyGroupId from Exam ex2, Student st2 where 
ex2.StudentId = st2.StudentId and st2.StudyGroupId = st2.StudyGroupId group by st2.StudyGroupId) as [gravg],
(select avg(ex3.Mark) as [avg], st3.StudentId from Exam ex3, Student st3 where 
ex3.StudentId = st3.StudentId group by st3.StudentId) as [stavg],
Student st where stavg.StudentId = st.StudentId and gravg.StudyGroupId = st.StudyGroupId;

--Виводить ПІБ студента, середню оцінку студента, назву групи, середню оцінку в групі та назву кафедри для студентів
select st.StudentId, st.Surname+' '+st.Name+' '+st.Patronymic as [Full name], stavg.avg , gravg.avg, sg.Name, sd.Name from
(select avg(ex2.Mark) as [avg], st2.StudyGroupId from Exam ex2, Student st2 where 
ex2.StudentId = st2.StudentId and st2.StudyGroupId = st2.StudyGroupId group by st2.StudyGroupId) as [gravg],
(select avg(ex3.Mark) as [avg], st3.StudentId from Exam ex3, Student st3 where 
ex3.StudentId = st3.StudentId group by st3.StudentId) as [stavg],
Student st, StudyGroup sg, Subdivision sd where stavg.StudentId = st.StudentId and gravg.StudyGroupId = st.StudyGroupId
and sg.StudyGroupId = st.StudyGroupId and sd.SubdivisionId = sg.SubdivisionId;

--чуть зміним структуру
select sg3.StudyGroupId, sg3.Name, sd3.Name from StudyGroup sg3, Subdivision sd3 where sd3.SubdivisionId =sg3.SubdivisionId;

select st.StudentId, st.Surname+' '+st.Name+' '+st.Patronymic as [Full name], stavg.avg , gravg.avg, sgsdname.sgname, sgsdname.sdname from
(select avg(ex2.Mark) as [avg], st2.StudyGroupId from Exam ex2, Student st2 where 
ex2.StudentId = st2.StudentId and st2.StudyGroupId = st2.StudyGroupId group by st2.StudyGroupId) as [gravg],
(select avg(ex3.Mark) as [avg], st3.StudentId from Exam ex3, Student st3 where 
ex3.StudentId = st3.StudentId group by st3.StudentId) as [stavg],
(select sg3.StudyGroupId, sg3.Name as [sgname], sd3.Name[sdname] from StudyGroup sg3, Subdivision sd3 
where sd3.SubdivisionId =sg3.SubdivisionId) as [sgsdname],
Student st where stavg.StudentId = st.StudentId and gravg.StudyGroupId = st.StudyGroupId
and sgsdname.StudyGroupId = st.StudyGroupId;

--і нарешті кінцева відповідь на завдання
select st.StudentId, st.Surname+' '+st.Name+' '+st.Patronymic as [Full name], stavg.avg , gravg.avg, sgsdname.sgname, sgsdname.sdname from
(select avg(ex2.Mark) as [avg], st2.StudyGroupId from Exam ex2, Student st2 where 
ex2.StudentId = st2.StudentId and st2.StudyGroupId = st2.StudyGroupId group by st2.StudyGroupId) as [gravg],
(select avg(ex3.Mark) as [avg], st3.StudentId from Exam ex3, Student st3 where 
ex3.StudentId = st3.StudentId group by st3.StudentId) as [stavg],
(select sg3.StudyGroupId, sg3.Name as [sgname], sd3.Name[sdname] from StudyGroup sg3, Subdivision sd3 
where sd3.SubdivisionId =sg3.SubdivisionId) as [sgsdname],
Student st where stavg.StudentId = st.StudentId and gravg.StudyGroupId = st.StudyGroupId
and sgsdname.StudyGroupId = st.StudyGroupId and stavg.avg > gravg.avg;

--18


--відбирає ід студентів та макс оцінуи з кожного предмету ex3.DisciplineId - просто рудимент
select st3.StudentId, ex3.DisciplineId, max(ex3.Mark) from Exam ex3, Student st3 where 
ex3.StudentId = st3.StudentId group by st3.StudentId, ex3.DisciplineId order by 1;

--використовує попередній і відбирає ід студентів з середньою оцінкою, вирахованою з макс
select mmfes.StudentId, sum(mmfes.maxm)/COUNT(mmfes.maxm) from (select st3.StudentId, ex3.DisciplineId, max(ex3.Mark) as [maxm] from Exam ex3, Student st3 where 
ex3.StudentId = st3.StudentId group by st3.StudentId, ex3.DisciplineId) as [mmfes] group by mmfes.StudentId order by 1;

--результат за умовою, але не у вигляді дробового числа
select st.StudentId, st.Surname+' '+st.Name+' '+st.Patronymic as [Full name], avgmarks.avg from 
(select mmfes.StudentId, sum(mmfes.maxm)/COUNT(mmfes.maxm) as [avg] from (select st3.StudentId, ex3.DisciplineId, max(ex3.Mark) as [maxm] from Exam ex3, Student st3 where 
ex3.StudentId = st3.StudentId group by st3.StudentId, ex3.DisciplineId) as [mmfes] group by mmfes.StudentId) as [avgmarks],
Student st where avgmarks.StudentId = st.StudentId;

--вооо. лишилось обмежить кількість знаків після крапки 
select st.StudentId, st.Surname+' '+st.Name+' '+st.Patronymic as [Full name], avgmarks.avg from 
(select mmfes.StudentId, cast(sum(mmfes.maxm) as float) /COUNT(mmfes.maxm) as [avg] from 
(select st3.StudentId, ex3.DisciplineId, max(ex3.Mark) as [maxm] from Exam ex3, Student st3 where 
ex3.StudentId = st3.StudentId group by st3.StudentId, ex3.DisciplineId) as [mmfes] group by mmfes.StudentId) as [avgmarks],
Student st where avgmarks.StudentId = st.StudentId;

--каєф, кінцевий варіант
select st.StudentId, st.Surname+' '+st.Name+' '+st.Patronymic as [Full name], avgmarks.avg from 
(select mmfes.StudentId, round(cast(sum(mmfes.maxm) as float) /COUNT(mmfes.maxm),2) as [avg] from 
(select st3.StudentId, ex3.DisciplineId, max(ex3.Mark) as [maxm] from Exam ex3, Student st3 where 
ex3.StudentId = st3.StudentId group by st3.StudentId, ex3.DisciplineId) as [mmfes] group by mmfes.StudentId) as [avgmarks],
Student st where avgmarks.StudentId = st.StudentId;

--зараз прозрів, шо початок можна відобразити просто як
select ex3.StudentId, ex3.DisciplineId, max(ex3.Mark) from Exam ex3
 group by ex3.StudentId, ex3.DisciplineId order by 1;

--тоді це найкраща відповідь (поки що)
select st.StudentId, st.Surname+' '+st.Name+' '+st.Patronymic as [Full name], avgmarks.avg from 
(select mmfes.StudentId, round(cast(sum(mmfes.maxm) as float) /COUNT(mmfes.maxm),2) as [avg] from 
(select ex3.StudentId, ex3.DisciplineId, max(ex3.Mark) as [maxm] from Exam ex3
 group by ex3.StudentId, ex3.DisciplineId) as [mmfes] group by mmfes.StudentId) as [avgmarks],
Student st where avgmarks.StudentId = st.StudentId;

--19
select st.* from Student st, Exam ex where ex.StudentId = st.StudentId and 5 = all(select ex2.Mark from Exam ex2 where ex2.StudentId = st.StudentId);
--20
select em.* from Employee em, Duties du, Position p where 
du.DutiesId = em.DutiesId and p.PositionId = du.PositionId and
exists(select * from Exam ex where ex.EmployeeId = em.EmployeeId and 
exists(select * from Discipline d where d.DisciplineId = ex.DisciplineId and (d.Name in('математика','Фізика'))));











