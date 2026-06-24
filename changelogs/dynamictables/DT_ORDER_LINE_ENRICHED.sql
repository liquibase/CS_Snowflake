--liquibase formatted sql
 
--changeset asmith:031 labels:dynamic-tables context:demo
--comment Dynamic table: enriched order line items — joins orders to products for downstream BI tools
CREATE OR REPLACE DYNAMIC TABLE DT_ORDER_LINE_ENRICHED
    TARGET_LAG = '2 minutes'
    WAREHOUSE = CUSTOMERSUCCESS_WH
AS
SELECT
    so.order_id,
    so.order_date,
    so.region,
    so.status,
    c.customer_name,
    c.tier                              AS customer_tier,
    p.product_name,
    p.category                          AS product_category,
    so.quantity,
    so.unit_price,
    so.quantity * so.unit_price         AS line_total,
    so.unit_price - p.cost_price        AS unit_margin
FROM SALES_ORDERS so
JOIN CUSTOMERS c ON c.customer_id = so.customer_id
JOIN PRODUCTS  p ON p.product_id  = so.product_id;
--rollback DROP DYNAMIC TABLE IF EXISTS DT_ORDER_LINE_ENRICHED;