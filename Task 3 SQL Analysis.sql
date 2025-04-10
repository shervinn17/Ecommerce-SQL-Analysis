
-- 1. Total Sales (Net Amount) by Product Category
SELECT 
    `Product Category`, 
    SUM(`Net Amount`) AS Total_Sales
FROM 
    ecommerce_data
GROUP BY 
    `Product Category`
ORDER BY 
    Total_Sales DESC;

-- 2. Average Discount Amount by Location
SELECT 
    `Location`, 
    AVG(`Discount Amount (INR)`) AS Avg_Discount
FROM 
    ecommerce_data
GROUP BY 
    `Location`
ORDER BY 
    Avg_Discount DESC;

-- 3. Total Number of Transactions by Age Group
SELECT 
    `Age Group`, 
    COUNT(DISTINCT `TID`) AS Total_Transactions
FROM 
    ecommerce_data
GROUP BY 
    `Age Group`;

-- 4. Average Revenue per User (ARPU)
SELECT 
    ROUND(SUM(`Net Amount`) / COUNT(DISTINCT `CID`), 2) AS ARPU
FROM 
    ecommerce_data;

-- 5. Customers Who Availed Discounts More Than 5 Times
SELECT 
    `CID`, 
    COUNT(*) AS Discount_Count
FROM 
    ecommerce_data
WHERE 
    `Discount Availed` = 'Yes'
GROUP BY 
    `CID`
HAVING 
    Discount_Count > 5
ORDER BY 
    Discount_Count DESC;

-- 6. Top 5 Cities by Gross Sales
SELECT 
    `Location`, 
    SUM(`Gross Amount`) AS Gross_Sales
FROM 
    ecommerce_data
GROUP BY 
    `Location`
ORDER BY 
    Gross_Sales DESC
LIMIT 5;

-- 7. Subquery: Customers with Above-Average Net Spending
SELECT 
    `CID`, 
    SUM(`Net Amount`) AS Total_Spent
FROM 
    ecommerce_data
GROUP BY 
    `CID`
HAVING 
    Total_Spent > (
        SELECT AVG(`Net Amount`) FROM ecommerce_data
    );

-- 8. Create a View: Summary by Gender and Age Group
CREATE VIEW gender_age_summary AS
SELECT 
    `Gender`, 
    `Age Group`, 
    COUNT(*) AS Total_Transactions,
    AVG(`Net Amount`) AS Avg_Spending
FROM 
    ecommerce_data
GROUP BY 
    `Gender`, `Age Group`;
