--liquibase formatted sql

--changeset AmySmith:procedure_03 labels:JIRA-1234 endDelimiter:\*\*
 create procedure IF NOT EXISTS SCHEMA_A.sp_pi_03()
    returns float not null
    language javascript
    as
    $$
    return 3.1415926;
    $$
    ;
--rollback DROP procedure SCHEMA_A.sp_pi_03;