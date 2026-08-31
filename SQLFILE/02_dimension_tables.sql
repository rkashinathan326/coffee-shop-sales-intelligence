-- Coffee Shop Sales Intelligence | Dimension Tables

CREATE TABLE IF NOT EXISTS dim_date (
    date_key INTEGER PRIMARY KEY,
    date DATE NOT NULL,
    year INTEGER,
    quarter INTEGER,
    month INTEGER,
    month_name VARCHAR(20),
    day INTEGER,
    day_name VARCHAR(20),
    day_of_week INTEGER,
    is_weekend BOOLEAN
);

INSERT INTO dim_date
SELECT DISTINCT
    TO_CHAR(transaction_date,'YYYYMMDD')::INTEGER,
    transaction_date,
    EXTRACT(YEAR FROM transaction_date)::INTEGER,
    EXTRACT(QUARTER FROM transaction_date)::INTEGER,
    EXTRACT(MONTH FROM transaction_date)::INTEGER,
    TO_CHAR(transaction_date,'FMMonth'),
    EXTRACT(DAY FROM transaction_date)::INTEGER,
    TO_CHAR(transaction_date,'FMDay'),
    EXTRACT(ISODOW FROM transaction_date)::INTEGER,
    EXTRACT(ISODOW FROM transaction_date) IN (6,7)
FROM coffee_shop_sales
WHERE transaction_date IS NOT NULL
ON CONFLICT (date_key) DO NOTHING;


CREATE TABLE IF NOT EXISTS dim_time (
    time_key INTEGER PRIMARY KEY,
    hour INTEGER NOT NULL,
    hour_label VARCHAR(20),
    period VARCHAR(20)
);

INSERT INTO dim_time
SELECT DISTINCT
    EXTRACT(HOUR FROM transaction_time)::INTEGER,
    EXTRACT(HOUR FROM transaction_time)::INTEGER,
    TO_CHAR(transaction_time,'HH AM'),
    CASE
        WHEN EXTRACT(HOUR FROM transaction_time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM transaction_time) BETWEEN 12 AND 16 THEN 'Afternoon'
        WHEN EXTRACT(HOUR FROM transaction_time) BETWEEN 17 AND 20 THEN 'Evening'
        ELSE 'Other'
    END
FROM coffee_shop_sales
WHERE transaction_time IS NOT NULL
ON CONFLICT (time_key) DO NOTHING;


CREATE TABLE IF NOT EXISTS dim_product (
    product_id INTEGER PRIMARY KEY,
    product_category VARCHAR(100),
    product_type VARCHAR(100),
    product_detail VARCHAR(200)
);

INSERT INTO dim_product
SELECT DISTINCT product_id, product_category, product_type, product_detail
FROM coffee_shop_sales
WHERE product_id IS NOT NULL
ON CONFLICT (product_id) DO NOTHING;


CREATE TABLE IF NOT EXISTS dim_store (
    store_id INTEGER PRIMARY KEY,
    store_location VARCHAR(100)
);

INSERT INTO dim_store
SELECT DISTINCT store_id, store_location
FROM coffee_shop_sales
WHERE store_id IS NOT NULL
ON CONFLICT (store_id) DO NOTHING;
