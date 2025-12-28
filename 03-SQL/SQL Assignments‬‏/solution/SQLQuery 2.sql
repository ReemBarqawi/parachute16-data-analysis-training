--PHASE 2: Exploratory SQL Queries  
--1. Retrieve the following: 

--All customer IDs and their tenure 
Select CustomerID,Tenure from Customers

 --Customers with charges above $100  
 select CustomerID,TotalCharges from Contracts_Billing
 WHERE TotalCharges>100 ;

 --Customers who use fiber optic AND have monthly contract  
SELECT s.CustomerID, s.InternetService, c.[Contract]
FROM Services s
JOIN Contracts_Billing c
    ON s.CustomerID = c.CustomerID
WHERE s.InternetService = 'Fiber optic'
  AND c.[Contract] = 'Month-to-month';


--2. Show the following:

--Sorted list of customers by tenure (descending)
SELECT CustomerID,Tenure FROM Customers
order by Tenure desc

--Top 15 customers with highest total charges 
SELECT Top(15) CustomerID,TotalCharges
from Contracts_Billing
ORDER BY TotalCharges DESC


--3. Use aliases to enhance readability
SELECT CustomerID AS Customers , MonthlyCharges AS MonthlyFee  
FROM Contracts_Billing 

