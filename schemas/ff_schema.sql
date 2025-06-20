-- ============================================================================
-- FILE: ff_schema.sql
-- PURPOSE: Create shared file formats used for data loading
-- AUTHOR: Learner
-- ============================================================================

USE DATABASE mydb;
CREATE SCHEMA IF NOT EXISTS ff_schema;
USE SCHEMA ff_schema;

-- ----------------------------------------------------------------------------
-- Pipe-delimited CSV File Format (skips header row)
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FILE FORMAT fileformat_csv_pipe
  TYPE = 'CSV'
  FIELD_DELIMITER = '|'
  SKIP_HEADER = 1;

-- ----------------------------------------------------------------------------
-- Comma-delimited CSV File Format (skips header row)
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FILE FORMAT fileformat_csv_comma
  TYPE = 'CSV'
  FIELD_DELIMITER = ','
  SKIP_HEADER = 1;

-- ----------------------------------------------------------------------------
-- JSON File Format
-- ----------------------------------------------------------------------------
CREATE OR REPLACE FILE FORMAT fileformat_json
  TYPE = 'JSON';