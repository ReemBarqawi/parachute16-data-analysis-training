CREATE DATABASE [TelcoChurnAnalysis]
go
USE [TelcoChurnAnalysis]
GO
-- CREATE TABLES 
-- Customers
CREATE TABLE Customers (
    CustomerID VARCHAR(20) PRIMARY KEY,

    Gender VARCHAR(6)
        CHECK (Gender IN ('Male','Female')),

    SeniorCitizen BIT,

    [Partner] VARCHAR(3)
        CHECK ([Partner] IN ('Yes','No')),

    Dependents VARCHAR(3)
        CHECK (Dependents IN ('Yes','No')),

    Tenure INT
        CHECK (Tenure >= 0)
);

------------------------------------------------
--Services
CREATE TABLE Services (
    ServiceID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID VARCHAR(20),

    PhoneService VARCHAR(3)
        CHECK (PhoneService IN ('Yes','No')),

    MultipleLines VARCHAR(20)
        CHECK (MultipleLines IN ('Yes','No','No phone service')),

    InternetService VARCHAR(20)
        CHECK (InternetService IN ('DSL','Fiber optic','No')),

    OnlineSecurity VARCHAR(30)
        CHECK (OnlineSecurity IN ('Yes','No','No internet service')),

    OnlineBackup VARCHAR(30)
        CHECK (OnlineBackup IN ('Yes','No','No internet service')),

    DeviceProtection VARCHAR(30)
        CHECK (DeviceProtection IN ('Yes','No','No internet service')),

    TechSupport VARCHAR(30)
        CHECK (TechSupport IN ('Yes','No','No internet service')),

    StreamingTV VARCHAR(30)
        CHECK (StreamingTV IN ('Yes','No','No internet service')),

    StreamingMovies VARCHAR(30)
        CHECK (StreamingMovies IN ('Yes','No','No internet service')),

    CONSTRAINT FK_Services_Customers
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


-------------------------------------------
--Contracts / Billing

CREATE TABLE Contracts_Billing (
    BillingID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID VARCHAR(20),

    [Contract] VARCHAR(100),

    PaperlessBilling VARCHAR(3)
        CHECK (PaperlessBilling IN ('Yes','No')),

    PaymentMethod VARCHAR(50)
        CHECK (
            PaymentMethod IN (
                'Electronic check',
                'Mailed check',
                'Bank transfer (automatic)',
                'Credit card (automatic)')),

    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),

    CONSTRAINT FK_Billing_Customers
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);


---------------------------------------------------------------
--Churn
CREATE TABLE Churn (
    CustomerID VARCHAR(20) PRIMARY KEY,

    Churn VARCHAR(3)
        CHECK (Churn IN ('Yes','No')),

    CONSTRAINT FK_Churn_Customers
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

/*================================================================
ALTER EX 
==================================================================*/
ALTER TABLE Customers 
add First_name varchar(20);

alter table Customers 
drop First_name --drop the column i add to ensure the bulk insert work right 



/*==============================================================================
bulk insert
================================================================================*/
--customer table first 

BULK INSERT Customers
FROM 'C:\data\customer_data.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

--Services table

BULK INSERT Services
FROM 'C:\data\service_data.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


--Contracts_Billing table

BULK INSERT Contracts_Billing
FROM 'C:\data\Billing_data.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);


--Churn table
BULK INSERT Churn
FROM 'C:\data\Churn_data.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
