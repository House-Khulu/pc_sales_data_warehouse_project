--------------------------------------------------
--Creating a stored procedure for stg_dim_location
--------------------------------------------------

CREATE OR ALTER PROCEDURE [usp_load_stg_dim_location]
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
            continent NVARCHAR(100) NOT NULL,
            country_or_state NVARCHAR(100) NOT NULL,
            province_or_city NVARCHAR(100) NOT NULL,
            created_date DATETIME2(0) NOT NULL DEFAULT GETDATE(),
            modified_date DATETIME2(0) NOT NULL DEFAULT GETDATE()
        );
    END;

    /* =========================================
       INSERT NEW DISTINCT RECORDS ONLY
       ========================================= */

    INSERT INTO [stg_pc_sales].[dbo].[stg_dim_location]
    (
        continent,
        country_or_state,
        province_or_city
    )
    SELECT DISTINCT
        r.continent,
        r.country_or_state,
        r.province_or_city
    FROM [stg_pc_sales].[dbo].[raw_pc_data] r
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM [stg_pc_sales].[dbo].[stg_dim_location] l
        WHERE l.continent = r.continent
          AND l.country_or_state = r.country_or_state
          AND l.province_or_city = r.province_or_city
    );

END;
GO

