-- Check Pricing Issue
SELECT country, product_name,
       price_per_unit, cost_price
FROM sales.fact_sales
WHERE profit_margin < 0
AND cost_price > price_per_unit;

-- Check Discount Impact
SELECT country, product_name,
       discount_applied,
       gross_revenue,
       net_revenue,
       total_profit
FROM sales.fact_sales
WHERE profit_margin < 0
ORDER BY discount_applied DESC;


-- Category-Level Loss Pattern
SELECT category,
       COUNT(*) AS loss_transactions,
       SUM(total_profit) AS total_loss
FROM sales.fact_sales
WHERE profit_margin < 0
GROUP BY category
ORDER BY total_loss;

-- country wise check
SELECT 
country,
AVG(profit_margin) AS avg_margin,
SUM(CASE WHEN profit_margin < 0 THEN 1 ELSE 0 END) AS loss_count
FROM sales.fact_sales
GROUP BY country;

SELECT  price_per_unit AS UnitPrice,
		quantity_purchased AS PurchasCount,
		cost_price AS CostPrice,
		discount_applied As Discount,
		total_profit AS Profit, 
		profit_margin
FROM sales.fact_sales

SELECT COUNT(*)
FROM sales.fact_sales
WHERE discount_applied < 98


SELECT MIN(discount_applied), MAX(discount_applied)
FROM sales.fact_sales;