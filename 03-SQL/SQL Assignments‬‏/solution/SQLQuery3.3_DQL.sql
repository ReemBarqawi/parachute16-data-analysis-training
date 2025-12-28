--PHASE 3: Data Manipulation, Querying & Schema Maintenance
--3.3 DQL: Data Query Language

--1. Structure Validation Queries 

--Retrieve all table names
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

--Retrieve all columns
SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Customers';

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Contracts_Billing';


--Confirm constraints exist 
--PRIMARY KEY
SELECT 
    tc.TABLE_NAME,
    tc.CONSTRAINT_NAME,
    kcu.COLUMN_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS kcu
    ON tc.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME
WHERE tc.CONSTRAINT_TYPE = 'PRIMARY KEY';


--FOREIGN KEY
SELECT 
    tc.TABLE_NAME,
    tc.CONSTRAINT_NAME,
    kcu.COLUMN_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS kcu
    ON tc.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME
WHERE tc.CONSTRAINT_TYPE = 'FOREIGN KEY';


--=============================================================================

--2.Data Quality Validation 

--Check Null values in critical column
SELECT *
FROM Contracts_Billing
WHERE CustomerID IS NULL
   OR [Contract] IS NULL; --output:no nulls

 --Check for inconsistent values
SELECT CustomerID, MonthlyCharges, TotalCharges
FROM Contracts_Billing
WHERE MonthlyCharges < 0
   OR TotalCharges < 0;  --output:no inconsistent values


--Query showing the count of distinct values
--Contract types 
SELECT COUNT(DISTINCT [Contract]) AS ContractTypeCount
FROM Contracts_Billing; --output:3

--Payment methods
SELECT COUNT(DISTINCT PaymentMethod) AS [Payment Method Count]
FROM Contracts_Billing; --output:4

--Internet service types
SELECT COUNT(DISTINCT InternetService) AS InternetServiceCount
FROM Services; --output:3

--=============================================================================
-- 3. Post-cleaning Verification Queries
-- Retrieve customers updated in PHASE 3.
/* To enable this, we first:
1. Alter the Customers table to add the 'last_updated' column.
2. Ensure all INSERT and UPDATE statements set 'last_updated' = GETDATE().
3. Then retrieve the updated customers */

ALTER TABLE Customers
ADD last_updated DATETIME DEFAULT GETDATE();


UPDATE Customers
SET 
    Tenure = 120,
    last_updated = GETDATE()
WHERE CustomerID = '0002-ORFBO';


UPDATE Customers
SET 
    Partner = 'yes', -- it was 'Yes'
    last_updated = GETDATE()
WHERE Partner = 'Yes';



-- Records changed during data cleaning (UPDATE)
SELECT *
FROM Customers
WHERE last_updated >= CAST(GETDATE() AS DATE);


-- Verify numeric data after cleaning
SELECT
    CustomerID,
    Tenure AS TenureMonths,
    ISNUMERIC(Tenure) AS IsTenureNumeric,
    TRY_CAST(Tenure AS INT) AS Tenure_Clean
FROM Customers;


--Exploratory DQL for Schema Validation  
SELECT TOP (20)
    CustomerID,
    Gender,
    SeniorCitizen AS SeniorCitizen,
    Partner      AS [Have Partner],
    Dependents   AS [Have Dependents],
    Tenure       AS TenureMonths,
	last_updated
FROM Customers;



