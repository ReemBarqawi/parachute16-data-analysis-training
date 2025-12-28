--PHASE 4: Aggregation, Grouping & Churn Insights 

--1. Write queries to find: 
--A. Total number of customers  
SELECT COUNT(CustomerID) AS TotalCustomers
FROM Customers;


--B. Average monthly charges by contract type  
select Contract,avg(MonthlyCharges) as AvgMonthlyCharges 
from Contracts_Billing
group by Contract


--C. Number of churned vs non-churned customers 
SELECT
    ISNULL(Churn, 'Unknown') AS ChurnStatus,
    COUNT(CustomerID) AS TotalCustomers
FROM Churn
GROUP BY ISNULL(Churn, 'Unknown');



--D. Top Contract Type with highest churn rate  
SELECT TOP (1)
    cb.Contract AS ContractType,
    COUNT(c.CustomerID) AS TotalCustomers,
    SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) AS ChurnedCustomers,
    CAST(SUM(CASE WHEN c.Churn = 'Yes' THEN 1 ELSE 0 END) * 1.0 / COUNT(c.CustomerID) AS DECIMAL(5,2)  ) AS ChurnRate  
   
FROM Contracts_Billing cb
INNER JOIN Churn c
    ON cb.CustomerID = c.CustomerID
GROUP BY cb.Contract
ORDER BY ChurnRate DESC;


-- E. Average tenure for customers grouped by payment method
SELECT cb.PaymentMethod AS PaymentMethod,
AVG(COALESCE(c.Tenure, 0)) AS AvgTenure
FROM Customers c
INNER JOIN Contracts_Billing cb ON cb.CustomerID = c.CustomerID
GROUP BY cb.PaymentMethod;


--F. Use HAVING to filter groups for Payment methods with more than 1,000 customers   
SELECT cb.PaymentMethod AS PaymentMethod, COUNT(cb.CustomerID) AS TotalCustomers
FROM Contracts_Billing cb
GROUP BY cb.PaymentMethod
HAVING COUNT(cb.CustomerID) > 1000;



