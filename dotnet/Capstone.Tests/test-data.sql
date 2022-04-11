BEGIN TRANSACTION;

--Create tables here

BEGIN TRANSACTION;
--CREAT TABLE etc to mirror your Capstone DB

--Example, from DAO Testing Day
--CREATE TABLE department (
--	department_id 	INT NOT NULL IDENTITY (1,1),
--	name 			VARCHAR(40) UNIQUE NOT NULL,
--	CONSTRAINT pk_department PRIMARY KEY (department_id)
--);

--Seed any data needed here
--INSERT INTO department (name)
--VALUES ('Department 1'); -- department_id will be 1

-- Need employees so we can add timesheets


COMMIT TRANSACTION;
