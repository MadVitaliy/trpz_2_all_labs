CREATE DATABASE Lab7_2;

CREATE TABLE Bill
(
	BillId int Identity NOT NULL, 
	TableNumber int NOT NULL default(0), 
	Datez date NUll,
	Total int NOT NULL default(0),
	CONSTRAINT PK_BillId PRIMARY KEY (BillId)
)

CREATE TABLE Dish
(
	DishId int Identity NOT NULL, 
	DishName varchar(20) NOT NULL, 
	Price int NOT NULL default(0)
	CONSTRAINT PK_DishId PRIMARY KEY (DishId)
)

CREATE TABLE Orders
(
	OrdersId int Identity NOT NULL, 
	BillId int NOT NULL, 
	DishId int NULL,
	OCount int NOT NULL default(1),
	Total int NOT NULL default(0),

	CONSTRAINT PK_OrdersId PRIMARY KEY (OrdersId),
	CONSTRAINT FK_Orders_Bill FOREIGN KEY (BillId) REFERENCES Bill (BillId)
		ON DELETE CASCADE
		ON UPDATE CASCADE,
	CONSTRAINT FK_Orders_Dish FOREIGN KEY (DishId) REFERENCES Dish (DishId)
		ON DELETE CASCADE
		ON UPDATE CASCADE
)

CREATE TRIGGER INSERT_ORDERS
    ON ORDERS
    AFTER INSERT
    AS
    BEGIN
	   UPDATE Orders SET Total =  (select OCount from inserted)*
	   (Select Price from Dish where DishId = (select DishId from inserted)) 
	   where OrdersId = (select OrdersId from inserted);
	   
	   UPDATE Bill SET Total = Total + (select Total from Orders) 
	   where BillId = (select BillId from inserted);
    END


	CREATE TRIGGER [dbo].[DELETE_SERVICE]
    ON [dbo].[SERVICE]
    FOR DELETE
    AS
    BEGIN
        UPDATE CAR SET SUMM = SUMM -
	   (SELECT PRISE FROM inserted)
	   WHERE ID = (SELECT CAR_ID FROM inserted);
	   UPDATE EMPLOYEE SET SALARY = SALARY -
	   (SELECT PRISE FROM inserted)
	   WHERE ID = (SELECT EMPLOYEE_ID FROM inserted);
    END

	insert into dish values
	('meeat',100),
	('fish',100),
	('salad',30),
	('pasta',40),
	('pain',0)

	insert into Bill(TableNumber, Datez) values 
	(2, '2020-10-25')

	insert into Orders(BillId, DishId, Ocount) values 
	(1,1,2),
	(1,3,4),
	(2,4,2)

	select * from Orders;
	select * from Bill;
	select * from Dish;
	
	select * from dbo.Service;