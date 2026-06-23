------------------------------------------------
--Stored Procedure : Create the usp_stg_dim_shop
------------------------------------------------

CREATE OR ALTER PROCEDURE [usp_create_stg_dim_shop]
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
	[shop_name] VARCHAR (100) NOT NULL,
	[shop_age] VARCHAR (100) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()
);
END;
END;
GO