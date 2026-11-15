-- Create transactions table
CREATE TABLE event_check (
    transaction_id VARCHAR(50) PRIMARY KEY,
    customer_id BIGINT NOT NULL,
    product_id VARCHAR(50),
    quantity INTEGER,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    transaction_date TIMESTAMP,
    payment_method VARCHAR(50)
);

