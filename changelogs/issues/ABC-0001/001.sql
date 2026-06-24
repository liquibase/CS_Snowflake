--liquibase formatted sql

--changeset AmySmith:customers_table_new labels:jira-1234
CREATE OR REPLACE TABLE CUSTOMERS_NEW (
  "ID" INT,
  "first_name" VARCHAR,
  "last_name" VARCHAR,
  "email" VARCHAR,
  "age" INT,
  "city" VARCHAR)
DATA_RETENTION_TIME_IN_DAYS=2; 
--rollback DROP TABLE CUSTOMERS_NEW