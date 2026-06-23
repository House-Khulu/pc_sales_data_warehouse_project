------------------------------------------------
--Stored Procedure : Create usp_stg_dim_location
------------------------------------------------

CREATE OR ALTER PROCEDURE [usp_create_stg_dim_location]
AS
BEGIN
    SET NOCOUNT ON;

    /* =========================================
       CREATE TABLE IF NOT EXISTS (SAFE RERUN)
       ========================================= */

    IF OBJECT_ID('[stg_pc_sales].[dbo].[stg_dim_location]', 'U') IS NULL
    BEGIN
        CREATE TABLE [stg_pc_sales].[dbo].[stg_dim_location] (

            location_key INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
            continent VARCHAR(100) NOT NULL,
            country_or_state VARCHAR(100) NOT NULL,
            province_or_city VARCHAR(100) NOT NULL,
            created_date DATETIME2(0) NOT NULL DEFAULT GETDATE(),
            modified_date DATETIME2(0) NOT NULL DEFAULT GETDATE()
        );
    END
    END;
    GO

