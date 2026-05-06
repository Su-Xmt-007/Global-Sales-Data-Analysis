SELECT customer_age_group, quantity_purchased
FROM sales.fact_sales
WHERE customer_age_group IN ('Adult','Senior');
