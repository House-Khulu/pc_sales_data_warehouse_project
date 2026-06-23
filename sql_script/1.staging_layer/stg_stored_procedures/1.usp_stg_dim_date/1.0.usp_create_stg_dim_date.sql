CREATE OR ALTER PROCEDURE [usp_create_stg_dim_date]
AS
BEGIN

    SET NOCOUNT ON;

    /* =========================================
       CREATE stg_dim_date TABLE (IF NOT EXISTS)
       ========================================= */

    IF OBJECT_ID('[stg_pc_sales].[dbo].[stg_dim_date]', 'U') IS NULL
    BEGIN

        CREATE TABLE [stg_pc_sales].[dbo].[stg_dim_date] (

            date_key            INT PRIMARY KEY,      -- YYYYMMDD
            full_date          DATE NOT NULL,

            year               INT,
            quarter            INT,
            month              INT,
            month_name         VARCHAR(20),
            month_year         VARCHAR(20),

            week_number        INT,

            day                INT,
            day_name           VARCHAR(20),
            day_of_week        INT,

            is_weekend         BIT,
            is_business_day    BIT,

            is_month_start     BIT,
            is_month_end       BIT,

            is_quarter_start   BIT,
            is_quarter_end     BIT,
            created_date DATETIME2(0) NOT NULL DEFAULT GETDATE(),
            modified_date DATETIME2(0) NOT NULL DEFAULT GETDATE()

        );

    END;
END;
GO