/* =========================================
   STORED PROCEDURE: usp_load_stg_dim_product
   Database : stg_pc_sales
   Schema   : dbo
   ========================================= */

CREATE OR ALTER PROCEDURE [usp_load_stg_dim_product]
AS
BEGIN

    SET NOCOUNT ON;

    /* =========================================
       CREATE stg_dim_product TABLE (SAFE RERUN)
       ========================================= */

    IF OBJECT_ID('[stg_pc_sales].[dbo].[stg_dim_product]', 'U') IS NULL
    BEGIN

        CREATE TABLE [stg_pc_sales].[dbo].[stg_dim_product]
        (
            product_key       INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
            pc_make           NVARCHAR(50) NOT NULL,
            pc_model          NVARCHAR(50) NOT NULL,
            storage_type      NVARCHAR(50) NOT NULL,
            RAM               NVARCHAR(50) NOT NULL,
            storage_capacity  NVARCHAR(50) NOT NULL,
            created_date      DATETIME2(0) NOT NULL DEFAULT GETDATE(),
            modified_date     DATETIME2(0) NOT NULL DEFAULT GETDATE()
        );

    END;

    /* =========================================
       LOAD stg_dim_product
       ========================================= */

    INSERT INTO [stg_pc_sales].[dbo].[stg_dim_product]
    (
        pc_make,
        pc_model,
        storage_type,
        RAM,
        storage_capacity
    )
    SELECT DISTINCT
        r.pc_make,
        r.pc_model,
        r.storage_type,
        r.RAM,
        r.storage_capacity
    FROM dbo.raw_pc_data r
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM dbo.stg_dim_product p
        WHERE r.pc_make = p.pc_make
          AND r.pc_model = p.pc_model
          AND r.storage_type = p.storage_type
          AND r.RAM = p.RAM
          AND r.storage_capacity = p.storage_capacity
    );

END;
GO
