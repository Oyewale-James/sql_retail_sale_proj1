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
