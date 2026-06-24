--liquibase formatted sql
 
--changeset demo:003 labels:setup 
--comment Create CUSTOMERS base table
CREATE TABLE IF NOT EXISTS CUSTOMERS (
    customer_id     NUMBER          PRIMARY KEY,
    customer_name   VARCHAR(100)    NOT NULL,
    email           VARCHAR(100),
    tier            VARCHAR(20)     DEFAULT 'STANDARD'
);
--rollback DROP TABLE CUSTOMERS;