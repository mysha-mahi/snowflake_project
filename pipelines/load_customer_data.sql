-- ============================================================================
-- FILE: load_customer_data.sql
-- PURPOSE: Load customer data from S3 into Snowflake table
-- AUTHOR: Learner
-- ============================================================================

USE DATABASE mydb;
USE SCHEMA tbl_schema;

-- ----------------------------------------------------------------------------
-- Load data from external S3 stage into the customer_data_2020 table
-- ----------------------------------------------------------------------------
COPY INTO customer_data_2020
FROM @mydb.stg_schema.stage_ext_s3_customer/csv/customer_data_2020.csv
FILE_FORMAT = mydb.ff_schema.fileformat_csv_pipe
ON_ERROR = 'SKIP_FILE'  -- Optional: skip files that fail
;
