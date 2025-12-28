--PHASE 3: Data Manipulation, Querying & Schema Maintenance
--3.2 DML: Data Manipulation Language 
/*1. Insert new records into reference tables (e.g., payment types, contract types) using INSERT.  
2. Update inconsistent or missing values in customer tables using UPDATE. 
3. Delete test records or duplicates using DELETE.  
4. Compare TRUNCATE vs DELETE and explain why TRUNCATE is not used on production tables.*/


--1.
--Create reference tables
CREATE TABLE Contract_Types (
    ContractID INT IDENTITY(1,1) PRIMARY KEY,
    ContractName VARCHAR(50) UNIQUE NOT NULL
);
--Insert new records
INSERT INTO Contract_Types (ContractName)
VALUES 
('Month-to-month'),
('One year'),
('Two year');



--Insert new records into ** to test the DELETE and TRUNCATE
INSERT INTO Dependents
(CustomerID, DependentName, CustomerFullName, Gender, Relationship, Age)
VALUES
('0002-ORFBO', 'Ali Orfbo', 'Orfbo Ali', 'M', 'Son', 12),
('0003-MKNFE', 'Sara Mknfe', 'Mknfe Sara', 'F', 'Daughter', 9),
('0011-IGKFF', 'Lina Igkff', 'Igkff Lina', 'F', 'Spouse', 35),
('0016-QLJIS', 'Omar Qljis', 'Qljis Omar', 'M', 'Son', 6);



--2. Update inconsistent or missing values in customer tables using UPDATE
UPDATE Customers
SET Gender = 'Male'
WHERE Gender = 'male';

UPDATE Customers
SET Gender = 'Female'
WHERE Gender = 'female';



--3.Delete test records
DELETE FROM Customers
WHERE CustomerID LIKE 'TEST%';



--4.TRUNCATE vs DELETE
--DELETE
/*
1.Removes rows one by one from a table so its Safe to use in production environments .
2.Can be used with a WHERE to delete specific records.
3.Can be rolled back if used within a transaction.
4.Does not reset the identity column.

*/

DELETE FROM Dependents
WHERE DependentID = 3;
select * from Dependents

--TRUNCATE
/*
1.Removes all rows at once from a table.
2.Cannot be used with a WHERE clause.
3.Cannot be rolled back.
4.Resets the identity column.
5.Cannot be used if the table is parent.
*/

TRUNCATE TABLE Dependents;
select * from Dependents