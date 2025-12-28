--PHASE 5: Joins & Multi-table Analysis 

--1. Using INNER JOIN
--list customers with their contract and monthly charge info.
select c.CustomerID , cb.Contract , cb.MonthlyCharges
from Customers c
inner join Contracts_Billing cb on cb.CustomerID=c.CustomerID
order by cb.MonthlyCharges desc



-- 2. Using LEFT JOIN, show customers who have internet service vs those who don’t.
select s.InternetService , count(c.CustomerID) as TotalCustomer
from Services s
left join Customers c on s.CustomerID=c.CustomerID 
group by s.InternetService



--3. Using RIGHT JOIN, compare payment methods with customer info. 
select c.CustomerID, cb.PaymentMethod
from Contracts_Billing cb
right join Customers c on cb.CustomerID = c.CustomerID
order by cb.PaymentMethod;


--4. Using FULL OUTER JOIN, find unmatched records between customer table and billing table.
select *
from Customers c
full outer join Contracts_Billing cb on c.CustomerID=cb.CustomerID



--5. Use a SELF JOIN to identify customers with the same tenure.
select 
    c1.CustomerID as Customer1_ID,
    c2.CustomerID as Customer2_ID,
    c1.Tenure
from Customers c1
inner join Customers c2 
    on c1.Tenure = c2.Tenure
    and c1.CustomerID < c2.CustomerID
order by c1.Tenure;


---- Analyze Customer, Contract type, and Internet service
select 
    c.CustomerID,
    c.Gender,
    c.SeniorCitizen,
    c.Partner,
    c.Dependents,
    c.Tenure,
    cb.Contract,
    cb.PaymentMethod,
    s.InternetService
from Customers c
inner join Contracts_Billing cb 
    on c.CustomerID = cb.CustomerID
inner join Services s
    on c.CustomerID = s.CustomerID
order by c.CustomerID;





