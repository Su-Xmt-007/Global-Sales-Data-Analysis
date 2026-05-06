--A.	Sample Size by Group
SELECT customer_age_group,
COUNT(*)
FROM sales.fact_sales
GROUP BY customer_age_group;


--Variance Homogeneity
SELECT customer_age_group,
VARIANCE(quantity_purchased)
FROM sales.fact_sales
GROUP BY customer_age_group;


