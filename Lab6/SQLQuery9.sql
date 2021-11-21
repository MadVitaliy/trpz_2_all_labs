INSERT INTO PROVIDER(name) values('Yamaha');
INSERT INTO PROVIDER(name) values('Cort');

SELECT*FROM PROVIDER;

INSERT INTO INSTRUMENT(name, price, providerID) values('F310',3650,1);
INSERT INTO INSTRUMENT(name, price, providerID) values('Arius ydp-144',27800,1);
INSERT INTO INSTRUMENT(name, price, providerID) values('AC100 SG',2600,3);
INSERT INTO INSTRUMENT(name, price, providerID) values('CM150B',6600,3);

SELECT*FROM INSTRUMENT;

INSERT INTO BILL(instrumentID,amount) values(1,5);
INSERT INTO BILL(instrumentID,amount) values(6,3);
INSERT INTO BILL(instrumentID,amount) values(2,1);
INSERT INTO BILL(instrumentID,amount) values(5,2);
delete bill;

SELECT*FROM BILL;


