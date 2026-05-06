-- Q10: Age group contribution to revenue?
SELECT customer_age_group,
       SUM(net_revenue) AS total_sales
FROM sales.fact_sales
GROUP BY customer_age_group
ORDER BY total_sales DESC;


-- Q11: Payment method preference by country?
SELECT country,
       payment_method,
       COUNT(*) AS transaction_count
FROM sales.fact_sales
GROUP BY country, payment_method
ORDER BY country;


-- Q12: Gender-wise profit contribution?
SELECT customer_gender,
       SUM(total_profit) AS total_profit
FROM sales.fact_sales
GROUP BY customer_gender;


