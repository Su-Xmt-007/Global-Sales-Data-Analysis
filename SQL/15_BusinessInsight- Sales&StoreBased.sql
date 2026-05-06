-- Q7: Top 10 performing sales reps by profit?
SELECT sales_rep,
       SUM(total_profit) AS total_profit
FROM sales.fact_sales
GROUP BY sales_rep
ORDER BY total_profit DESC LIMIT 5;


--Q8: Store locations with consistent losses?
SELECT store_location,
       SUM(total_profit) AS total_profit
FROM sales.fact_sales
GROUP BY store_location
HAVING SUM(total_profit) < 0;


--Q9: Avg basket size per store?
SELECT store_location,
       AVG(quantity_purchased) AS avg_basket
FROM sales.fact_sales
GROUP BY store_location li;

