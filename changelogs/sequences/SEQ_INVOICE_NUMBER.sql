--liquibase formatted sql
 
--changeset asmith:010 labels:sequences
--comment Sequence for generating invoice numbers (starts at 10000, increments by 1)
CREATE SEQUENCE IF NOT EXISTS SEQ_INVOICE_NUMBER
    START = 10000
    INCREMENT = 1
    COMMENT = 'Generates unique invoice numbers for the billing system';
--rollback DROP SEQUENCE SEQ_INVOICE_NUMBER;