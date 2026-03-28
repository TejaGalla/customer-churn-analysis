-- Total Customers
SELECT COUNT(*) AS total_customers FROM dataset;

-- Churn Count
SELECT Churn, COUNT(*) AS customer_count
FROM dataset
GROUP BY Churn;

-- Churn Rate by Contract
SELECT Contract,
       ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_percent
FROM dataset
GROUP BY Contract
ORDER BY churn_rate_percent DESC;

-- Average Monthly Charges by Churn
SELECT Churn, ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges
FROM dataset
GROUP BY Churn;

-- Churn Rate by Internet Service
SELECT InternetService,
       ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_percent
FROM dataset
GROUP BY InternetService
ORDER BY churn_rate_percent DESC;

-- Churn Rate by Payment Method
SELECT PaymentMethod,
       ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate_percent
FROM dataset
GROUP BY PaymentMethod
ORDER BY churn_rate_percent DESC;

-- High-Risk Low-Tenure Customers
SELECT CustomerID, Contract, MonthlyCharges, Tenure, PaymentMethod, SupportCalls
FROM dataset
WHERE Churn = 'Yes' AND Tenure <= 12
ORDER BY MonthlyCharges DESC;
