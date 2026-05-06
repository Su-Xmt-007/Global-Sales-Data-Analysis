-- A. Mean, Median, Std Dev (Profit Margin)
SELECT
AVG(profit_margin) AS mean_margin,
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY profit_margin) AS median_margin,
STDDEV(profit_margin) AS std_dev_margin
FROM sales.fact_sales;


-- B. 	Profit Margin Distribution Bucketing
SELECT
WIDTH_BUCKET(profit_margin, -50, 50, 10) AS bucket,
COUNT(*) AS frequency
FROM sales.fact_sales
GROUP BY bucket
ORDER BY bucket;


-- C. Revenue Distribution
WITH stats AS (
    SELECT 
        MIN(net_revenue) AS min_rev,
        MAX(net_revenue) AS max_rev
    FROM sales.fact_sales
)

SELECT 
WIDTH_BUCKET(f.net_revenue, s.min_rev, s.max_rev, 10) AS revenue_bucket,
COUNT(*) 
FROM sales.fact_sales f, stats s
GROUP BY revenue_bucket
ORDER BY revenue_bucket;

-- D.	Discount Distribution Bucketing
SELECT 
WIDTH_BUCKET(discount_applied, 0, 50, 10) AS discount_bucket,
COUNT(*)
FROM sales.fact_sales
GROUP BY discount_bucket
ORDER BY discount_bucket;


-- D.	Quantity Distribution 

SELECT 
PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY quantity_purchased) AS median_qty,
AVG(quantity_purchased)  AS avg_quantity_purchased,
STDDEV(quantity_purchased)
FROM sales.fact_sales;



