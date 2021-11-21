use Lab1ClassWork;

--1
select * from Discipline;
select * from StudyGroup;
select * from Position;
--2
select distinct Surname +' '+ Name +' '+ Patronymic as "���", Oklad from Employee;
--3
select DateExam, Mark, StudentId, EmployeeId from Exam;

--4
select Surname +' '+ Name +' '+ Patronymic as "���", Stipendia, RecordBook 
from Student where Stipendia < 300;
--5
select Surname +' '+ Name +' '+ Patronymic as "���", Stipendia, RecordBook, BirthdayCity 
from Student where Stipendia > 500 and BirthdayCity = '���';
--6
select Surname +' '+ Name +' '+ Patronymic as "���", RecordBook, BirthdayCity 
from Student where BirthdayCity != '���';
--7
select Surname +' '+ Name +' '+ Patronymic as "���", RecordBook, BirthdayCity 
from Student where BirthdayCity = '���' or BirthdayCity like '���%';
--8
select Surname +' '+ Name +' '+ Patronymic as "���", Stipendia, RecordBook, BirthdayCity 
from Student where (Stipendia = 300 and BirthdayCity = '���') or BirthdayCity = '�������';

--9
select Surname +' '+ Name +' '+ Patronymic as "���", Birthday, RecordBook
from Student where Birthday between '1989-01-01' and '1990-12-31' ;
--10
select Surname +' '+ Name +' '+ Patronymic as "���", Birthday, RecordBook, Stipendia
from Student where Birthday between '1989-01-01' and '1990-12-31' and Stipendia >= 600;
--11
select Surname +' '+ Name +' '+ Patronymic as "���", Birthday, RecordBook
from Student where Birthday not between '1989-01-01' and '1990-12-31';
 
 --12
select * from Exam where DisciplineId IN(2,3) and EmployeeId in(1,8);
--12.1
select Surname +' '+ Name +' '+ Patronymic as "���", Stipendia, RecordBook, BirthdayCity
from Student where Stipendia = 300 and (BirthdayCity = '���' or BirthdayCity = '�������')
 
--13
select * from Employee where Surname like '���%';
--14
select * from Employee where year(Birthday) = 1966;
select * from Employee where Birthday like '1966%';
--15
select * from Employee where month(Birthday) = 5; 
select * from Employee where Birthday like '____-05-__';
--16
select * from Employee where Birthday like '%05%';
--17
select * from Employee where month(Birthday) = 5 and Nadbavka >= 500; 
select * from Employee where Birthday like '%%%%-05-%%' and Nadbavka >= 500;

--18
select * from Student where Patronymic is NOT NULL and not Stipendia = 500; 
--19
select * from Student where Patronymic is NULL; 
--20
select Surname +' '+ Name +' '+ Patronymic as "���", EmployeeId
from Employee where DutiesId in (select DutiesId from Duties where PositionId 
in (select PositionId from Position where Name like '��������'));

--select e.Surname +' '+ e.Name +' '+ e.Patronymic as "���", d.DutiesId from Employee e 
--Join Duties d on d.DutiesId = e.DutiesId;

--23
select distinct Surname +' '+ Name +' '+ Patronymic as "���"
from Employee order by "���" ASC;--DESC
--24
select distinct Stipendia from Student order by 1;

--25
select COUNT(*) as 'count' from Student;
--26
select COUNT(distinct Surname + Name + Patronymic) as 'count' from Student;
--27.1
select COUNT(distinct Name) as 'count' from Student;
--27.2
select COUNT(distinct Name + Surname) as 'count' from Student;
--27.3
select COUNT(distinct Patronymic) as 'count' from Student;
--28
select COUNT(*) as 'count' from Student where Stipendia = 300;
--29
select COUNT(*) as 'count', MIN(Oklad) as 'min', AVG(Oklad) as 'avg',
MAX(Oklad) as 'max' from Employee;

--29.1
select DutiesId ,COUNT(*) as 'count', MIN(Oklad) as 'min', AVG(Oklad) as 'avg',
MAX(Oklad) as 'max' from Employee group by DutiesId order by 1;
--30
select DutiesId ,COUNT(*) as 'count', MIN(Oklad) as 'min', AVG(Oklad) as 'avg',
MAX(Oklad) as 'max' from Employee e group by DutiesId having AVG(Oklad) > 3000  order by 1 ;

--31
select DutiesId ,COUNT(*) as 'count', MIN(Oklad) as 'min', AVG(Oklad) as 'avg',
MAX(Oklad) as 'max' from Employee where DutiesId in (select DutiesId from Duties where PositionId 
not in (select PositionId from Position where Name like '��������')) group by DutiesId order by 1;

--32
select count(distinct Surname) from Student;
--33
select count(Surname) from Student where surname like '�%';
--34
select distinct DutiesId from Employee where (Oklad + Nadbavka) > 5000;

select DutiesId from Employee group by DutiesId 
having AVG(Oklad) + AVG(Nadbavka) > 5000  order by 1 ;

--35
select BirthdayCity as '̳���' ,Count(*) as 'ʳ������ ����������' 
from Employee group by BirthdayCity order by 1;

select BirthdayCity as '̳���' ,
Count(distinct Surname + Name + Patronymic) as 'ʳ������ ����������' 
from Employee group by BirthdayCity order by 1;
--select * from Employee where BirthdayCity = '���';

--36
select Mark as '������', COUNT(distinct StudentId) as 'ʳ������ ��������', 
count(distinct DisciplineId)as 'ʳ������ ��������' 
from Exam group by Mark order by 1;
--select Mark, StudentId, DisciplineId from Exam  order by 1,2;

--37
select DisciplineId as '����� �������', 
COUNT(StudentId) as 'ʳ������ ��������' 
from Exam where Mark > 2 group by DisciplineId order by 1;

--38
select DisciplineId as '����� �������', 
COUNT(StudentId) as 'ʳ������ ��������' 
from Exam where Mark = 5 group by DisciplineId order by 1;

--39
select DateExam as '����', 
COUNT(*) as 'ʳ������ �������� � ��� ����' 
from Exam  group by DateExam order by 1;

--40
select DateExam as '����', COUNT(*) as 'ʳ������ �������� � ��� ����' 
from Exam  group by DateExam having COUNT(*) > 5 order by 1;

--41
--������� �� �������
select StudentId from Student where Stipendia <= 500 and BirthdayCity = '���';
--� ��� �� ������ ������, �����, ���� �� ���� ��
select Mark as '������', COUNT(*) as 'ʳ������ �������� � ������䳺� <= 500'
from Exam where StudentId in 
(select StudentId from Student where Stipendia <= 500 and BirthdayCity = '���') 
group by Mark order by 1;


--������������:

--42
--e.Surname +' '+ e.Name +' '+ e.Patronymic as "���", e.Birthday, 
--e.Oklad, e.Nadbavka p.Name from Employee e inner joint where e.Birthday between '1945-01-01' and '1965-12-31' 
--and (e.Oklad + e.Nadbavka) >= 5000;

select e.Surname +' '+ e.Name +' '+ e.Patronymic as "���", e.Birthday, e.Oklad, e.Nadbavka, p.Name
from Employee e join Position p on e.DutiesId in 
(select d.DutiesId from Duties d where d.PositionId not in (select PositionId from Position));

--select e.Surname +' '+ e.Name +' '+ e.Patronymic as "���", e.Birthday, 
--e.Oklad, e.Nadbavka p.Name from Employee e inner join Position p on e.DutiesId in 
--(select DutiesId from Duties where PositionId not in (select PositionId from Position)

select Surname +' '+ Name +' '+ Patronymic as "���", EmployeeId
from Employee where DutiesId in (select DutiesId from Duties where PositionId 
in (select PositionId from Position where Name like '��������'));

--43
select BirthdayCity, AVG(Oklad) from Employee 
where Birthday between '1945-01-01' and '1965-12-31' group by BirthdayCity
--44
select COUNT(Patronymic) as 'count' from Employee;
select COUNT(distinct Patronymic) as 'count' from Employee;
select COUNT(*) as 'count' from Employee where Patronymic is NULL;
--45
select avg(Oklad) from Employee;
select Sum(Oklad)/COUNT(Oklad) from Employee;
--46
select min(Oklad) as 'min', MAX(Oklad) as 'max', min(Oklad)*100 as 'min*100', 
max(Oklad)*100 as 'max*100'  from Employee;
--47
select StudentId, avg(Mark) as 'avg' from Exam group by StudentId having avg(Mark)>3;
--48
select Surname +' '+ Name +' '+ Patronymic as "���", sum(Oklad+Nadbavka) as 'Vyplata' 
from Employee where Oklad+Nadbavka > 4300 group by Surname +' '+ Name +' '+ Patronymic;
--49
--50
select Surname +' '+ Name +' '+ Patronymic as "���", BirthdayCity 
from Employee where exist (select sum(Oklad+Nadbavka) 
from Employee where Oklad+Nadbavka > 4300 group by Surname +' '+ Name +' '+ Patronymic;)
--Oklad+Nadbavka > 4300 group by Surname +' '+ Name +' '+ Patronymic;




































