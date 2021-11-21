CREATE TABLE [dbo].[CAR] (
    [ID]     INT        NOT NULL,
    [NUMBER] NCHAR (20) NOT NULL,
    [COLOR]  NCHAR (20) NULL,
    [AGE]    INT        DEFAULT ((1)) NOT NULL,
    [SUMM]   INT        DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE [dbo].[EMPLOYEE] (
    [ID]     INT        NOT NULL,
    [NAME]   NCHAR (20) NOT NULL,
    [WAGE]   INT        DEFAULT ((14000)) NOT NULL,
    [SALARY] INT        DEFAULT ((14000)) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC)
);

CREATE TABLE [dbo].[SERVICE] (
    [ID]          INT NOT NULL,
    [CAR_ID]      INT NOT NULL,
    [EMPLOYEE_ID] INT DEFAULT ((1)) NOT NULL,
    [PRISE]       INT DEFAULT ((0)) NOT NULL,
    PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [SERVICE_EMPLOYEE_FK] FOREIGN KEY ([EMPLOYEE_ID]) REFERENCES [dbo].[EMPLOYEE] ([ID]),
    CONSTRAINT [SERVICE_CAR_FK] FOREIGN KEY ([CAR_ID]) REFERENCES [dbo].[CAR] ([ID])
);


GO

CREATE TRIGGER [dbo].[INSERT_SERVICE]
    ON [dbo].[SERVICE]
    FOR INSERT
    AS
    BEGIN
	   UPDATE CAR SET SUMM = SUMM +
	   (SELECT PRISE FROM inserted)
	   WHERE ID = (SELECT CAR_ID FROM inserted);
	   UPDATE EMPLOYEE SET SALARY = SALARY +
	   (SELECT PRISE FROM inserted)
	   WHERE ID = (SELECT EMPLOYEE_ID FROM inserted);
    END
GO

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


insert into [dbo].[EMPLOYEE] values 
(1,'Vasya',15000,15000),
(2,'Vanya',17000,17000)


insert into [dbo].[CAR] values (1,'aa1111aa','black',2,1250);

delete [dbo].[SERVICE]

insert into [dbo].[SERVICE] values
(1,1,1,200)
insert into [dbo].[SERVICE] values
(2,1,1,300)
insert into [dbo].[SERVICE] values
(3,1,2,250)
insert into [dbo].[SERVICE] values
(4,1,2,500)

select * from [dbo].[SERVICE]

select * from [dbo].[EMPLOYEE] 