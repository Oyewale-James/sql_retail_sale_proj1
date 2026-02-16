DROP TABLE IF EXISTS retail_sales;

CREATE TABLE retail_sales(
transactions_id INT PRIMARY KEY,
sale_date DATE,
sale_time TIME,
customer_id INT,
gender VARCHAR(15),
age INT DEFAULT NULL,
category VARCHAR(20),
quantiy INT,
price_per_unit FLOAT,
cogs FLOAT,
total_sale FLOAT
);

SELECT COUNT(*) FROM retail_sales;
SELECT * FROM retail_sales WHERE transactions_id IN (225, 679, 746, 1225, 1679);

-- DATA CHECK
SELECT * FROM retail_sales
WHERE transactions_id IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR category IS NULL
OR quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL;

-- DATA CLEANING
DELETE FROM retail_sales
WHERE transactions_id IS NULL
OR sale_date IS NULL
OR sale_time IS NULL
OR customer_id IS NULL
OR gender IS NULL
OR category IS NULL
OR quantiy IS NULL
OR price_per_unit IS NULL
OR cogs IS NULL
OR total_sale IS NULL;

-- DATA EXPLORATION

-- HOW MANY SALE WE HAVE
SELECT COUNT(*) AS total_sale FROM retail_sales;

-- how many customers we have
SELECT COUNT(customer_id) AS total_sale FROM retail_sales;

-- how many unique customers we have
SELECT COUNT(DISTINCT customer_id) AS total_sale FROM retail_sales;

SELECT DISTINCT category FROM retail_sales;


-- DATA ANALYSIS AND KEY BUSINESS PROBLEM

-- 1. Write a SQL query to retrieve all columns or sales made on '2022-11-05'
SELECT * FROM retail_sales
WHERE sale_date = '2022-11-05';

SELECT * FROM retail_sales;

-- 2. Write a SQL query to retrieve all transactions where the category is 'clothing' and the quantity sold is more than 10 in the month of Nov 2022.
SELECT category,
SUM(quantiy)
FROM retail_sales
WHERE category = 'clothing'
GROUP BY 1;

SELECT *
FROM retail_sales
WHERE category = 'clothing' AND sale_date LIKE '2022-11-%' AND quantiy >= '4';

SELECT * FROM retail_sales
WHERE category = 'Clothing' AND quantiy > '2' AND sale_date > '2022-10-31' AND sale_date < '2022-12-01';

-- 3. Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category, 
SUM(total_sale) AS net_sale,
COUNT(*) AS total_orders
FROM retail_sales
GROUP BY (category);

-- 4. Write a SQL query to find the average age of customers who purchase items from 'Beauty' category
SELECT 
ROUND(AVG(age), 2) AS avg_age
FROM retail_sales
WHERE category = 'Beauty';

-- 5. Write a SQL query to find all transaction (transaction_id) made by each gender in each category
SELECT category, gender,
COUNT(*) AS total_transaction
FROM retail_sales
GROUP BY category, gender
ORDER BY 1;

-- 6. Write a SQL query to find all transaction where the total_sale is greater than 1000
SELECT 
*
FROM retail_sales
WHERE total_sale > '1000';

-- 7. Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
SELECT 
year, month, average_sale
FROM
(
SELECT 
YEAR(sale_date) AS year,
MONTH(sale_date) AS month,
AVG(total_sale) AS average_sale,
RANK() OVER(PARTITION BY YEAR(sale_date) ORDER BY AVG(total_sale) DESC) as ranks
FROM retail_sales
GROUP BY 1,2
) AS t1
WHERE ranks = 1;

-- ORDER BY 1,3 DESC
-- OR we can use this
-- EXTRACT(YEAR FROM sale_date) AS year,
-- EXTRACT(MONTH FROM sale_date) AS month,

-- 8. Write a SQL query to find the top 5 customers based on the highest total sales;

SELECT customer_id,
SUM(total_sale) AS total_sale
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

-- 9. Write a SQL query to find the number of unique customers who purchase items from each category
SELECT
category,
COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;

-- 10. Write a SQL query to create each shift and number of orders (Example Morning <= 12, Afternoon Between 12&17, Evening >17)

-- CTE Common Table Expression

WITH hourly_sale
AS
(
SELECT *,
CASE -- CASE STUDY IN SQL
WHEN HOUR(sale_time) < 12  THEN 'Morning'
WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
ELSE 'Evening'
END AS shift
FROM retail_sales
)
SELECT shift,
COUNT(*) AS total_order
FROM hourly_sale
GROUP BY shift;

SELECT HOUR(CURRENT_TIME)

-- END OF PROJECT
