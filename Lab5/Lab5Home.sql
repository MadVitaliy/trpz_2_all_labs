--1
select co.Surname, co.Name, co.Patronymic, co.Birthday, co.BirthdayPlace from CarOwner co
union all
select em.Surname, em.Name, em.Patronymic, em.Birthday, em.BirthdayPlace from Employee em

--2
select co.Surname, co.Name, co.Patronymic, co.Birthday, co.BirthdayPlace from CarOwner co
union
select em.Surname, em.Name, em.Patronymic, em.Birthday, em.BirthdayPlace from Employee em

--3
select em.BirthdayPlace from Employee em
except
select co.BirthdayPlace from CarOwner co

--4
select em.BirthdayPlace from Employee em
intersect
select co.BirthdayPlace from CarOwner co

--5
select em.* from Employee em, CarService cs, Car c
where cs.EmployeeId = em.EmployeeId and c.CarId = cs.CarId and c.Color in ('Orange','Puce')

-----------------------------------------------------------------------------------------
--6
CREATE DATABASE zkMyCopy;
use zkMyCopy;
--коп≥юЇмо вс≥ дан≥ в нову таблицю, таблиц€ створюЇтьс€ автоматична
select * into ServiceTypeCopyA from Lab1HomeWork.dbo.ServiceType s;
select * from ServiceTypeCopyA;
--коп≥юЇмо вс≥ дан≥ в нову таблицю + пуста колонка, таблиц€ створюЇтьс€ автоматична
select *, null as Abbreviation into SubdivisionCopyB from Lab1HomeWork.dbo.ServiceType s;
select * from SubdivisionCopyB;
--коп≥юЇмо лише структуру, таблиц€ створюЇтьс€ автоматична
select * into SubdivisionCopyC from Lab1HomeWork.dbo.ServiceType s where 1 = 2;
select * from SubdivisionCopyC;

--7
insert into SubdivisionCopyC select * from Lab1HomeWork.dbo.ServiceType s where s.ServiceTypeId > 7;
--8
use zkMyCopy;
select * into BrandCopy from Lab1HomeWork.dbo.Brand b where b.BrandId > 3 and b.BrandId < 6;
select * from BrandCopy;

--9
use Lab1HomeWork;
select * into zkMyCopy.dbo.CarCopy from Car where YearOfIssue = 1950;
select * from zkMyCopy.dbo.CarCopy

--10
use Lab1HomeWork;

Select * into zkMyCopy.dbo.BrandCopyNew from Brand;
select * from zkMyCopy.dbo.BrandCopyNew
----------------------------------------------------------

--11
select * from Car c where c.OwnerId in (select co.OwnerId from CarOwner co where co.Surname = 'Parchment');

update Car set CarNumber = 'јј1233ј¬' from
(select * from Car c where c.OwnerId in (select co.OwnerId from CarOwner co where co.Surname = 'Parchment'))
as Selected where Car.CarId = Selected.CarId;

--12
select * from CarOwner where OwnerId between 7 and 14;
update CarOwner set BirthdayPlace = 'ѕрага' where OwnerId between 7 and 14;

--13
select * from Employee em where em.PostId in (select p.PostId from Post p where p.PostName in ('Asteraceae','Poaceae'));

update Employee set Salery = Selected.Salery * 1.25 from
(select * from Employee em where em.PostId in (select p.PostId from Post p where p.PostName in ('Asteraceae','Poaceae')))
as Selected where Employee.EmployeeId = Selected.EmployeeId; 

--14
select * from Employee e where e.Salery = (select min(e2.Salery) from Employee e2);

update Employee set Salery = selected.Salery + 0.7 from
(select * from Employee e where e.Salery = (select min(e2.Salery) from Employee e2)) as selected
where Employee.EmployeeId = selected.EmployeeId;

--15
select * from Employee e where e.Salery = (select max(e2.Salery) from Employee e2);

update Employee set Salery = selected.Salery * 2 from
(select * from Employee e where e.Salery = (select max(e2.Salery) from Employee e2)) as selected
where Employee.EmployeeId = selected.EmployeeId;

--16

select top 20 * from Car;
alter table Car add Model varchar(15) not null default 'X3';

select * from Car c where c.BrandId in (select b.BrandId from Brand b where b.BrandName = 'BMW');

update Car set Model = 'Q50' from
(select * from Car c where c.BrandId in (select b.BrandId from Brand b where b.BrandName = 'BMW')) as Selected
where Car.CarId = Selected.CarId;
update Car set Model = 'Q50' where CarId in( select c.CarId from Car c where c.BrandId in (select b.BrandId from Brand b where b.BrandName = 'BMW'))

--17
select * from CarService where CarId <20 order by CarId;
delete CarService where CarId > 7 and CarId < 15;

--18
select * from CarService cs where cs.CarId in (select c.CarId from Car c where c.Color = 'Indigo');

delete CarService from
(select * from CarService cs where cs.CarId in (select c.CarId from Car c where c.Color = 'Indigo')) as Selected
where CarService.CarServiceId = Selected.CarServiceId;

--19
select * from CarService cs where cs.CarId > 4 and cs.CarId < 7;

delete Car where CarId > 4 and CarId < 7;

