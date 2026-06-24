--liquibase formatted sql
 
--changeset asmith:012 labels:sequences
--comment Create INVOICES table that uses the invoice sequence as its default
CREATE TABLE IF NOT EXISTS INVOICES (
    invoice_id      NUMBER DEFAULT SEQ_INVOICE_NUMBER.NEXTVAL PRIMARY KEY,
    order_id        NUMBER          NOT NULL,
    issued_date     DATE            NOT NULL DEFAULT CURRENT_DATE,
    total_amount    NUMBER(14, 2)   NOT NULL,
    paid            BOOLEAN         DEFAULT FALSE
);
--rollback DROP TABLE INVOICES;