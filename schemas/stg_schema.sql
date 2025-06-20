-- ============================================================================
-- FILE: stg_schema.sql
-- PURPOSE: Create external stage for S3 with storage integration
-- AUTHOR: Learner
-- ============================================================================

USE DATABASE mydb;
CREATE SCHEMA IF NOT EXISTS stg_schema;
USE SCHEMA stg_schema;

-- ----------------------------------------------------------------------------
-- Create storage integration to securely connect Snowflake with AWS S3
-- ----------------------------------------------------------------------------
CREATE STORAGE INTEGRATION IF NOT EXISTS s3_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = S3
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::060795945398:role/snowflake_learner'
  STORAGE_ALLOWED_LOCATIONS = ('s3://aws-s3-snowflake/');

-- ----------------------------------------------------------------------------
-- Create external stage pointing to AWS S3
-- ----------------------------------------------------------------------------
CREATE STAGE IF NOT EXISTS stage_ext_s3_customer
  URL = 's3://aws-s3-snowflake/'
  STORAGE_INTEGRATION = s3_integration;
