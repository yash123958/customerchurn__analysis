USE customer_churn;

-- 1. Retrieve Customers Using DSL Internet Service
SELECT *
FROM `customer churn`
WHERE InternetService = 'DSL';


-- 2. Identify Customers Who Have Churned
SELECT customerID, gender, tenure, MonthlyCharges, Churn
FROM `customer churn`
WHERE Churn = 'Yes';


-- 3. Find the Top 10 Customers with the Highest Monthly Charges
SELECT customerID, Contract, MonthlyCharges
FROM `customer churn`
ORDER BY MonthlyCharges DESC
LIMIT 10;


-- 4. Count Total Customers by Contract Type
SELECT Contract, COUNT(*) AS TotalCustomers
FROM `customer churn`
GROUP BY Contract;


-- 5. Find Contract Types with More Than 100 Churned Customers
SELECT Contract,
       COUNT(*) AS ChurnedCustomers
FROM `customer churn`
WHERE Churn = 'Yes'
GROUP BY Contract
HAVING COUNT(*) > 100
ORDER BY ChurnedCustomers DESC;


-- 6. Display Churned Customers Sorted by Monthly Charges
SELECT customerID,
       Contract,
       MonthlyCharges,
       Churn
FROM `customer churn`
WHERE Churn = 'Yes'
ORDER BY MonthlyCharges DESC;