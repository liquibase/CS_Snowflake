--liquibase formatted sql

--changeset AmySmith:table_03 labels:JIRA-1234

drop table table_03;

create or replace table table_03 (
	id numeric not null,
	name varchar (255), 
	toggle boolean default True, 
	date date default null 
)
DATA_RETENTION_TIME_IN_DAYS=2;
--rollback DROP TABLE table_03