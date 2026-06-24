--liquibase formatted sql
 
--changeset asmith:002 labels:setup
--comment Create PRODUCTS base table
CREATE TABLE IF NOT EXISTS PRODUCTS (
    product_id      NUMBER          PRIMARY KEY,
    product_name    VARCHAR(100)    NOT NULL,
    category        VARCHAR(50)     NOT NULL,
    cost_price      NUMBER(12, 2)   NOT NULL
);
--rollback DROP TABLE PRODUCTS;