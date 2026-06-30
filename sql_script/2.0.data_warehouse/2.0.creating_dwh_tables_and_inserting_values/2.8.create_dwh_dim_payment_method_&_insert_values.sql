-----------------------------------
--Checking dinstinct Payment method
-----------------------------------
SELECT DISTINCT [payment_method] 
FROM [stg_pc_sales].[dbo].[clean_dim_payment_method];


/* ================================================
   CREATE dwh_dim_payment_method TABLE (SAFE RERUN)
   Database : dwh_pc_sales
   Schema   : dbo
   ================================================ */

   
IF OBJECT_ID('[dwh_pc_sales].[dbo].[dwh_dim_payment_method]', 'U') IS NULL
BEGIN
    CREATE TABLE [dwh_pc_sales].[dbo].[dwh_dim_payment_method](
    [payment_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[payment_method] VARCHAR (50) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()
);
END;

/* ===============================================
   INSERT INTO dwh_dim_payment_method (SAFE RERUN)
   =============================================== */

INSERT INTO [dwh_pc_sales].[dbo].[dwh_dim_payment_method]([payment_method])

SELECT DISTINCT
           clean.payment_method
      FROM [stg_pc_sales].[dbo].[clean_dim_payment_method] clean
   WHERE NOT EXISTS
(
      SELECT 1
    FROM [dwh_pc_sales].[dbo].[dwh_dim_payment_method] dwh
    WHERE clean.payment_method = dwh.payment_method

 );
 GO


-----------
--VIEW DATA
-----------
SELECT * FROM [dwh_pc_sales].[dbo].[dwh_dim_payment_method];
