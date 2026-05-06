-- A. Standard Deviation
SELECT 
STDDEV(net_revenue) AS sales_std,
STDDEV(profit_margin) AS margin_std
FROM sales.fact_sales;

-- Coefficient of Variation (net_revenue)
SELECT 
STDDEV(net_revenue)/AVG(net_revenue) AS sales_cv
FROM sales.fact_sales;

-- IQR checking : IQR (Interquartile Range)
SELECT
PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY net_revenue) -
PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY net_revenue) AS IQR
FROM sales.fact_sales;

-- Dispersion by Country
SELECT 
country,
STDDEV(net_revenue) AS sales_volatility
FROM sales.fact_sales
GROUP BY country;











-- Coefficient of Variation (Profit Stability)
SELECT
STDDEV(profit_margin) / AVG(profit_margin) AS coefficient_of_variation
FROM sales.fact_sales;


-- A. Discount vs Quantity: CORRELATION ANALYSIS
SELECT CORR(discount_applied, quantity_purchased)
FROM sales.fact_sales;


-- B. Discount vs Profit Margin: CORRELATION ANALYSIS
SELECT CORR(discount_applied, profit_margin)
FROM sales.fact_sales;


