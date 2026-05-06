-- Q1: Which country generates the highest net revenue?
SELECT country,
       SUM(net_revenue) AS total_sales
FROM sales.fact_sales
GROUP BY country
ORDER BY total_sales DESC;

-- Q2: YoY Growth by Country ?
SELECT 
country,
EXTRACT(YEAR FROM transaction_date) AS year,
SUM(net_revenue) AS total_sales
FROM sales.fact_sales
GROUP BY country, year
ORDER BY country, year;

-- Q3: Seasonal Trends by month?
SELECT 
DATE_TRUNC('month', transaction_date) AS month,
SUM(net_revenue) AS monthly_sales
FROM sales.fact_sales
GROUP BY month
ORDER BY month;

