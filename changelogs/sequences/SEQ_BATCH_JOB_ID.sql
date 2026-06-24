--liquibase formatted sql
 
--changeset asmith:011 labels:sequences
--comment Sequence for batch job IDs (starts at 1, increments by 10 to leave gaps for sub-jobs)
CREATE SEQUENCE IF NOT EXISTS SEQ_BATCH_JOB_ID
    START = 1
    INCREMENT = 10
    COMMENT = 'Batch job identifier; gaps allow sub-job IDs to be assigned between steps';
--rollback DROP SEQUENCE SEQ_BATCH_JOB_ID;