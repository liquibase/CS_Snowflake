--liquibase formatted sql

--changeset AmySmith:orders_table labels:JIRA-5234
CREATE OR REPLACE TABLE ORDERS (
    ORDER_ID VARCHAR(30),
    AMOUNT VARCHAR(30),
    PROFIT INT,
    QUANTITY INT,
    CATEGORY VARCHAR(30),
    SUBCATEGORY VARCHAR(30)
)	
DATA_RETENTION_TIME_IN_DAYS=2; 
--rollback DROP TABLE ORDERS;
 
--changeset AmySmith:orders_stage_copy labels:JIRA-5234
CREATE OR REPLACE STAGE aws_stage_copy
    url='s3://snowflakebucket-copyoption/size/'; 
LIST @aws_stage_copy;
--rollback DROP STAGE aws_stage_copy;

--changeset AmySmith:orders_table_load labels:JIRA-5234
	COPY INTO ORDERS
    FROM @aws_stage_copy
    file_format= (type = csv field_delimiter=',' skip_header=1)
    pattern='.*Order.*';
--rollback DELETE FROM ORDERS