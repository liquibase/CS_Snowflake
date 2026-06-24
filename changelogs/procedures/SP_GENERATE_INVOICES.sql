--liquibase formatted sql
 
--changeset asmith:040 labels:procedures splitStatements:false stripComments:false
--comment Procedure: generate invoices for all completed but uninvoiced orders
CREATE OR REPLACE PROCEDURE SP_GENERATE_INVOICES()
RETURNS VARCHAR
LANGUAGE SQL
AS
$$
DECLARE
    rows_inserted INTEGER DEFAULT 0;
BEGIN
    INSERT INTO INVOICES (order_id, issued_date, total_amount, paid)
    SELECT
        o.order_id,
        CURRENT_DATE,
        SUM(o.quantity * o.unit_price),
        FALSE
    FROM SALES_ORDERS o
    LEFT JOIN INVOICES i ON i.order_id = o.order_id
    WHERE o.status   = 'COMPLETE'
      AND i.order_id IS NULL
    GROUP BY o.order_id;
 
    rows_inserted := SQLROWCOUNT;
    RETURN 'Invoices generated: ' || rows_inserted;
END;
$$;
--rollback DROP PROCEDURE SP_GENERATE_INVOICES;