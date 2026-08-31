-- Coffee Shop Sales Intelligence | Business Analysis

-- Overall KPIs
SELECT SUM(revenue) AS total_revenue FROM fact_sales;

SELECT COUNT(*) AS total_transactions FROM fact_sales;

SELECT ROUND(SUM(revenue)/NULLIF(COUNT(*),0),2)
       AS average_transaction_value
FROM fact_sales;

SELECT SUM(units) AS total_units_sold FROM fact_sales;


-- Store performance
SELECT s.store_location, SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_store s ON f.store_id=s.store_id
GROUP BY s.store_location
ORDER BY total_revenue DESC;

SELECT s.store_location, SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_store s ON f.store_id=s.store_id
GROUP BY s.store_location
ORDER BY total_revenue DESC
LIMIT 1;


-- Category performance
SELECT p.product_category, SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_product p ON f.product_id=p.product_id
GROUP BY p.product_category
ORDER BY total_revenue DESC;

SELECT p.product_category, SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_product p ON f.product_id=p.product_id
GROUP BY p.product_category
ORDER BY total_revenue DESC
LIMIT 1;


-- Top 10 products
SELECT p.product_detail, SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_product p ON f.product_id=p.product_id
GROUP BY p.product_detail
ORDER BY total_revenue DESC
LIMIT 10;


-- Revenue by hour / peak hour
SELECT t.hour, t.hour_label, SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_time t ON f.time_key=t.time_key
GROUP BY t.hour, t.hour_label
ORDER BY t.hour;

SELECT t.hour, t.hour_label, SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_time t ON f.time_key=t.time_key
GROUP BY t.hour, t.hour_label
ORDER BY total_revenue DESC
LIMIT 1;


-- Monthly revenue / best month
SELECT d.year, d.month, d.month_name, SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_date d ON f.date_key=d.date_key
GROUP BY d.year, d.month, d.month_name
ORDER BY d.year, d.month;

SELECT d.year, d.month, d.month_name, SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_date d ON f.date_key=d.date_key
GROUP BY d.year, d.month, d.month_name
ORDER BY total_revenue DESC
LIMIT 1;


-- Weekday vs weekend
SELECT
    CASE WHEN d.is_weekend THEN 'Weekend' ELSE 'Weekday' END AS day_type,
    SUM(f.revenue) AS total_revenue,
    COUNT(*) AS total_transactions
FROM fact_sales f
JOIN dim_date d ON f.date_key=d.date_key
GROUP BY d.is_weekend
ORDER BY total_revenue DESC;

SELECT ROUND(
    100.0 * SUM(CASE WHEN d.is_weekend THEN f.revenue ELSE 0 END)
    / NULLIF(SUM(f.revenue),0), 2
) AS weekend_revenue_percentage
FROM fact_sales f
JOIN dim_date d ON f.date_key=d.date_key;


-- Cross-analysis
SELECT s.store_location, p.product_category,
       SUM(f.revenue) AS total_revenue
FROM fact_sales f
JOIN dim_store s ON f.store_id=s.store_id
JOIN dim_product p ON f.product_id=p.product_id
GROUP BY s.store_location, p.product_category
ORDER BY total_revenue DESC;
