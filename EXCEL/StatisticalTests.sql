-- Do Adults and Seniors purchase different quantities?
SELECT customer_age_group, quantity_purchased
FROM sales.fact_sales
WHERE customer_age_group IN ('Adult','Senior');


-- Does profit margin differ by store location?
SELECT store_location, profit_margin
FROM sales.fact_sales;


--Is payment method preference dependent on customer age group?
SELECT customer_age_group, payment_method
FROM sales.fact_sales;



SELECT
    customer_age_group,
    store_location,
    quantity_purchased,
    discount_applied,
    profit_margin,
    payment_method
FROM sales.fact_sales;

