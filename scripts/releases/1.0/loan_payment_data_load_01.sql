--liquibase formatted sql

--changeset AmySmith:loan_payment_table labels:JIRA-5678
CREATE TABLE LOAN_PAYMENT (
  "Loan_ID" STRING,
  "loan_status" STRING,
  "Principal" STRING,
  "terms" STRING,
  "effective_date" STRING,
  "due_date" STRING,
  "paid_off_time" STRING,
  "past_due_days" STRING,
  "age" STRING,
  "education" STRING,
  "Gender" STRING)
DATA_RETENTION_TIME_IN_DAYS=2; 
;
--rollback DROP TABLE LOAN_PAYMENT
 
--changeset AmySmith:loan_payment_table_load labels:JIRA-5678
COPY INTO LOAN_PAYMENT
    FROM s3://bucketsnowflakes3/Loan_payments_data.csv
    file_format = (type = csv 
                   field_delimiter = ',' 
                   skip_header=1)
;
--rollback DELETE FROM LOAN_PAYMENT