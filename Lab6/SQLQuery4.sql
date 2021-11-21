Insert into ORDERS(orderID) values(1);
Insert into ORDERS(orderID) values(2);
Insert into ORDERS(orderID) values(3);

insert into ORDERLINES(ordeLineID,orderID,price,quantity) values(1,1,5,10);
insert into ORDERLINES(ordeLineID,orderID,price,quantity) values(2,1,3,10);
insert into ORDERLINES(ordeLineID,orderID,price,quantity) values(3,3,2,20);
insert into ORDERLINES(ordeLineID,orderID,price,quantity) values(4,2,3,20);

delete ORDERLINES WHERE ordeLineID = 1;

delete ORDERS;

select*from ORDERLINES;

select*from ORDERS;

select sum(p.total) from ORDERLINES p group by p.orderID;


drop TRIGGER [dbo].[Trigger_ORDERLINES];

GO
CREATE TRIGGER [dbo].[Trigger_ORDERLINES]
    ON [dbo].[ORDERLINES]
	
    FOR DELETE, INSERT, UPDATE
    AS
    BEGIN
	
     UPDATE ORDERS  SET ORDERS.amount = (sum(ORDERLINES.total) group by )
	 where (select)
    END

















