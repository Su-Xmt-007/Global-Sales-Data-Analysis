CREATE TABLE staging.sales_error_log (
    error_id SERIAL PRIMARY KEY,
    transaction_id TEXT,
    error_reason TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
