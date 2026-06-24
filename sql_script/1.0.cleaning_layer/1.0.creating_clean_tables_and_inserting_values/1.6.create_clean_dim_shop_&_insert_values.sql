-------------------------
--Checking dinstinct shop
-------------------------
SELECT DISTINCT
       [Shop_Name]
      ,[Shop_Age]  
  FROM [stg_pc_sales].[dbo].[stg_dim_shop]


/* =========================================
   CREATE clean_dim_shop TABLE (SAFE RERUN)
   Database : stg_pc_sales
   Schema   : dbo
   ========================================= */
IF OBJECT_ID('[stg_pc_sales].[dbo].[clean_dim_shop]', 'U') IS NULL
BEGIN
    CREATE TABLE [stg_pc_sales].[dbo].[clean_dim_shop](
    [shop_key] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[shop_name] VARCHAR  (100) NOT NULL,
	[shop_age] VARCHAR  (100) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()
);
END;


/* =====================================
   INSERT INTO stg_dim_shop (SAFE RERUN)
   ===================================== */

INSERT INTO [stg_pc_sales].[dbo].[clean_dim_shop](
            [shop_name],
			[shop_age])

SELECT DISTINCT 
            r.shop_name,
		    r.shop_age
FROM [stg_pc_sales].[dbo].[stg_dim_shop] r
WHERE NOT EXISTS
(
    SELECT 1
    FROM [stg_pc_sales].[dbo].[clean_dim_shop] sh
    WHERE r.shop_name = sh.shop_name
    AND   r.shop_age = sh.shop_age

);
GO

-----------
--View Data
-----------

SELECT * FROM [stg_pc_sales].[dbo].[clean_dim_shop]