CREATE TABLE sales.fact_sales (
    transaction_id VARCHAR PRIMARY KEY,
    transaction_date DATE NOT NULL,
    country VARCHAR(50) NOT NULL,
    product_id VARCHAR(50) NOT NULL,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price_per_unit NUMERIC(10,2) NOT NULL,
    quantity_purchased INT NOT NULL,
    cost_price NUMERIC(10,2) NOT NULL,
    discount_applied NUMERIC(5,2),

    payment_method VARCHAR(30),
    customer_age_group VARCHAR(20),
    customer_gender VARCHAR(10),
    store_location VARCHAR(50),
    sales_rep VARCHAR(100),

    gross_revenue NUMERIC(12,2),
    discount_amount NUMERIC(12,2),
    net_revenue NUMERIC(12,2),
    total_cost NUMERIC(12,2),
    total_profit NUMERIC(12,2),
    profit_margin NUMERIC(6,2)
);
