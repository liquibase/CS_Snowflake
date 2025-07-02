--liquibase formatted sql

--changeset AmySmith:new_db labels:JIRA-1234
CREATE DATABASE ASDB2
     DATA_RETENTION_TIME_IN_DAYS = 2
--rollback DROP DATABASE ASDB2;

--changeset AmySmith:new_schema labels:JIRA-1234
CREATE SCHEMA ASDB2.SCHEMA_A;
--rollback DROP SCHEMA ASDB2.SCHEMA_A;

--changeset AmySmith:table_01 labels:JIRA-1234
create or replace table ASDB2.SCHEMA_A.table_01 (
	id numeric not null,
	name varchar (255), 
	toggle boolean default True, 
	date date default null 
)
DATA_RETENTION_TIME_IN_DAYS=2;
--rollback DROP TABLE ASDB2.SCHEMA_A.table_01;

--changeset AmySmith:new_user labels:JIRA-1234
CREATE USER ASMITH2
    PASSWORD = 'MY$b9E$24iU$L34-n'
    LOGIN_NAME = 'ASMITH2'
    DEFAULT_WAREHOUSE = 'CUSTOMERSUCCESS_WH'
    DEFAULT_ROLE = 'LIQUIBASE_USER'
    MUST_CHANGE_PASSWORD = TRUE;
--rollback DROP USER ASMITH2;

--changeset AmySmith:modify_user labels:JIRA-1234
ALTER USER IF EXISTS ASMITH2 RENAME TO ASMITH3;
--rollback ALTER USER IF EXISTS ASMITH3 RENAME TO ASMITH2;
