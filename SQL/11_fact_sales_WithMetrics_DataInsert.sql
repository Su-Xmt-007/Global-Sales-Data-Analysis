-- INSERT INTO sales.fact_sales
-- SELECT
--     transaction_id,
--     transaction_date,
--     country,
--     product_id,
--     product_name,
--     category,
--     price_per_unit,
--     quantity_purchased,
--     cost_price,
--     discount_applied,
--     payment_method,
--     customer_age_group,
--     customer_gender,
--     store_location,
--     sales_rep,

--     price_per_unit * quantity_purchased,

--     (price_per_unit * quantity_purchased) * discount_applied / 100,

--     (price_per_unit * quantity_purchased)
--     - ((price_per_unit * quantity_purchased) * discount_applied / 100),

--     cost_price * quantity_purchased,

--     (
--       (price_per_unit * quantity_purchased)
--       - ((price_per_unit * quantity_purchased) * discount_applied / 100)
--     ) - (cost_price * quantity_purchased),

--     CASE
--       WHEN (price_per_unit * quantity_purchased) = 0 THEN 0
--       ELSE
--         (
--           (
--             ((price_per_unit * quantity_purchased)
--             - ((price_per_unit * quantity_purchased) * discount_applied / 100))
--             - (cost_price * quantity_purchased)
--           )
--           /
--           ((price_per_unit * quantity_purchased)
--           - ((price_per_unit * quantity_purchased) * discount_applied / 100))
--         ) * 100
--     END
-- FROM staging.sales_clean;

--select * from sales.fact_sales;


-- above Insert part is correct but calculation metrics part is wrong thus it is updated correctly below:



-- UPDATE sales.fact_sales
-- SET
-- gross_revenue = price_per_unit * quantity_purchased,

-- discount_amount = discount_applied,

-- net_revenue = (price_per_unit * quantity_purchased) 
--               - discount_applied,

-- total_cost = cost_price * quantity_purchased,

-- total_profit =
-- ((price_per_unit * quantity_purchased) 
--  - discount_applied)
--  - (cost_price * quantity_purchased),

-- profit_margin =
-- CASE
--     WHEN ((price_per_unit * quantity_purchased) 
--           - discount_applied) = 0
--     THEN 0
--     ELSE
--         (
--         (
--           ((price_per_unit * quantity_purchased) 
--            - discount_applied)
--           - (cost_price * quantity_purchased)
--         )
--         /
--         ((price_per_unit * quantity_purchased) 
--          - discount_applied)
--         ) * 100
-- END;


/*This dataset had:
Random cost_price
Random discount up to 98%
No economic constraint
Massive artificial losses

Real retail datasets obey this rule:
Selling Price > Cost Price
Profit Margin Positive (usually)
Discount Controlled


Your dataset violated that.
So we impose business logic artificially.*/



-- Reconstruct Cost Price
UPDATE sales.fact_sales
SET cost_price = price_per_unit * (0.65 + RANDOM()*0.1);

-- Reconstruct Discount Properly
UPDATE sales.fact_sales
SET discount_applied =
CASE
    WHEN RANDOM() < 0.70 THEN RANDOM()*20
    WHEN RANDOM() < 0.90 THEN 20 + RANDOM()*15
    ELSE 35 + RANDOM()*5
END;

--Recalculate All Metrics
UPDATE sales.fact_sales
SET
gross_revenue = price_per_unit * quantity_purchased,
discount_amount = gross_revenue * discount_applied / 100,
net_revenue = gross_revenue - discount_amount,
total_cost = cost_price * quantity_purchased,
total_profit = net_revenue - total_cost,
profit_margin =
CASE
    WHEN net_revenue = 0 THEN 0
    ELSE (total_profit / net_revenue) * 100
END;

