# 📊 E-Commerce Customer Behavior & Sales Analysis using SQL

---

## 📌 Project Overview

This project analyzes an e-commerce dataset to understand customer behavior, sales performance, and business trends using SQL. The dataset includes customer demographics, transaction details, and behavioral metrics.

The objective is to transform raw data into meaningful insights that support data-driven decision-making in business and marketing.

---

## 🎯 Objectives
• Analyze overall sales performance and revenue trends
• Identify top customers and high-value segments
• Evaluate product category performance
• Understand customer behavior based on demographics
• Analyze the impact of delivery time and customer ratings
• Examine payment methods and device usage patterns

---

## 🗂️ Project Structure

---

### 📁 Dataset Information

| Column Name              | Data Type      | Description                            | Example     |
| ------------------------ | -------------- | -------------------------------------- | ----------- |
| Order_ID                 | VARCHAR        | Unique identifier for each order       | ORD_001337  |
| Customer_ID              | VARCHAR        | Unique identifier for each customer    | CUST_01337  |
| Date                     | VARCHAR → DATE | Date of transaction (converted in SQL) | 2023-01-15  |
| Age                      | INT            | Age of the customer                    | 35          |
| Gender                   | VARCHAR        | Gender of the customer                 | Female      |
| City                     | VARCHAR        | Customer’s location/city               | Istanbul    |
| Product_Category         | VARCHAR        | Category of product purchased          | Electronics |
| Unit_Price               | FLOAT          | Price per unit of product              | 512.45      |
| Quantity                 | INT            | Number of units purchased              | 3           |
| Discount_Amount          | FLOAT          | Discount applied to order              | 45.20       |
| Total_Amount             | FLOAT          | Final transaction value after discount | 1490.15     |
| Payment_Method           | VARCHAR        | Mode of payment used                   | Credit Card |
| Device_Type              | VARCHAR        | Device used for purchase               | Mobile      |
| Session_Duration_Minutes | INT            | Time spent on website                  | 12          |
| Pages_Viewed             | INT            | Number of pages viewed                 | 6           |
| Is_Returning_Customer    | BOOLEAN        | Indicates repeat customer              | TRUE        |
| Delivery_Time_Days       | INT            | Delivery time in days                  | 5           |
| Customer_Rating          | INT            | Rating given by customer (1–5)         | 4           |

---

### 🧹 Data Cleaning

• Checked for missing (NULL) values — none found
• Converted Date column into proper DATE format
• Verified data types for all columns
• Ensured consistency in categorical values

---

### 📊 Data Analysis (SQL Queries)

#### 💰 Total Revenue

```sql
SELECT SUM(Total_Amount) AS total_revenue FROM ecommerce;
```

#### 👥 Top Customers

```sql
SELECT Customer_ID, SUM(Total_Amount) AS spending
FROM ecommerce
GROUP BY Customer_ID
ORDER BY spending DESC
LIMIT 5;
```

#### 🛒 Sales by Category

```sql
SELECT Product_Category, SUM(Total_Amount) AS revenue
FROM ecommerce
GROUP BY Product_Category
ORDER BY revenue DESC;
```

#### 💳 Payment Method Analysis

```sql
SELECT Payment_Method, SUM(Total_Amount) AS revenue
FROM ecommerce
GROUP BY Payment_Method;
```

#### 📱 Device Type Analysis

```sql
SELECT Device_Type, SUM(Total_Amount) AS revenue
FROM ecommerce
GROUP BY Device_Type;
```

#### ⭐ Customer Rating Impact

```sql
SELECT Customer_Rating, AVG(Total_Amount) AS avg_spending
FROM ecommerce
GROUP BY Customer_Rating;
```

#### 🌆 Top Cities by Revenue

```sql
SELECT City, SUM(Total_Amount) AS revenue
FROM ecommerce
GROUP BY City
ORDER BY revenue DESC
LIMIT 5;
```

#### 📦 Most Purchased Category

```sql
SELECT Product_Category, SUM(Quantity) AS total_quantity
FROM ecommerce
GROUP BY Product_Category
ORDER BY total_quantity DESC;
```

#### 🚚 Delivery Time Impact

```sql
SELECT Delivery_Time_Days, AVG(Customer_Rating) AS avg_rating
FROM ecommerce
GROUP BY Delivery_Time_Days;
```

#### 🏆 Top Products by Revenue

```sql
SELECT Product_Category, SUM(Total_Amount) AS revenue
FROM ecommerce
GROUP BY Product_Category
ORDER BY revenue DESC
LIMIT 5;
```

#### 🚻 Gender-wise Spending

```sql
SELECT Gender, AVG(Total_Amount) AS avg_spending
FROM ecommerce
GROUP BY Gender;
```

#### 👨‍👩‍👧 Age Group Analysis

```sql
SELECT 
    CASE 
        WHEN Age < 25 THEN 'Young'
        WHEN Age BETWEEN 25 AND 40 THEN 'Adult'
        ELSE 'Senior'
    END AS age_group,
    AVG(Total_Amount) AS avg_spending
FROM ecommerce
GROUP BY age_group;
```

---

## 📈 Key Insights

• 💰 Overall revenue is strong, indicating good business performance

• 👥 A small number of customers contribute most of the revenue

• 🛒 Certain product categories generate higher sales

• 💳 Customers prefer specific payment methods

• 📱 Customer behavior varies across device types

• ⭐ Higher ratings are linked to higher spending

• 🌆 A few cities contribute significantly to total revenue

• 📦 Some categories are purchased more frequently

• 🚚 Faster delivery leads to better customer satisfaction

• 🏆 A few products generate the highest revenue

• 🚻 Spending patterns differ across genders

• 👨‍👩‍👧 Different age groups show different buying behavior

---

## 🛠️ Tools and Technologies

• SQL (MySQL)
• Excel
• phpMyAdmin

---

## 🏁 Conclusion

This project demonstrates how SQL can be used to analyze e-commerce data and generate meaningful business insights. The analysis highlights customer behavior patterns, key revenue drivers, and operational factors such as delivery efficiency and customer satisfaction.

The insights derived can help businesses improve marketing strategies, optimize operations, and enhance overall customer experience.

---
