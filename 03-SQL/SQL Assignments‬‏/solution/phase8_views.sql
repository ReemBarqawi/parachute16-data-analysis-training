--PHASE 8: Views for Reporting    
--Create three (3) views:  

-- 1. vw_customer_overview
CREATE VIEW vw_customer_overview AS
(
    SELECT 
        c.CustomerID,
        c.Gender,
        c.SeniorCitizen,
        c.Partner,
        c.Dependents,
        c.Tenure
    FROM Customers c
); -- Stored under Views in the database


--2. vw_churn_summary  
CREATE VIEW vw_churn_summary AS
(
    SELECT 
        c.CustomerID,
        cb.Contract,
        CASE 
            WHEN c.Tenure BETWEEN 0 AND 12 THEN '0-12 months'
            WHEN c.Tenure BETWEEN 13 AND 24 THEN '13-24 months'
            ELSE '25+ months'
        END AS TenureCategory,
        cb.MonthlyCharges,
        ISNULL(ch.Churn,'No') AS Churn
    FROM Customers c
    LEFT JOIN Contracts_Billing cb ON c.CustomerID = cb.CustomerID
    LEFT JOIN Churn ch ON c.CustomerID = ch.CustomerID
); -- Stored under Views in the database


-- 3. vw_high_risk_customers
CREATE VIEW vw_high_risk_customers AS
(
    SELECT 
        c.CustomerID,
        CONCAT(c.First_name,' ',c.LastName) AS FullName,
        c.Tenure,
        ISNULL(ch.Churn,'No') AS Churn,
        CASE 
            WHEN c.Tenure < 12 AND ISNULL(ch.Churn,'No') = 'Yes' THEN 'High Risk'
            ELSE 'Low/Medium'
        END AS Customer_Risk_Level
    FROM Customers c
    LEFT JOIN Churn ch ON c.CustomerID = ch.CustomerID
); -- Stored under Views in the database

