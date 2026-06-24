--liquibase formatted sql
 
--changeset asmith:050 labels:functions
--comment SQL UDF: classify customer tier by lifetime spend — callable in any SELECT
CREATE OR REPLACE FUNCTION FN_CLASSIFY_CUSTOMER_TIER(lifetime_spend FLOAT)
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
    CASE
        WHEN lifetime_spend >= 5000 THEN 'PLATINUM'
        WHEN lifetime_spend >= 1000 THEN 'GOLD'
        WHEN lifetime_spend >= 250  THEN 'SILVER'
        ELSE 'STANDARD'
    END
$$;
--rollback DROP FUNCTION FN_CLASSIFY_CUSTOMER_TIER;