/* ========================================
   STORED PROCEDURE: usp_load_stg_dim_shop
   Database : stg_pc_sales
   Schema   : dbo
   ======================================== */

CREATE OR ALTER PROCEDURE [usp_load_stg_dim_shop]
AS
BEGIN
    SET NOCOUNT ON;

/* ==============================================
   CREATE stg_dim_shop TABLE (SAFE RERUN)
   ============================================== */
IF OBJECT_ID('[stg_pc_sales].[dbo].[stg_dim_shop]', 'U') IS NULL
BEGIN
    CREATE TABLE [stg_pc_sales].[dbo].[stg_dim_shop](
    [shop_key] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[shop_name] [nvarchar](100) NOT NULL,
	[shop_age] [nvarchar](100) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()
);
END;


/* =====================================
   INSERT INTO stg_dim_shop (SAFE RERUN)
   ===================================== */

INSERT INTO [stg_pc_sales].[dbo].[stg_dim_shop](
            [shop_name],
			[shop_age])

SELECT DISTINCT 
            r.shop_name,
		    r.shop_age
FROM [stg_pc_sales].[dbo].[raw_pc_data] r
WHERE NOT EXISTS
(
    SELECT 1
    FROM [stg_pc_sales].[dbo].[stg_dim_shop] sh
    WHERE r.shop_name = sh.shop_name
    AND   r.shop_age = sh.shop_age

);
END;
GO

