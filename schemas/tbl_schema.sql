-- ============================================================================
-- FILE: tbl_schema.sql
-- PURPOSE: Create target table to store customer data loaded from S3
-- AUTHOR: Learner
-- ============================================================================

USE DATABASE mydb;
CREATE SCHEMA IF NOT EXISTS tbl_schema;
USE SCHEMA tbl_schema;

-- ----------------------------------------------------------------------------
-- Create table to store customer data (2020 snapshot)
-- ----------------------------------------------------------------------------
CREATE OR REPLACE TABLE customer_data_2020 (
  Customer_ID INTEGER,
  Customer_Name STRING,
  Customer_Email STRING,
  Customer_City STRING,
  Customer_State STRING,
  Customer_DOB DATE  -- Considered DATE for better downstream analysis
);
