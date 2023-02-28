--liquibase formatted sql

--changeset AmySmith:table_02 labels:JIRA-1234
create table table_02 (
	id numeric not null,
	name varchar (255), 
	toggle boolean default True, 
	date date default null 
)
DATA_RETENTION_TIME_IN_DAYS=2;
--rollback DROP TABLE table_02