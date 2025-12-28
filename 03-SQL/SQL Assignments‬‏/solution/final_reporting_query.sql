--PHASE 9: Reporting Output & Data Export 
-- Final reporting query
SELECT 
    c.CustomerID AS [Customer ID],
    UPPER(c.Gender) AS [Gender],
    c.SeniorCitizen AS [Senior Citizen],
    c.Partner AS [Partner],
    c.Dependents AS [Dependents],
    c.Tenure AS [Tenure (Months)],
    cb.Contract AS [Contract Type],
    cb.PaymentMethod AS [Payment Method],
    s.InternetService AS [Internet Service],
    cb.MonthlyCharges AS [Monthly Charges],
    CAST(cb.TotalCharges AS INT) AS [Total Charges],
    ISNULL(ch.Churn,'No') AS [Churn Flag],
    CASE 
        WHEN c.Tenure < 12 AND ISNULL(ch.Churn,'No') = 'Yes' THEN 'High Risk'
        ELSE 'Low/Medium'
    END AS [Customer Risk Level],
    CASE 
        WHEN c.Tenure BETWEEN 0 AND 12 THEN '0-12 months'
        WHEN c.Tenure BETWEEN 13 AND 24 THEN '13-24 months'
        ELSE '25+ months'
    END AS [Tenure Category]
FROM Customers c
LEFT JOIN Contracts_Billing cb ON c.CustomerID = cb.CustomerID
LEFT JOIN Services s ON c.CustomerID = s.CustomerID
LEFT JOIN Churn ch ON c.CustomerID = ch.CustomerID
ORDER BY [Customer Risk Level] DESC, [Tenure (Months)] DESC;