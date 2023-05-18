create database School
use School
CREATE TABLE JSON_DATA (
	[API] [varchar](1000) NULL,
	[Description] [varchar](4000) NULL,
	[Auth] [varchar](1000) NULL,
	[HTTPS] [bit] NULL,
	[Cors] [varchar](1000) NULL,
	[Link] [varchar](1000) NULL,
	[Category] [varchar](1000) NULL
) ON [PRIMARY]
GO

select * from JSON_DATA
truncate table JSON_DATA

create table EMPLOYEE_Q2(
	ID int ,
	name varchar(50),
	email varchar(255),
	city varchar(50),
	Update_Date date,
)

drop table EMPLOYEE_Q2_DW
create table EMPLOYEE_Q2_DW(
	fact_id int primary key identity(1,1),
	ID int ,
	name varchar(50),
	current_email varchar(255),
	historical_email varchar(255),
	current_city varchar(50),
	historical_city varchar(50) ,
	start_data date,
	end_date date,
	active_falg bit,
)

create table EMPLOYEE_Q3(
	ID int ,
	name varchar(50),
	city varchar(50),
	email varchar(255),
	Schedule_Date date,
)
truncate table EMPLOYEE_Q3
INSERT INTO EMPLOYEE_Q3 (ID, name, city, email, Schedule_Date)
VALUES
  (1001, 'Ahmed', 'Cairo', 'ahmed@mail.com', '2023-05-21'),
  (1002, 'Alaa', 'Giza', 'alaa@mail.com', '2023-04-21'),
  (1003, 'Samy', 'Cairo', 'samy@mail.com', '2023-04-21');

drop table EMPLOYEE_Q3_DW
create table EMPLOYEE_Q3_DW(
	emp_key int primary key identity(1,1),
	ID int ,
	name varchar(50),
	city varchar(50),
	email varchar(255),
	insert_data date,
	active_falg bit,
	version_no int,
)

drop table EMPLOYEE_Q3_DW_existing_employees_updated_recordes(
create table EMPLOYEE_Q3_DW_existing_employees_updated_recordes(
	emp_key int primary key identity(1,1),
	ID int ,
	name varchar(50),
	city varchar(50),
	email varchar(255),
	insert_data date,
	active_falg bit,
	version_no int,
)
truncate table EMPLOYEE_Q2
INSERT INTO EMPLOYEE_Q2 (ID, Name, City, Email, Update_Date)
VALUES
  (1001, 'Ahmed', 'Cairo', 'ahmed@mail.com', '2023-05-20'),
  (1002, 'Alaa', 'Giza', 'alaa@mail.com', '2023-04-20'),
  (1003, 'Samy', 'Cairo', 'samy@mail.com', '2023-04-20');

  -- New records
INSERT INTO EMPLOYEE_Q2 (ID, Name, City, Email, Update_Date)
VALUES (1004, 'John', 'Alexandria', 'john@mail.com', GETDATE());

INSERT INTO EMPLOYEE_Q2 (ID, Name, City, Email, Update_Date)
VALUES (1005, 'Sara', 'Cairo', 'sara@mail.com', GETDATE());

-- Updated records
UPDATE EMPLOYEE_Q2
SET City = 'giza', Update_Date = GETDATE()
WHERE ID = 1001;

UPDATE EMPLOYEE_Q2
SET email = 'ahmed@mail.com', Update_Date = GETDATE()
WHERE ID = 1001;


UPDATE EMPLOYEE_Q2
SET City = 'gfgfg'
WHERE ID = 1003;

-- Unchanged record
UPDATE EMPLOYEE_Q2
SET Update_Date = GETDATE()
WHERE ID = 1002;





 
 

UPDATE [dbo].[EMPLOYEE_Q2_DW]
SET [historical_city] = (select top 1 current_city
from EMPLOYEE_Q2_DW
where id = 1001 and fact_id < 5
order by fact_id desc)
WHERE  [current_city] = 'c' AND id = 1001 AND active_falg = 1


UPDATE [dbo].[EMPLOYEE_Q2_DW]
SET [historical_city] = (select top 1 current_city
from EMPLOYEE_Q2_DW
where id = ? and fact_id < ?
order by fact_id desc)
WHERE  [current_city] = ? AND id = ? AND active_falg = 1

UPDATE [dbo].[EMPLOYEE_Q2_DW]
SET [historical_email] = (select top 1 current_email
from EMPLOYEE_Q2_DW
where id = ? and fact_id < ?
order by fact_id desc)
WHERE  [current_email] = ? AND id = ? AND active_falg = 1

select current_email
from EMPLOYEE_Q2_DW
where id = 1001 and fact_id < 7
order by fact_id desc


TRUNCATE table EMPLOYEE_Q2_DW
 select * from EMPLOYEE_Q2
 select * from EMPLOYEE_Q2_DW

select max(update_date)
from EMPLOYEE_Q2

select Update_Date
from EMPLOYEE_Q2




 TRUNCATE table EMPLOYEE_Q3_DW
 truncate table EMPLOYEE_Q3_DW_existing_employees_updated_recordes
 select * from EMPLOYEE_Q3
 select * from EMPLOYEE_Q3_DW


 UPDATE EMPLOYEE_Q3_DW
 SET version_no = 1
 WHERE (  select top 1 insert_data from EMPLOYEE_Q3_DW order by emp_key desc) != 

 select MAX(version_no)
 from EMPLOYEE_Q3_DW
 where insert_data = (select MAX(insert_data)
 from EMPLOYEE_Q3_DW)

  select MAX(insert_data)
 from EMPLOYEE_Q3_DW

 UPDATE EMPLOYEE_Q3_DW
 SET active_falg = 0