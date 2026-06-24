-----------------------------------
--Checking dinstinct Payment method
-----------------------------------
SELECT DISTINCT [payment_method] 
FROM [stg_pc_sales].[dbo].[stg_dim_payment_method];


/* ================================================
   CREATE clean_dim_payment_method TABLE (SAFE RERUN)
   Database : stg_pc_sales
   Schema   : dbo
   ================================================ */

   
IF OBJECT_ID('[stg_pc_sales].[dbo].[clean_dim_payment_method]', 'U') IS NULL
BEGIN
    CREATE TABLE [stg_pc_sales].[dbo].[clean_dim_payment_method](
    [payment_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[payment_method] VARCHAR (50) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()
);
END;

/* ===============================================
   INSERT INTO clean_dim_payment_method (SAFE RERUN)
   =============================================== */

INSERT INTO [stg_pc_sales].[dbo].[clean_dim_payment_method]([payment_method])

SELECT DISTINCT
           r.payment_method
      FROM [stg_pc_sales].[dbo].[stg_dim_payment_method] r
   WHERE NOT EXISTS
(
      SELECT 1
    FROM [stg_pc_sales].[dbo].[clean_dim_payment_method] pm
    WHERE r.payment_method = pm.payment_method

 );
 GO


-----------
--VIEW DATA
-----------
SELECT * FROM [stg_pc_sales].[dbo].[clean_dim_payment_method];
