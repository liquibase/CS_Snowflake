--liquibase formatted sql

--changeset asmith:create_order_table_with_tt_03 labels:JIRA-5233
create or replace table order_table_03 (
    orderkey number(38,0),
    custkey number(38,0)
)
data_retention_time_in_days=3
;
--rollback drop table create_order_table_with_tt_03