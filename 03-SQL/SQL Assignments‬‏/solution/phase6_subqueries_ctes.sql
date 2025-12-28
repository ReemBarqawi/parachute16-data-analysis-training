--PHASE 6: Subqueries & CTEs 

--1- Customers with MonthlyCharges above the overall average
SELECT CustomerID, MonthlyCharges
FROM Contracts_Billing
WHERE MonthlyCharges > (
    SELECT AVG(MonthlyCharges) 
    FROM Contracts_Billing
);


--2-Top 10 high-churn-risk customers based on charges, tenure, and service type
SELECT TOP 10 *
FROM Customers c
JOIN Contracts_Billing cb ON c.CustomerID = cb.CustomerID
JOIN Services s ON c.CustomerID = s.CustomerID
JOIN Churn ch ON c.CustomerID = ch.CustomerID
WHERE ch.Churn = 'Yes'
ORDER BY cb.MonthlyCharges DESC, c.Tenure ASC, 
         CASE s.InternetService
             WHEN 'Fiber optic' THEN 3
             WHEN 'DSL' THEN 2
             ELSE 1
         END DESC;

--3- Customers whose TotalCharges exceed the average of their PaymentMethod group
SELECT c.CustomerID, cb.PaymentMethod, cb.TotalCharges
FROM Contracts_Billing cb
JOIN Customers c ON c.CustomerID = cb.CustomerID
WHERE cb.TotalCharges > (
    SELECT AVG(cb2.TotalCharges)
    FROM Contracts_Billing cb2
    WHERE cb2.PaymentMethod = cb.PaymentMethod
);




--4- CTE1: Clean dataset (replace NULLs and remove invalid records)
WITH CTE_Clean AS
(
    SELECT 
        c.CustomerID,
        c.Gender,
        c.SeniorCitizen,
        ISNULL(c.Partner, 'No') AS Partner,
        ISNULL(c.Dependents, 'No') AS Dependents,
        ISNULL(c.Tenure, 0) AS Tenure,
        cb.Contract,
        cb.PaymentMethod,
        ISNULL(cb.MonthlyCharges, 0) AS MonthlyCharges,
        ISNULL(cb.TotalCharges, 0) AS TotalCharges,
        s.InternetService,
        ISNULL(ch.Churn, 'No') AS Churn
    FROM Customers c
    LEFT JOIN Contracts_Billing cb ON c.CustomerID = cb.CustomerID
    LEFT JOIN Services s ON c.CustomerID = s.CustomerID
    LEFT JOIN Churn ch ON c.CustomerID = ch.CustomerID
    WHERE c.CustomerID IS NOT NULL -- remove invalid records
)

--5- CTE2: Churn segmentation based on tenure
 , CTE_ChurnSegmentation AS
(
    SELECT *,
        CASE 
            WHEN Tenure BETWEEN 0 AND 12 THEN '0-12 months'
            WHEN Tenure BETWEEN 13 AND 24 THEN '13-24 months'
            ELSE '25+ months'
        END AS TenureCategory
    FROM CTE_Clean
)

-- Final output
SELECT CustomerID, Contract, InternetService, Tenure, TenureCategory, Churn
FROM CTE_ChurnSegmentation
ORDER BY TenureCategory, CustomerID;


---- CTE is better than a subquery when:
-- 1) The query is long and complex, so dividing work into logical steps improves readability
-- 2) The result of the query is reused multiple times in the same statement
-- 3) When you want to make intermediate results easier to debug and maintain
