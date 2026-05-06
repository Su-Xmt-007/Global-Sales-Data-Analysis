-- 1. Check Negative Price
INSERT INTO staging.sales_error_log (transaction_id, error_reason)
SELECT transaction_id, 'Negative Price Per Unit'
FROM raw.sales_raw
WHERE price_per_unit::NUMERIC < 0;

-- 2. Check Negative Quantity
INSERT INTO staging.sales_error_log (transaction_id, error_reason)
SELECT transaction_id, 'Negative Quantity'
FROM raw.sales_raw
WHERE quantity_purchased::INT < 0;

-- 3. Discount Outside 0–100%
INSERT INTO staging.sales_error_log (transaction_id, error_reason)
SELECT transaction_id, 'Invalid Discount %'
FROM raw.sales_raw
WHERE discount_applied::NUMERIC < 0
   OR discount_applied::NUMERIC > 100;

-- 4. Future Dates
INSERT INTO staging.sales_error_log (transaction_id, error_reason)
SELECT transaction_id, 'Future Transaction Date'
FROM raw.sales_raw
WHERE TO_DATE(transaction_date, 'MM/DD/YYYY') > CURRENT_DATE;

-- 5. Invalid Country Check
INSERT INTO staging.sales_error_log (transaction_id, error_reason)
SELECT transaction_id, 'Invalid Country'
FROM raw.sales_raw
WHERE country NOT IN ('Canada','China','India','Nigeria','UK','US');

-- 6. Invalid Gender
INSERT INTO staging.sales_error_log (transaction_id, error_reason)
SELECT transaction_id, 'Invalid Gender'
FROM raw.sales_raw
WHERE customer_gender NOT IN ('Male','Female','Other');

-- 7. Invalid Age Group
INSERT INTO staging.sales_error_log (transaction_id, error_reason)
SELECT transaction_id, 'Invalid Age Group'
FROM raw.sales_raw
WHERE customer_age_group NOT IN ('Youth','Adult','Senior');

-- 8. Cost > Price (Possible Data Entry Error)
INSERT INTO staging.sales_error_log (transaction_id, error_reason)
SELECT transaction_id, 'Cost Greater Than Selling Price'
FROM raw.sales_raw
WHERE cost_price::NUMERIC > price_per_unit::NUMERIC;

-- 9. Extreme Outlier (Price > 10,000 Example Threshold)
INSERT INTO staging.sales_error_log (transaction_id, error_reason)
SELECT transaction_id, 'Extreme Price Outlier'
FROM raw.sales_raw
WHERE price_per_unit::NUMERIC > 10000;

SELECT * FROM staging.sales_error_log;
-- TRUNCATE TABLE  staging.sales_error_log;






---- NULL Checking for important columns ----

--      ****** Method-1 ******
INSERT INTO staging.sales_error_log (transaction_id, error_reason)
SELECT transaction_id, 'Missing price_per_unit' FROM raw.sales_raw WHERE price_per_unit IS NULL OR TRIM(price_per_unit) = ''
UNION ALL
SELECT transaction_id, 'Missing quantity_purchased' FROM raw.sales_raw WHERE quantity_purchased IS NULL OR TRIM(quantity_purchased) = ''
UNION ALL
SELECT transaction_id, 'Missing cost_price' FROM raw.sales_raw WHERE cost_price IS NULL OR TRIM(cost_price) = ''
UNION ALL
SELECT transaction_id, 'Missing discount_applied' FROM raw.sales_raw WHERE discount_applied IS NULL OR TRIM(discount_applied) = ''
UNION ALL
SELECT transaction_id, 'Missing transaction_date' FROM raw.sales_raw WHERE transaction_date IS NULL OR TRIM(transaction_date) = ''
UNION ALL
SELECT transaction_id, 'Missing country' FROM raw.sales_raw WHERE country IS NULL OR TRIM(country) = '';

-- 			***** Method-2 *****
INSERT INTO staging.sales_error_log (transaction_id, error_reason)
SELECT r.transaction_id, err.reason
FROM raw.sales_raw r
CROSS JOIN LATERAL (
    VALUES 
        (price_per_unit, 'Missing price_per_unit'),
        (quantity_purchased, 'Missing quantity_purchased'),
        (cost_price, 'Missing cost_price'),
        (discount_applied, 'Missing discount_applied'),
        (transaction_date, 'Missing transaction_date'),
        (country, 'Missing country')
) AS err(val, reason)
WHERE err.val IS NULL OR TRIM(err.val) = '';

SELECT * FROM staging.sales_error_log;

