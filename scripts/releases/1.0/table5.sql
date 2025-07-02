--liquibase formatted sql

--changeset AmySmith:table_05 labels:JIRA-1234
drop table table_05;

create or replace table table_05 (
	id numeric not null,
	name varchar (255), 
	toggle boolean default True, 
	date date default null 
)
DATA_RETENTION_TIME_IN_DAYS=2;
--rollback DROP TABLE table_05