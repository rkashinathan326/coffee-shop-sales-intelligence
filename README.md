# coffee-shop-sales-intelligence
End-to-end Coffee Shop Sales Intelligence project using PostgreSQL, SQL, Power BI, and DAX. Built a star-schema data model, performed sales analysis, and developed interactive dashboards to identify revenue trends, store and product performance, peak sales hours, and weekday vs weekend patterns.

## Project Overview

This project analyzes coffee shop transaction data to understand revenue trends, store performance, product performance and sales patterns across different time periods.

The project follows an end-to-end analytics workflow:

Raw Data → PostgreSQL → SQL Transformation → Star Schema → Power BI → DAX → Business Insights

## Objectives

- Analyze overall sales and revenue performance
- Identify monthly revenue trends
- Compare store-level performance
- Analyze product and category performance
- Identify peak sales hours
- Compare weekday and weekend revenue
- Build an interactive Business Intelligence dashboard

## Tech Stack

- PostgreSQL
- SQL
- Power BI
- DAX
- Data Modeling
- Star Schema
- Data Visualization

## Data Model

The project uses a star-schema architecture consisting of:

### Fact Table

- `fact_sales`

### Dimension Tables

- `dim_date`
- `dim_time`
- `dim_product`
- `dim_store`

The fact table contains transactional sales data, while the dimension tables provide descriptive attributes for analysis.

## Power BI Dashboard

### Executive Overview

The first dashboard provides a high-level view of:

- Total Revenue
- Total Transactions
- Units Sold
- Average Transaction Value
- Monthly Revenue Trend
- Store Revenue Performance
- Category Revenue Performance

### Sales Insights

The second dashboard focuses on:

- Revenue by Hour
- Weekday vs Weekend Revenue
- Top Products by Revenue
- Peak Sales Hour
- Top Product
- Best Performing Store
- Weekend Revenue Contribution

## Key Metrics

The dashboard currently reports approximately:

- Total Revenue: $698.81K
- Total Transactions: 149.12K
- Units Sold: 214.47K
- Average Transaction Value: $4.69

## Key Business Questions

The analysis answers questions such as:

1. How much revenue does the coffee shop generate?
2. Which month generates the highest revenue?
3. Which store performs best?
4. Which product category generates the most revenue?
5. Which products contribute the most revenue?
6. What is the peak sales hour?
7. How does weekday revenue compare with weekend revenue?

## Project Workflow

1. Imported the dataset into PostgreSQL
2. Performed data profiling and validation
3. Designed a dimensional data model
4. Created fact and dimension tables
5. Loaded and validated transformed data
6. Connected PostgreSQL with Power BI
7. Created DAX measures
8. Developed interactive dashboards
9. Analyzed sales patterns and revenue drivers

## Future Enhancement

A lightweight AI-assisted analysis component will be added to identify additional patterns and revenue drivers without introducing unnecessary model complexity.

## Author 
R KASHINATHAN

[Your Name]
