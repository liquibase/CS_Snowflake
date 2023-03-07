--liquibase formatted sql

--changeset AmySmith:customers_table labels:JIRA-5222
CREATE TABLE CUSTOMERS (
  "ID" INT,
  "first_name" VARCHAR,
  "last_name" VARCHAR,
  "email" VARCHAR,
  "age" INT,
  "city" VARCHAR)
DATA_RETENTION_TIME_IN_DAYS=2; 
--rollback DROP TABLE CUSTOMERS
 
--changeset AmySmith:customers_table_load labels:JIRA-5222
COPY INTO CUSTOMERS
    FROM s3://snowflake-assignments-mc/gettingstarted/customers.csv
    file_format = (type = csv 
                   field_delimiter = ',' 
                   skip_header=1)
;
--rollback DELETE FROM CUSTOMERS