--1
select * from ServiceType where ServiceTypetName = '#7bc71a';
--2
select * from Post where PostName = 'Orchidaceae';
--3
select Surname+' '+Name+' '+Patronymic as 'Full name' from Employee;
--4
select CarNumber, YearOfIssue, OwnerId from Car order by OwnerId;
--5
select * from Employee, Post;

select * from Employee cross join Post;
--6
select Car.*, CarOwner.* from Car, CarOwner; 
--7
select c.*, co.* from Car c, CarOwner co; 
--8
select Employee.Surname+' '+Employee.Name+' '+Employee.Patronymic as 'Full name', Post.PostName from Employee, Post where Post.PostId = Employee.PostId;
select e.Surname+' '+e.Name+' '+e.Patronymic as 'Full name', p.PostName from Employee e, Post p where p.PostId = e.PostId;
select Employee.Surname+' '+Employee.Name+' '+Employee.Patronymic as 'Full name', Post.PostName from Employee join Post on Post.PostId = Employee.PostId;
select e.Surname+' '+e.Name+' '+e.Patronymic as 'Full name', p.PostName from Employee e join Post p on p.PostId = e.PostId;
--9
--distinct доданий,так як в одного власника може бути дві і більше машини однакового кольру
select distinct CarOwner.Surname+' '+CarOwner.Name+' '+CarOwner.Patronymic as 'Full name', car.Color from CarOwner, Car 
where Car.OwnerId = CarOwner.OwnerId and Car.Color = 'yellow';

select distinct co.Surname+' '+co.Name+' '+co.Patronymic as 'Full name', c.Color from CarOwner co, Car c 
where c.OwnerId = co.OwnerId and c.Color = 'yellow';

select distinct CarOwner.Surname+' '+CarOwner.Name+' '+CarOwner.Patronymic as 'Full name', car.Color from CarOwner
join Car on Car.OwnerId = CarOwner.OwnerId and Car.Color = 'yellow';

select distinct co.Surname+' '+co.Name+' '+co.Patronymic as 'Full name', c.Color from CarOwner co
join Car c on c.OwnerId = co.OwnerId and c.Color = 'yellow';

--10
select distinct co.Surname+' '+co.Name+' '+co.Patronymic as 'Full name', c.CarNumber, co.DriversLicenseId, co.PhoneNumber from CarOwner co
join Car c on c.OwnerId = co.OwnerId and c.Color in( 'Pink','Teal') order by 1;

--11
select em.Surname+' '+em.Name+' '+em.Patronymic as 'Full name', p.PostName, em.Birthday, em.Premium from 
(select * from Employee where (Premium between 4500 and 5500) or (Premium is null)) em 
join Post p on p.PostId = em.PostId order by em.Surname;
--12
select co.Surname+' '+co.Name+' '+co.Patronymic as 'Full name', c.CarNumber, b.BrandName, st.ServiceTypetName, cs.Price from CarOwner co
join Car c on c.OwnerId = co.OwnerId
join Brand b on b.BrandId = c.BrandId
join CarService cs on cs.CarId = c.CarId
join ServiceType st on st.ServiceTypeId = cs.ServiceTypeId order by 1;
--13
select co.Surname+' '+co.Name+' '+co.Patronymic as 'Full name', c.CarNumber, cs.StartDate from CarOwner co
join Car c on c.OwnerId = co.OwnerId
join Brand b on b.BrandId = c.BrandId
join CarService cs on cs.CarId = c.CarId where cs.Price > 3400 and cs.StartDate between '2015-01-01' and '2015-04-01'  order by 1;
--14
select co.Surname+' '+co.Name+' '+co.Patronymic as 'Full name', c.CarNumber, b.BrandName from CarOwner co
join Car c on c.OwnerId = co.OwnerId
join Brand b on b.BrandId = c.BrandId and (b.Country not in ('Poland','China')) order by 1;
--15
select co.Surname+' '+co.Name+' '+co.Patronymic as 'Owners` full name', b.BrandName, st.ServiceTypetName, cs.Price,
em.Surname+' '+em.Name+' '+em.Patronymic as 'Employees` full name', po.PostName from CarOwner co
join Car c on c.OwnerId = co.OwnerId
join Brand b on b.BrandId = c.BrandId
join CarService cs on cs.CarId = c.CarId
join ServiceType st on st.ServiceTypeId = cs.ServiceTypeId 
join Employee em on em.EmployeeId = cs.EmployeeId
join Post po on po.PostId = em.PostId order by b.BrandName;
--16
select b.BrandName, COUNT(c.CarId) from Car c join Brand b on c.BrandId = b.BrandId group by b.BrandName;
--17
select b.BrandName, COUNT(c.CarId) from Car c 
join Brand b on c.BrandId = b.BrandId 
join CarService cs on cs.CarId = c.CarId and cs.Price > 6000 group by b.BrandName;
--18
--DriverLicense замінена на PhoneNumber для наглядності
select co.Surname+' '+co.Name+' '+co.Patronymic as 'Owners` full name', b.BrandName, 
em.Surname+' '+em.Name+' '+em.Patronymic as 'Employees` full name', COUNT(cs.CarId) from 
(Select * from CarOwner where PhoneNumber like '%866%')co
join Car c on c.OwnerId = co.OwnerId join Brand b on b.BrandId = c.BrandId
join CarService cs on cs.CarId = c.CarId join ServiceType st on st.ServiceTypeId = cs.ServiceTypeId  
join Employee em on em.EmployeeId = cs.EmployeeId 
group by co.Surname, co.Name, co.Patronymic, b.BrandName, em.Surname, em.Name, em.Patronymic;

--19
select em.Surname+' '+em.Name+' '+em.Patronymic as 'Employees` full name', cs.Price, st.ServiceTypetName from Employee em
join CarService cs on cs.EmployeeId = em.EmployeeId and (day(cs.StartDate) between 1 and 7) and (MONTH(cs.StartDate) = 4)
join ServiceType st on st.ServiceTypeId = cs.ServiceTypeId order by  em.Surname, st.ServiceTypetName;

--20
select b.BrandName, c.Color from Brand b
left join Car c on c.BrandId = b.BrandId ;

--21
select p.PostName, e.Surname+' '+e.Name+' '+e.Patronymic as 'Employees` full name' from Post p
left join Employee e on e.PostId = p.PostId;











