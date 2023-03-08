--liquibase formatted sql

--changeset AmySmith:products_table labels:JIRA-1234
create table products2 (
	product_id numeric not null,
	product_name varchar (255), 
	contains_tracking_id boolean default True, 
	date_first_sold date default null 
)
DATA_RETENTION_TIME_IN_DAYS=2;
--rollback DROP TABLE products