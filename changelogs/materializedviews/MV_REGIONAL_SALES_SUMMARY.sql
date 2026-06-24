--liquibase formatted sql
 
--changeset asmith:020 labels:materialized-views
--comment Materialized view: regional sales summary — pre-aggregates revenue by region and month
--        Refresh is handled by Snowflake automatically (within 60 seconds of base table change)
CREATE MATERIALIZED VIEW IF NOT EXISTS MV_REGIONAL_SALES_SUMMARY AS
SELECT
    region,
    DATE_TRUNC('MONTH', order_date)     AS sales_month,
    COUNT(*)                            AS order_count,
    SUM(quantity)                       AS total_units_sold,
    SUM(quantity * unit_price)          AS gross_revenue,
    AVG(unit_price)                     AS avg_unit_price
FROM SALES_ORDERS
WHERE status = 'COMPLETE'
GROUP BY region, DATE_TRUNC('MONTH', order_date);
--rollback DROP MATERIALIZED VIEW MV_REGIONAL_SALES_SUMMARY;