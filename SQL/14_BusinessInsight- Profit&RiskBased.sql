-- Q4: Top 5 Profitable Categories?
SELECT category,
       SUM(total_profit) AS total_profit
FROM sales.fact_sales
GROUP BY category
ORDER BY total_profit DESC
LIMIT 5;


--Q5: Low Revenue but High Margin Products?
SELECT product_name,
       SUM(net_revenue) AS total_sales,
       AVG(profit_margin) AS avg_margin
FROM sales.fact_sales
GROUP BY product_name
HAVING SUM(net_revenue) < 50000
ORDER BY avg_margin DESC;


-- Q6: Discount vs Profit Erosion  analysis?
SELECT 
discount_applied,
AVG(profit_margin) AS avg_margin
FROM sales.fact_sales
GROUP BY discount_applied
ORDER BY discount_applied;


