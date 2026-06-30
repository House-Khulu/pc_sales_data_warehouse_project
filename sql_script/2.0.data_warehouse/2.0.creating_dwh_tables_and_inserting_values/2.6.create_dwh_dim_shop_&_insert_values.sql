-------------------------
--Checking dinstinct shop
-------------------------
SELECT DISTINCT
       [Shop_Name]
      ,[Shop_Age]  
  FROM [stg_pc_sales].[dbo].[clean_dim_shop]


/* =========================================
   CREATE dwh_dim_shop TABLE (SAFE RERUN)
   Database : dwh_pc_sales
   Schema   : dbo
   ========================================= */
IF OBJECT_ID('[dwh_pc_sales].[dbo].[dwh_dim_shop]', 'U') IS NULL
BEGIN
    CREATE TABLE [dwh_pc_sales].[dbo].[dwh_dim_shop](
    [shop_key] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[shop_name] VARCHAR  (100) NOT NULL,
	[shop_age] VARCHAR  (100) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()
);
END;


/* =====================================
   INSERT INTO dwh_dim_shop (SAFE RERUN)
   ===================================== */

INSERT INTO [dwh_pc_sales].[dbo].[dwh_dim_shop](
            [shop_name],
			[shop_age])

SELECT DISTINCT 
            clean.shop_name,
		    clean.shop_age
FROM [stg_pc_sales].[dbo].[raw_pc_data] clean
WHERE NOT EXISTS
(
    SELECT 1
    FROM [dwh_pc_sales].[dbo].[dwh_dim_shop] dwh
    WHERE clean.shop_name = dwh.shop_name
    AND   clean.shop_age = dwh.shop_age

);
GO

-----------
--View Data
-----------

SELECT * FROM [dwh_pc_sales].[dbo].[dwh_dim_shop]