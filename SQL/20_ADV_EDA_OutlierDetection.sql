-- OUTLIER DETECTION (Z-SCORE METHOD)
WITH stats AS (
    SELECT
        AVG(profit_margin) AS mean_margin,
        STDDEV(profit_margin) AS std_margin
    FROM sales.fact_sales
)
SELECT
f.*,
(f.profit_margin - s.mean_margin) / s.std_margin AS z_score
FROM sales.fact_sales f, stats s
WHERE ABS((f.profit_margin - s.mean_margin) / s.std_margin) > 3;


-- IQR Method
WITH q AS (
SELECT
PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY net_revenue) AS Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY net_revenue) AS Q3
FROM sales.fact_sales
)
SELECT *
FROM sales.fact_sales, q
WHERE net_revenue < Q1 - 1.5*(Q3-Q1)
   OR net_revenue > Q3 + 1.5*(Q3-Q1);
