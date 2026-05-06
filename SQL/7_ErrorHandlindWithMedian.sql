-- Step 1 — Calculate Median Price
SELECT 
PERCENTILE_CONT(0.5) 
WITHIN GROUP (ORDER BY price_per_unit::NUMERIC) 
AS median_price
FROM raw.sales_raw
WHERE price_per_unit IS NOT NULL
AND price_per_unit <> '';


-- Step 2 — Calculate Median Quantity
SELECT 
PERCENTILE_CONT(0.5) 
WITHIN GROUP (ORDER BY quantity_purchased::INT) 
AS median_quantity
FROM raw.sales_raw
WHERE quantity_purchased IS NOT NULL
AND quantity_purchased <> '';


--Step 3 — Replace Missing With Median
UPDATE raw.sales_raw
SET price_per_unit = '256.485'
WHERE price_per_unit IS NULL OR price_per_unit = '';

UPDATE raw.sales_raw
SET quantity_purchased = '5'
WHERE quantity_purchased IS NULL OR quantity_purchased = '';

