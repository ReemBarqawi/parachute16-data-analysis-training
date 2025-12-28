
--Phase 7: Built-In Functions

-- 1. Build full customer name (no customer name felid in the data )
SELECT 
    CustomerID,
    CONCAT(First_name, ' ', LastName) AS FullName
FROM Customers;


-- 2. Standardize categorical fields using UPPER/LOWER
SELECT 
    CustomerID,
    UPPER(Gender) AS Gender_Upper,
    LOWER(Partner) AS Partner_Lower,
    LOWER(Dependents) AS Dependents_Lower
FROM Customers;


-- 3. Calculate customer age using DATEDIFF (if Birthdate exists)
SELECT 
    CustomerID,
    DATEDIFF(YEAR, Birthdate, GETDATE()) AS Age
FROM Customers
WHERE Birthdate IS NOT NULL;


-- 4. Create a derived column: customer_risk_level
SELECT 
    c.CustomerID,
    c.Tenure,
    ch.Churn,
    CASE 
        WHEN c.Tenure < 12 AND ch.Churn = 'Yes' THEN 'High Risk'
        ELSE 'Low/Medium'
    END AS Customer_Risk_Level
FROM Customers c
LEFT JOIN Churn ch 
    ON c.CustomerID = ch.CustomerID;

----------------------------------------------------------
-- 5. Convert TotalCharges to integer using CAST/CONVERT
SELECT 
    CustomerID,
    CAST(TotalCharges AS INT) AS TotalCharges_Int,
    CONVERT(INT, TotalCharges) AS TotalCharges_Int2
FROM Contracts_Billing;

