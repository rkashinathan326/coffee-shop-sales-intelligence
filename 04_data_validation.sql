-- Coffee Shop Sales Intelligence | Validation

SELECT COUNT(*) AS fact_rows FROM fact_sales;

SELECT 'dim_date' AS table_name, COUNT(*) AS row_count FROM dim_date
UNION ALL SELECT 'dim_time', COUNT(*) FROM dim_time
UNION ALL SELECT 'dim_product', COUNT(*) FROM dim_product
UNION ALL SELECT 'dim_store', COUNT(*) FROM dim_store
UNION ALL SELECT 'fact_sales', COUNT(*) FROM fact_sales;

SELECT COUNT(*) AS orphaned_dates
FROM fact_sales f LEFT JOIN dim_date d ON f.date_key=d.date_key
WHERE d.date_key IS NULL;

SELECT COUNT(*) AS orphaned_products
FROM fact_sales f LEFT JOIN dim_product p ON f.product_id=p.product_id
WHERE p.product_id IS NULL;

SELECT COUNT(*) AS orphaned_stores
FROM fact_sales f LEFT JOIN dim_store s ON f.store_id=s.store_id
WHERE s.store_id IS NULL;

SELECT COUNT(*) AS orphaned_times
FROM fact_sales f LEFT JOIN dim_time t ON f.time_key=t.time_key
WHERE t.time_key IS NULL;

SELECT SUM(revenue) AS total_revenue FROM fact_sales;
SELECT COUNT(*) AS total_transactions FROM fact_sales;
SELECT SUM(units) AS total_units FROM fact_sales;
