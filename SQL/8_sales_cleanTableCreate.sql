CREATE TABLE staging.sales_clean (
    transaction_id VARCHAR PRIMARY KEY,
    transaction_date DATE NOT NULL,
    country VARCHAR(50) NOT NULL,
    product_id VARCHAR(50) NOT NULL,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price_per_unit NUMERIC(10,2) CHECK (price_per_unit >= 0),
    quantity_purchased INT CHECK (quantity_purchased >= 0),
    cost_price NUMERIC(10,2) CHECK (cost_price >= 0),
    discount_applied NUMERIC(5,2) CHECK (discount_applied BETWEEN 0 AND 100),
    payment_method VARCHAR(30),
    customer_age_group VARCHAR(20),
    customer_gender VARCHAR(10),
    store_location VARCHAR(50),
    sales_rep VARCHAR(100)
);
