--1
select * from Brand;
select * from CarOwner;
select * from Post;
--2
select distinct Surname +' '+ Name +' '+ Patronymic as 'Ô²Ï' from Employee;

--3
select distinct Surname +' '+ Name +' '+ Patronymic as 'Ô²Ï', Salery, EmployeeId 
from Employee where Premium < 2000;

--4
select distinct Surname +' '+ Name +' '+ Patronymic as 'Ô²Ï', PhoneNumber, OwnerId
from CarOwner where PhoneNumber like '050%' and not BirthdayPlace like 'Êè¿â';

--5
select distinct Surname +' '+ Name +' '+ Patronymic as 'Ô²Ï', 
Salery, EmployeeId, BirthdayPlace
from Employee where (Premium = 3000 and BirthdayPlace like 'Êè¿â') or BirthdayPlace like '×åðêàñè';

--6
select distinct Surname +' '+ Name +' '+ Patronymic as 'Ô²Ï', 
Salery, EmployeeId, BirthdayPlace
from Employee where Premium = 5000 and (BirthdayPlace like 'Êè¿â' or BirthdayPlace like '×åðêàñè');

--7
select distinct Surname +' '+ Name +' '+ Patronymic as 'Ô²Ï', Birthday,  OwnerId
from CarOwner where Birthday between '1989-01-01' and '1990-12-31';

--8
select * from Car where OwnerId in (1,4,3) or BrandId in (1,3,5);

--9
select * from Employee where Surname like 'Wi%'

--10
select * from Employee where year(Birthday) = 1985;
select * from Employee where Birthday like '1985%';

--11
select * from Employee where Surname is NOT NULL and Premium != 800;

--12
select * from Employee where Surname is NULL;

--13
select Color, CarNumber from Car order by 1 desc, 2 desc;

--14
select count(*) from Car;

--15
select count(Name) as 'Name' from CarOwner;
select count(distinct Name) as 'Name' from CarOwner;

--16
select count(Surname) as 'Surname' from CarOwner;
select count(distinct Surname) as 'Surname' from CarOwner;

--17
select COUNT(*) as 'Count', MIN(Salery) as 'Min salary',
MAX(Salery) as 'Max salary', AVG(Salery) as 'Avg salery' from Employee;

--18
select p.PostName, COUNT(*) as 'Count', MIN(Salery) as 'Min salary',
MAX(Salery) as 'Max salary', AVG(Salery) as 'Avg salery' 
from Employee e join Post p on e.PostId = p.PostId group by p.PostName;

--19
select count(distinct Surname) as 'Surname' from CarOwner;

--20
select count(Surname) as 'Surname' from CarOwner where Surname like 'K%';

--21
select BirthdayPlace, count(*) as 'Count of employee' from Employee 
group by BirthdayPlace order by 1;

--22
select Price, COUNT(CarId) as 'Cars were repaired', 
COUNT(ServiceTypeId) as 'Count of service type' from CarService group by Price;

--23
select t.ServiceTypetName, COUNT(CarId) as 'Count of cars had this type of repair' 
from CarService s join ServiceType t on s.ServiceTypeId = t.ServiceTypeId where s.Price > 9000 group by t.ServiceTypetName
order by 1;

--24
select StartDate, COUNT(CarId) as 'Count of cars' from CarService group by StartDate order by 1;

--25
select StartDate, COUNT(ServiceTypeId) as 'Count of cars' from CarService 
group by StartDate having COUNT(ServiceTypeId)>5 order by 1;

--26
select BirthdayPlace, AVG(payout) as 'AVG payout' from Employee 
where Birthday between '1975-01-01 ' and '1995-12-31' group by BirthdayPlace;

--27
select count(Patronymic) as 'Count of patronymic' from CarOwner;

select count(distinct Patronymic) as 'Count of patronymic' from CarOwner;

select count(*) as 'Count of patronymic' from CarOwner where Patronymic is NULL;

--28
select CarId from CarService group by CarId having avg(Price) > 7000;

--29
select PostId, AVG(payout) 'avg payout' from Employee where payout >25000 group by PostId;










