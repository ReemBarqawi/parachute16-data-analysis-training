--PHASE 3: Data Manipulation, Querying & Schema Maintenance
--3.1 DDL: Data Definition Language
/*1. Create missing tables or adjust structure using:  
	● CREATE TABLE  
	● ALTER TABLE  
	● DROP TABLE (Explain why dangerous) */

--1
CREATE TABLE Dependents (
    DependentID INT IDENTITY(1,1) PRIMARY KEY,  -- unique ID for each dependent, auto-increment
    CustomerID VARCHAR(20) NOT NULL,            -- link with customer
    DependentName VARCHAR(50) NOT NULL,         
    CustomerFullName VARCHAR(100) UNIQUE,       
    Gender CHAR(1) DEFAULT 'M',                
    Relationship VARCHAR(20),                   
    Age INT,                                    
    CONSTRAINT FK_Dependents_Customers FOREIGN KEY (CustomerID) 
        REFERENCES Customers(CustomerID));

select top(10) * From Dependents;--to show the result


--2
ALTER TABLE Dependents 
DROP COLUMN Age ; --safe because it's not a primary key or foreign key
select top(10) * From Dependents;--to show the result


--3
Drop Table Dependents ;--Dangerous because you will lose all data permanently , use it only when sure
                       --Deletion order: Child -> Parent
select top(10) * From Dependents;--to show the result


