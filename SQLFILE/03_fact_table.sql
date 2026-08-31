-- Coffee Shop Sales Intelligence | Fact Table

CREATE TABLE IF NOT EXISTS fact_sales (
    transaction_id INTEGER PRIMARY KEY,
    date_key INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    store_id INTEGER NOT NULL,
    time_key INTEGER NOT NULL,
    revenue NUMERIC(12,2),
    units INTEGER,

    CONSTRAINT fk_fact_date
        FOREIGN KEY (date_key) REFERENCES dim_date(date_key),
    CONSTRAINT fk_fact_product
        FOREIGN KEY (product_id) REFERENCES dim_product(product_id),
    CONSTRAINT fk_fact_store
        FOREIGN KEY (store_id) REFERENCES dim_store(store_id),
    CONSTRAINT fk_fact_time
        FOREIGN KEY (time_key) REFERENCES dim_time(time_key)
);

INSERT INTO fact_sales
SELECT
    transaction_id,
    TO_CHAR(transaction_date,'YYYYMMDD')::INTEGER,
    product_id,
    store_id,
    EXTRACT(HOUR FROM transaction_time)::INTEGER,
    revenue,
    units
FROM coffee_shop_sales
WHERE transaction_id IS NOT NULL
ON CONFLICT (transaction_id) DO NOTHING;
