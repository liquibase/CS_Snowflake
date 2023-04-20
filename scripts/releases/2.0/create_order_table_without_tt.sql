--liquibase formatted sql

--changeset asmith:create_order_table_without_tt labels:JIRA-5234
create or replace table order_table (
    orderkey number(38,0),
    custkey number(38,0)
)
;
--rollback drop table order_table