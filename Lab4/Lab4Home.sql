--1
select distinct * from Employee e where exists(select * from CarService cs where cs.EmployeeId = e.EmployeeId) order by 2,3;
--2
select distinct * from Employee e where not exists(select * from CarService cs where cs.EmployeeId = e.EmployeeId) order by 2,3;
--3
select distinct * from ServiceType st where not exists(select * from CarService cs where cs.ServiceTypeId = st.ServiceTypeId) order by 2;
--4
select distinct p.PostId ,p.PostName from Post p, Employee e where p.PostId = e.PostId 
and exists(select * from CarService cs where cs.EmployeeId = e.EmployeeId) order by 2;
--5
select distinct * from Car c where not exists(select * from CarService cs where cs.CarId = c.CarId) order by 2;
--6
select co.Surname+' '+co.Name+' '+co.Patronymic as [Full name], c.CarNumber, c.YearOfIssue from CarOwner co, Car c 
where c.OwnerId = co.OwnerId and exists(select * from CarService cs where cs.CarId = c.CarId and cs.Price = 1500)

select distinct co.Surname+' '+co.Name+' '+co.Patronymic as [Full name], c.CarNumber, c.YearOfIssue from CarOwner co, Car c 
where c.OwnerId = co.OwnerId and exists(select * from CarService cs where cs.CarId = c.CarId and cs.Price between 1500 and 2000) order by [Full name]

--7
select st.ServiceTypeId from ServiceType st where st.ServiceTypetName = '#060306';

select cs.EmployeeId from CarService cs where cs.ServiceTypeId in (select st.ServiceTypeId from ServiceType st where st.ServiceTypetName = '#060306');

select em.Surname+' '+em.Name+' '+em.Patronymic as [Full name], p.PostName from Employee em, Post p 
where em.EmployeeId in (select cs.EmployeeId from CarService cs where cs.ServiceTypeId in 
(select st.ServiceTypeId from ServiceType st where st.ServiceTypetName = '#060306')) 
 and p.PostId = em.PostId order by [Full name];

 select em.Surname+' '+em.Name+' '+em.Patronymic as [Full name], p.PostName from Employee em, Post p 
where exists(select * from CarService cs where cs.EmployeeId = em.EmployeeId and exists 
(select * from ServiceType st where st.ServiceTypeId = cs.ServiceTypeId and st.ServiceTypetName = '#060306')) 
 and p.PostId = em.PostId order by [Full name];
--8
select em.Surname+' '+em.Name+' '+em.Patronymic as [Full name], em.Salery, em.Premium, em.PhoneNumber, 
(select p.PostName from Post p where p.PostId = em.PostId) from Employee em where 
em.Salery > (select AVG(em2.Salery) from Employee em2) and em.Premium >= 2000;

--9
select c.CarNumber, (select co.Surname+' '+co.Name+' '+co.Patronymic from CarOwner co where co.OwnerId = c.OwnerId),
c.YearOfIssue, cs.Price from Car c, CarService cs where cs.CarId = c.CarId 
and cs.Price >= (select AVG(cs2.Price) from CarService cs2);

--10
select c.CarNumber, avg(cs.Price) from Car c, CarService cs where cs.CarId = c.CarId group by c.CarNumber
having avg(cs.Price) > (select AVG(cs2.Price) from CarService cs2);

--11
select * from Employee em where em.BirthdayPlace = (select em2.BirthdayPlace from Employee em2 where em2.EmployeeId = 1);

--12
select em.PostId from Employee em where em.Name = 'Eve';

select * from Employee em2 where em2.PostId in (select em.PostId from Employee em where em.Name = 'Eve') 
and em2.Salery >= (select avg(em3.Salery) from Employee em3); 

--13
--визначаем ід власника
select co.OwnerId from CarOwner co where co.Name = 'Camala' and co.Surname = 'Winny';
--якого кольору він має автомобілі
select c.Color from Car c where c.OwnerId = (select co.OwnerId from CarOwner co where co.Name = 'Camala' and co.Surname = 'Winny');
--визначаем всі ід машин з такими кольорами
select c2.CarId from Car c2 where c2.Color in (select c.Color from Car c where c.OwnerId = 
(select co.OwnerId from CarOwner co where co.Name = 'Camala' and co.Surname = 'Winny'))
--визначаем всіх власників цих автомобілів
select distinct * from CarOwner co2 where co2.OwnerId in  (select c2.CarId from Car c2 where c2.Color in (select c.Color from Car c where c.OwnerId = 
(select co.OwnerId from CarOwner co where co.Name = 'Camala' and co.Surname = 'Winny')));

--14
select count(e.EmployeeId), e.PostId from Employee e group by e.PostId having sum(e.EmployeeId) >3;

select count(pmtt.PostId) from (select count(e.EmployeeId) as [count], e.PostId from Employee e group by e.PostId having sum(e.EmployeeId) >3) as [pmtt];
--15
select count(c.CarId), c.OwnerId from Car c group by c.OwnerId having count(c.CarId) >2 

select count(cnpo.OwnerId) from (select count(c.CarId) as [count], c.OwnerId from Car c group by c.OwnerId having count(c.CarId) >2 ) as[cnpo];

--16
select cs.CarId, cs.ServiceTypeId, count(cs.ServiceTypeId) from CarService cs group by cs.CarId, cs.ServiceTypeId order by 1

select cs.CarId, cs.ServiceTypeId, count(cs.ServiceTypeId) from CarService cs group by cs.CarId, cs.ServiceTypeId 
having  count(cs.ServiceTypeId) > 1 order by 1;
select cs.CarId, cs.ServiceTypeId from CarService cs group by cs.CarId, cs.ServiceTypeId 
having  count(cs.ServiceTypeId) > 1 order by 1;

select c.OwnerId, c.CarId, cwmts.ServiceTypeId from 
(select cs.CarId, cs.ServiceTypeId from CarService cs group by cs.CarId, cs.ServiceTypeId 
having  count(cs.ServiceTypeId) > 1) as [cwmts],
Car c where cwmts.CarId = c.CarId order by 2;
-- виводить скільки автомобілів мали однаковий сервіс більше одного разу
select c.OwnerId, count(c.CarId) from 
(select cs.CarId, cs.ServiceTypeId from CarService cs group by cs.CarId, cs.ServiceTypeId 
having  count(cs.ServiceTypeId) > 1) as [cwmts],
Car c where cwmts.CarId = c.CarId group by c.OwnerId order by 2;

--17
select avg(cs.Price), c.BrandId from CarService cs, Car c where cs.CarId = c.CarId group by c.BrandId;

select avg(cs2.Price), cs2.CarId  from CarService cs2 group by cs2.CarId;

select c3.CarId, c3.CarNumber, avpc.avgpc, avpg.avgpg from 
(select avg(cs.Price) as [avgpg], c.BrandId from CarService cs, Car c where cs.CarId = c.CarId group by c.BrandId) as [avpg],
(select avg(cs2.Price) as [avgpc], cs2.CarId  from CarService cs2 group by cs2.CarId) as [avpc],
Car c3 where c3.BrandId = avpg.BrandId and c3.CarId = avpc.CarId;

select c3.CarId, c3.CarNumber, avpc.avgpc, avpg.avgpg, br.BrandName,br.Country from 
(select avg(cs.Price) as [avgpg], c.BrandId from CarService cs, Car c where cs.CarId = c.CarId group by c.BrandId) as [avpg],
(select avg(cs2.Price) as [avgpc], cs2.CarId  from CarService cs2 group by cs2.CarId) as [avpc],
(select b2.BrandId, b2.BrandName, b2.Country from Brand b2) as [br],
Car c3 where c3.BrandId = avpg.BrandId and c3.CarId = avpc.CarId and br.BrandId = avpg.BrandId;

select c3.CarId, c3.CarNumber, avpc.avgpc, avpg.avgpg, br.BrandName,br.Country from 
(select avg(cs.Price) as [avgpg], c.BrandId from CarService cs, Car c where cs.CarId = c.CarId group by c.BrandId) as [avpg],
(select avg(cs2.Price) as [avgpc], cs2.CarId  from CarService cs2 group by cs2.CarId) as [avpc],
(select b2.BrandId, b2.BrandName, b2.Country from Brand b2) as [br],
Car c3 where c3.BrandId = avpg.BrandId and c3.CarId = avpc.CarId and br.BrandId = avpg.BrandId and avpc.avgpc >= avpg.avgpg;

--18
select max(cs.Price), cs.CarId, cs.ServiceTypeId from CarService cs group by cs.CarId, cs.ServiceTypeId order by 2;

select mppc.CarId, sum(mppc.maxp)/count(mppc.maxp) from (select max(cs.Price) as [maxp], cs.CarId, cs.ServiceTypeId from 
CarService cs group by cs.CarId, cs.ServiceTypeId) as [mppc] group by mppc.CarId

select c.CarId ,afmpc.avgfm as [avg price], c.CarNumber from 
(select mppc.CarId, sum(mppc.maxp)/count(mppc.maxp) as[avgfm] from (select max(cs.Price) as [maxp], cs.CarId, cs.ServiceTypeId from 
CarService cs group by cs.CarId, cs.ServiceTypeId) as [mppc] group by mppc.CarId) as [afmpc],
Car c where c.CarId = afmpc.CarId;

select c.CarId ,afmpc.avgfm as [avg price], c.CarNumber from 
(select mppc.CarId, round(cast(sum(mppc.maxp)/count(mppc.maxp) as float), 2) as[avgfm] from (select max(cs.Price) as [maxp], cs.CarId, cs.ServiceTypeId from 
CarService cs group by cs.CarId, cs.ServiceTypeId) as [mppc] group by mppc.CarId) as [afmpc],
Car c where c.CarId = afmpc.CarId;

--19
select em.EmployeeId from Employee em where em.Name = 'Dalton' and em.Surname = 'Stops';

select cs.CarId, cs.EmployeeId from CarService cs  order by 1;

select c.CarId from (select cs.CarId, cs.EmployeeId from CarService cs) as [caeid], Car c where
c.CarId = caeid.CarId where  order by 1
--20
select st.ServiceTypeId from ServiceType st where st.ServiceTypetName in ('#5103f4','#bc8d0a');
select * from Employee em where exists(Select * from CarService cs1 where cs1.EmployeeId = em.EmployeeId and cs1.ServiceTypeId 
in(select st.ServiceTypeId from ServiceType st where st.ServiceTypetName = '#5103f4')) and
exists(Select * from CarService cs2 where cs2.EmployeeId = em.EmployeeId and cs2.ServiceTypeId 
in(select st2.ServiceTypeId from ServiceType st2 where st2.ServiceTypetName = '#bc8d0a'));
