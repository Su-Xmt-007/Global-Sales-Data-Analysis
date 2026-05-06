INSERT INTO staging.sales_clean
SELECT
    transaction_id,
    TO_DATE(transaction_date, 'MM/DD/YYYY'),
    country,
    product_id,
    product_name,
    category,
    price_per_unit::NUMERIC,
    quantity_purchased::INT,
    cost_price::NUMERIC,
    discount_applied::NUMERIC,
    payment_method,
    customer_age_group,
    customer_gender,
    store_location,
    sales_rep
FROM raw.sales_raw
WHERE transaction_id NOT IN (
    SELECT DISTINCT transaction_id
    FROM staging.sales_error_log
);
