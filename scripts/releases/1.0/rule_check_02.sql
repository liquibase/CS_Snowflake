--liquibase formatted sql

--changeset AmySmith:check_table labels:JIRA-1234
CREATE TABLE table_check if not 
exists (
	id numeric not null,
	name varchar (255), 
	toggle boolean default True, 
	date date default null 
)
DATA_RETENTION_TIME_IN_DAYS=2;
--rollback DROP TABLE table_check

--changeset AmySmith:check_proc labels:JIRA-1234 endDelimiter:\*\*
 create procedure if       not        exists SCHEMA_A.sp_pi_check ()
    returns float not null
    language javascript
    as
    $$
    return 3.1415926;
    $$
    ;
--rollback DROP procedure SCHEMA_A.sp_pi_check;

--changeset AmySmith:check_function labels:JIRA-1234 endDelimiter:\*\*
CREATE FUNCTION if not exists SCHEMA_A.function_01 (i int)
RETURNS INT
LANGUAGE PYTHON
RUNTIME_VERSION = '3.8'
HANDLER = 'addone_py'
as
$$
def addone_py(i):
  return i+1
$$;
--rollback DROP function SCHEMA_A.function_01;

--changeset AmySmith:view_check labels:JIRA-1234
create view view_check_vw if not 
exists as 
SELECT
	id,
	name, 
	toggle, 
	date 
FROM table_02
--rollback DROP view view_check_vw