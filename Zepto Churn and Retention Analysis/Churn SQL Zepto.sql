show databases;
use churn_project;
show tables;
select * from zepto_churn;

SELECT 
    (SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS ChurnRate
FROM zepto_churn;

SELECT ChurnReason, COUNT(*) AS Frequency
FROM zepto_churn
WHERE Churn = 1
GROUP BY ChurnReason
ORDER BY Frequency DESC
LIMIT 3;

SELECT 
    CASE WHEN Churn = 1 THEN 'Churned' ELSE 'Retained' END AS Customer_Status,
    AVG(AvgDeliveryDelay_Min) AS Avg_Delivery_Delay,
    AVG(Stockouts_Encountered) AS Avg_Stockouts,
    AVG(SLA_Breaches) AS Avg_SLA_Breaches,
    AVG(DiscountReliance) AS Avg_Discount_Reliance,
    AVG(SupportTickets) AS Avg_Support_Tickets,
    COUNT(*) AS Customer_Count
FROM zepto_churn
GROUP BY Customer_Status;

SELECT Churn, AVG(TotalSpend) AS AvgSpend
FROM zepto_churn
GROUP BY Churn;

SELECT Region, 
       COUNT(*) AS TotalCustomers,
       SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS ChurnedCustomers,
       (SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS ChurnRate
FROM zepto_churn
GROUP BY Region;