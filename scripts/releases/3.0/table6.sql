--liquibase formatted sql

--changeset AmySmith:table_06 labels:JIRA-1234
create or replace table SCHEMA_A.table_06 (
	id numeric not null,
	name varchar (255), 
	toggle boolean default True, 
	date date default null 
)
DATA_RETENTION_TIME_IN_DAYS=2;
--rollback DROP TABLE SCHEMA_A.table_06;

--changeset AmySmith:table_06_key labels:JIRA-1234
ALTER TABLE SCHEMA_A.table_06 ADD CONSTRAINT pk_id_name PRIMARY KEY (id,name);
--rollback ALTER TABLE SCHEMA_A.table_06 DROP CONSTRAINT pk_id_name;