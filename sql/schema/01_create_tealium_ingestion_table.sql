-- Create customers table
CREATE TABLE tealium_ingestion (
    customer_id BIGINT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    registration_date TIMESTAMP,
    country VARCHAR(100),
    age_group VARCHAR(10)
);

-- Add foreign key
ALTER TABLE tealium_ingestion 
ADD CONSTRAINT fk_transactions_customer 
FOREIGN KEY (customer_id) REFERENCES customers(customer_id);