-- 1. Total Customers
SELECT COUNT(*) AS total_customers
FROM telecom_customers;

-- 2. Total Churned Customers
SELECT COUNT(*) AS churned_customers
FROM telecom_customers
WHERE Churn = 'Yes';

-- 3. Overall Churn Rate
SELECT
ROUND(
COUNT(CASE WHEN Churn='Yes' THEN 1 END)*100.0/COUNT(*),2
) AS churn_rate
FROM telecom_customers;

-- 4. Churn by Gender
SELECT Gender,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telecom_customers
GROUP BY Gender;

-- 5. Churn by Senior Citizen
SELECT SeniorCitizen,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telecom_customers
GROUP BY SeniorCitizen;


-- 6. Churn by Contract Type
SELECT Contract,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telecom_customers
GROUP BY Contract
ORDER BY churned_customers DESC;


-- 7. Churn by Internet Service
SELECT InternetService,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telecom_customers
GROUP BY InternetService;


-- 8. Average Monthly Charges by Churn Status
SELECT Churn,
ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charges
FROM telecom_customers
GROUP BY Churn;


-- 9. Average Total Charges by Churn Status
SELECT Churn,
ROUND(AVG(TotalCharges),2) AS avg_total_charges
FROM telecom_customers
GROUP BY Churn;


-- 10. Churn by Payment Method
SELECT PaymentMethod,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telecom_customers
GROUP BY PaymentMethod
ORDER BY churned_customers DESC;


-- 11. Churn by Paperless Billing
SELECT PaperlessBilling,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telecom_customers
GROUP BY PaperlessBilling;


-- 12. Customers with Highest Monthly Charges
SELECT CustomerID,
MonthlyCharges
FROM telecom_customers
ORDER BY MonthlyCharges DESC
LIMIT 10;


-- 13. Average Tenure by Churn Status
SELECT Churn,
ROUND(AVG(Tenure),2) AS avg_tenure
FROM telecom_customers
GROUP BY Churn;



-- 14. Churn by Multiple Lines Service
SELECT MultipleLines,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
FROM telecom_customers
GROUP BY MultipleLines;



-- 15. Top Risk Customer Segment
SELECT Contract,
InternetService,
PaymentMethod,
COUNT(*) AS churned_customers
FROM telecom_customers
WHERE Churn='Yes'
GROUP BY Contract, InternetService, PaymentMethod
ORDER BY churned_customers DESC
LIMIT 10;