
-- Negetive Profits Detection (Profit Margin)
SELECT country, product_name, category, store_location, sales_rep, total_profit, profit_margin
FROM sales.fact_sales
WHERE profit_margin < 0;






-- Basic sales Health 
SELECT 
COUNT(*) AS total_transactions,
ROUND(SUM(net_revenue),2) AS total_sales,
ROUND(SUM(total_profit),2) AS total_profit,
ROUND(AVG(profit_margin),2) AS avg_margin,
ROUND(AVG(discount_applied),2) AS avg_discount
FROM sales.fact_sales;


-- Sales Time Span Validation
SELECT 
MIN(transaction_date) AS start_date,
MAX(transaction_date) AS end_date,
DATE_PART('year', AGE(MAX(transaction_date), MIN(transaction_date))) AS total_years
FROM sales.fact_sales;

-- NULL Check
SELECT 
COUNT(*) FILTER (WHERE transaction_id IS NULL) AS null_transaction_id,
COUNT(*) FILTER (WHERE net_revenue IS NULL) AS null_revenue,
COUNT(*) FILTER (WHERE total_profit IS NULL) AS null_profit
FROM sales.fact_sales;

-- Duplicate Integrity Check
SELECT COUNT(*)
FROM (
    SELECT transaction_id
    FROM sales.fact_sales
    GROUP BY transaction_id
    HAVING COUNT(*) > 1
) duplicates;

-- Outlier Detection (Profit Margin)
SELECT *
FROM sales.fact_sales
WHERE profit_margin > 60 OR profit_margin < -20;

SELECT 
PERCENTILE_CONT(0.95) WITHIN GROUP (ORDER BY profit_margin) AS p95,
PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY profit_margin) AS p99
FROM sales.fact_sales;

