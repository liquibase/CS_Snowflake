--liquibase formatted sql

--changeset AmySmith:customers_us_table labels:JIRA-3945
CREATE TABLE CUSTOMERS_US if not exists (
   id int,
   first_name string,
  last_name string,
  email string,
  gender string,
  Job string,
  Phone string)
DATA_RETENTION_TIME_IN_DAYS=1; 
;
--rollback DROP TABLE CUSTOMERS_US
 
--changeset AmySmith:customers_us_vw labels:JIRA-3945
CREATE OR REPLACE VIEW CUSTOMERS_US_VIEW AS
SELECT 
FIRST_NAME,
LAST_NAME,
EMAIL
FROM CUSTOMERS_US
WHERE JOB != 'DATA SCIENTIST'
;
--rollback DROP VIEW CUSTOMERS_US_VIEW

--changeset AmySmith:customers_us_vw_v2 labels:JIRA-3945
CREATE OR REPLACE VIEW CUSTOMERS_US_VIEW AS
SELECT 
FIRST_NAME,
LAST_NAME,
EMAIL,
JOB
FROM CUSTOMERS_US
WHERE JOB != 'DATA SCIENTIST'
;
--rollback CREATE OR REPLACE VIEW CUSTOMERS_US_VIEW AS SELECT FIRST_NAME, LAST_NAME, EMAIL FROM CUSTOMERS_US WHERE JOB != 'DATA SCIENTIST'