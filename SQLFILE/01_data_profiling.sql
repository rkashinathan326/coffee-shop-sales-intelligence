-- Coffee Shop Sales Intelligence | Data Profiling

SELECT COUNT(*) AS total_rows FROM coffee_shop_sales;

SELECT * FROM coffee_shop_sales LIMIT 10;

SELECT transaction_id, COUNT(*) AS duplicate_count
FROM coffee_shop_sales
GROUP BY transaction_id
HAVING COUNT(*) > 1
ORDER BY duplicate_count DESC;

SELECT
    COUNT(*) FILTER (WHERE transaction_date IS NULL) AS null_date,
    COUNT(*) FILTER (WHERE transaction_time IS NULL) AS null_time,
    COUNT(*) FILTER (WHERE transaction_id IS NULL) AS null_transaction_id,
    COUNT(*) FILTER (WHERE store_id IS NULL) AS null_store_id,
    COUNT(*) FILTER (WHERE product_id IS NULL) AS null_product_id,
    COUNT(*) FILTER (WHERE revenue IS NULL) AS null_revenue,
    COUNT(*) FILTER (WHERE units IS NULL) AS null_units
FROM coffee_shop_sales;

SELECT MIN(transaction_date) AS first_date,
       MAX(transaction_date) AS last_date
FROM coffee_shop_sales;

SELECT DISTINCT store_id FROM coffee_shop_sales ORDER BY store_id;
SELECT DISTINCT product_category FROM coffee_shop_sales ORDER BY product_category;

SELECT MIN(revenue) AS min_revenue, MAX(revenue) AS max_revenue,
       AVG(revenue) AS avg_revenue, MIN(units) AS min_units,
       MAX(units) AS max_units
FROM coffee_shop_sales;
