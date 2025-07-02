--liquibase formatted sql

--changeset AmySmith:view_02 labels:JIRA-1234
create view table_02_vw if not exists as 
SELECT
	id,
	name, 
	toggle, 
	date 
FROM table_02
--rollback DROP view table_02_vw