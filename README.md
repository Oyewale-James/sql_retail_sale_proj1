# 🛒 Retail Sales Analysis SQL Project
# 📋 Project Overview

The objective of this project is to analyse retail sales data to uncover customer purchasing patterns, category performance, and time-based sales trends. The project demonstrates the use of SQL for data cleaning, exploratory data analysis (EDA), and solving specific business problems using advanced techniques like CTEs and Window Functions.

# Database Schema
transactions_id, INT, Primary Key for each transaction

sale_date, DATE, Date of the transaction

sale_time, TIME, Time of the transaction

customer_id, INT, Unique identifier for the customer

gender, VARCHAR, Customer gender

age, INT, Customer age

category, VARCHAR, "Product category (e.g., Clothing, Beauty)"

quantiy, INT, Number of units sold

price_per_unit, FLOAT, Price per single unit

cogs, FLOAT, Cost of Goods Sold

total_sale, FLOAT, Total revenue from the transaction

# Data Cleaning
The script identifies and removes records with NULL values across critical columns to ensure data integrity before analysis begins.
Example DELETE FROM retail_sales WHERE transactions_id IS NULL etc.

# Exploratory Data Analysis (EDA)
Basic queries determine the scope of the dataset:

Total Sales Count: Total number of transactions.

Customer Count: Total vs Unique customers.

Category List: Identifying unique product categories.

# Business Analysis
The script solves 10 specific business questions, including:

Time-Series Analysis: Finding the best-selling month for each year using RANK().

Customer Segmentation: Calculating average age per category and identifying top 5 "High Value" customers.

Shift Analysis: Using a CASE statement and CTE to group sales into Morning, Afternoon, and Evening shifts.

# Key SQL Techniques Used
Data Definition (DDL): Creating and dropping tables.

Aggregations: SUM(), AVG(), COUNT(), MIN(), MAX().

Filtering & Joins: Complex WHERE clauses and GROUP BY logic.

Window Functions: RANK() OVER(PARTITION BY ...) for trend analysis.

Common Table Expressions (CTEs): Used for organising complex multi-step queries.

# Sample Business Insight
Shift Analysis: By categorising sale_time into shifts (Morning, Afternoon, Evening), the business can optimise staffing and promotional timing based on when the highest volume of orders occurs.
