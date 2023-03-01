--liquibase formatted sql

--changeset AmySmith:sizes_table labels:JIRA-9054
create table sizes (
	id numeric not null,
	name varchar (255), 
	contains_tracking_id boolean default True, 
	date_first_entered date default null 
);
--DATA_RETENTION_TIME_IN_DAYS=2;
--rollback DROP TABLE sizes