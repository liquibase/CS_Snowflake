--liquibase formatted sql

--changeset AmySmith:procedure_02 labels:JIRA-1234 endDelimiter:\*\* runOnChange:true
create or replace procedure SCHEMA_A.sp_pi_02()
    returns float not null
    language javascript
    as
    $$
    return 3.1415926;
    $$
    ;
--rollback DROP procedure SCHEMA_A.sp_pi_02;