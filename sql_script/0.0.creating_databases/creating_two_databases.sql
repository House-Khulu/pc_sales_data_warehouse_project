----------------------------------------------------------
-- create two databases only if they do not already exist
----------------------------------------------------------

---------------------------
--Creating staging database
---------------------------

IF DB_ID ('stg_pc_sales') IS NULL
CREATE DATABASE [stg_pc_sales];
GO

----------------------------------
--Creating data warehouse database
----------------------------------
IF DB_ID ('dwh_pc_sales') IS NULL
CREATE DATABASE [dwh_pc_sales];
GO
