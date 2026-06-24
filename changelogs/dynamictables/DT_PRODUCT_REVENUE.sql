--liquibase formatted sql
 
--changeset asmith:021 labels:dynamic-tables
--comment Dynamic table: product revenue with margin — replaces MV since Snowflake MVs don't support JOINs
CREATE OR REPLACE DYNAMIC TABLE DT_PRODUCT_REVENUE
    TARGET_LAG = '1 minute'
    WAREHOUSE = CUSTOMERSUCCESS_WH
AS
SELECT
    so.product_id,
    p.product_name,
    p.category,
    COUNT(*)                                        AS times_ordered,
    SUM(so.quantity)                                AS total_units_sold,
    SUM(so.quantity * so.unit_price)                AS total_revenue,
    SUM(so.quantity * so.unit_price)
        - SUM(so.quantity * p.cost_price)           AS total_margin
FROM SALES_ORDERS so
JOIN PRODUCTS p ON p.product_id = so.product_id
WHERE so.status = 'COMPLETE'
GROUP BY so.product_id, p.product_name, p.category;
--rollback DROP DYNAMIC TABLE IF EXISTS DT_PRODUCT_REVENUE;