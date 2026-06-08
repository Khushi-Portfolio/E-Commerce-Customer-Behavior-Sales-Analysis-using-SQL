-- =========================================
-- E-COMMERCE SQL PROJECT
-- =========================================

-- 1. CREATE DATABASE
CREATE DATABASE ecommerce_db;
USE ecommerce_db;

-- =========================================
-- 2. CREATE TABLE
-- =========================================
CREATE TABLE ecommerce (
Order_ID VARCHAR(50),
Customer_ID VARCHAR(50),
Date VARCHAR(20),
Age INT,
Gender VARCHAR(10),
City VARCHAR(50),
Product_Category VARCHAR(50),
Unit_Price FLOAT,
Quantity INT,
Discount_Amount FLOAT,
Total_Amount FLOAT,
Payment_Method VARCHAR(50),
Device_Type VARCHAR(50),
Session_Duration_Minutes INT,
Pages_Viewed INT,
Is_Returning_Customer BOOLEAN,
Delivery_Time_Days INT,
Customer_Rating INT
);

-- =========================================
-- 3. DATA CLEANING
-- =========================================

-- Convert Date column to proper DATE format
UPDATE ecommerce
SET Date = STR_TO_DATE(Date, '%Y-%m-%d');

-- Change column datatype
ALTER TABLE ecommerce
MODIFY Date DATE;

-- =========================================
-- 4. DATA VALIDATION
-- =========================================

-- Total rows
SELECT COUNT(*) AS total_records FROM ecommerce;

-- Check sample data
SELECT * FROM ecommerce LIMIT 10;

-- =========================================
-- 5. DATA ANALYSIS
-- =========================================

-- 5.1 Total Revenue
SELECT SUM(Total_Amount) AS total_revenue FROM ecommerce;

-- 5.2 Top Customers
SELECT Customer_ID, SUM(Total_Amount) AS spending
FROM ecommerce
GROUP BY Customer_ID
ORDER BY spending DESC
LIMIT 5;

-- 5.3 Sales by Category
SELECT Product_Category, SUM(Total_Amount) AS revenue
FROM ecommerce
GROUP BY Product_Category
ORDER BY revenue DESC;

-- 5.4 Payment Method Analysis
SELECT Payment_Method, SUM(Total_Amount) AS revenue
FROM ecommerce
GROUP BY Payment_Method;

-- 5.5 Device Type Analysis
SELECT Device_Type, SUM(Total_Amount) AS revenue
FROM ecommerce
GROUP BY Device_Type;

-- 5.6 Customer Rating Impact
SELECT Customer_Rating, AVG(Total_Amount) AS avg_spending
FROM ecommerce
GROUP BY Customer_Rating;

-- 5.7 Top Cities by Revenue
SELECT City, SUM(Total_Amount) AS revenue
FROM ecommerce
GROUP BY City
ORDER BY revenue DESC
LIMIT 5;

-- 5.8 Most Purchased Category (by Quantity)
SELECT Product_Category, SUM(Quantity) AS total_quantity
FROM ecommerce
GROUP BY Product_Category
ORDER BY total_quantity DESC;

-- 5.9 Delivery Time Impact on Rating
SELECT Delivery_Time_Days, AVG(Customer_Rating) AS avg_rating
FROM ecommerce
GROUP BY Delivery_Time_Days;

-- 5.10 Top Products by Revenue
SELECT Product_Category, SUM(Total_Amount) AS revenue
FROM ecommerce
GROUP BY Product_Category
ORDER BY revenue DESC
LIMIT 5;

-- 5.11 Gender-wise Spending
SELECT Gender, AVG(Total_Amount) AS avg_spending
FROM ecommerce
GROUP BY Gender;

-- 5.12 Age Group Analysis
SELECT
CASE
WHEN Age < 25 THEN 'Young'
WHEN Age BETWEEN 25 AND 40 THEN 'Adult'
ELSE 'Senior'
END AS age_group,
AVG(Total_Amount) AS avg_spending
FROM ecommerce
GROUP BY age_group;

-- =========================================
-- END OF PROJECT
-- =========================================
