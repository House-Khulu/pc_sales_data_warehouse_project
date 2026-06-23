-----------------------------------------------
--Stored Procedure : Create usp_stg_dim_product
-----------------------------------------------

CREATE OR ALTER PROCEDURE [usp_create_stg_dim_product]
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
    END;
    GO

