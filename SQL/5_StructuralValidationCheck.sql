-- --Check Null Transaction IDs
-- INSERT INTO staging.sales_error_log(transaction_id,error_reason)
-- SELECT transaction_id, 'Missing Transaction ID'
-- FROM raw.sales_raw
-- WHERE transaction_id IS NULL OR transaction_id = '';


-- --Check Duplicate Transaction IDs
-- INSERT INTO staging.sales_error_log (transaction_id, error_reason)
-- SELECT transaction_id, 'Duplicate Transaction ID'
-- FROM raw.sales_raw
-- GROUP BY transaction_id
-- HAVING COUNT(*) > 1;


-- --Check Invalid Numeric Values
-- INSERT INTO staging.sales_error_log (transaction_id, error_reason)
-- SELECT transaction_id, 'Invalid price_per_unit'
-- FROM raw.sales_raw
-- WHERE price_per_unit !~ '^[0-9]+(\.[0-9]+)?$';


-- --Check Invalid Dates
-- INSERT INTO staging.sales_error_log (transaction_id, error_reason)
-- SELECT transaction_id, 'Invalid Date Format'
-- FROM raw.sales_raw
-- WHERE transaction_date !~ '^\d{1,2}/\d{1,2}/\d{4}$';


SELECT * FROM staging.sales_error_log;
