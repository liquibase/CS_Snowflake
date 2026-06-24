--liquibase formatted sql
 
--changeset asmith:001 labels:setup
--comment Create SALES_ORDERS base table
CREATE TABLE IF NOT EXISTS SALES_ORDERS (
    order_id        NUMBER AUTOINCREMENT PRIMARY KEY,
    customer_id     NUMBER          NOT NULL,
    product_id      NUMBER          NOT NULL,
    region          VARCHAR(50)     NOT NULL,
    order_date      DATE            NOT NULL,
    quantity        NUMBER          NOT NULL,
    unit_price      NUMBER(12, 2)   NOT NULL,
    status          VARCHAR(20)     DEFAULT 'PENDING'
);
--rollback DROP TABLE SALES_ORDERS;