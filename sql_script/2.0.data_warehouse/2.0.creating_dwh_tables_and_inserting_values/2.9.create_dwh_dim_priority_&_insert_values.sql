-----------------------------
--Checking dinstinct priority
-----------------------------

SELECT DISTINCT
     [priority]
FROM [stg_pc_sales].[dbo].[clean_dim_priority];


/* ================================================
   CREATE dwh_dim_priority TABLE (SAFE RERUN)
   Database : dwh_pc_sales
   Schema   : dbo
   ================================================ */

IF OBJECT_ID('[dwh_pc_sales].[dbo].[dwh_dim_priority]', 'U') IS NULL
BEGIN
    CREATE TABLE [dwh_pc_sales].[dbo].[dwh_dim_priority](
    [priority_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[priority] VARCHAR (50) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()

);
END;


/* =========================================
   INSERT INTO dwh_dim_priority (SAFE RERUN)
   ========================================= */

INSERT INTO [dwh_pc_sales].[dbo].[dwh_dim_priority]
            ([priority])
SELECT DISTINCT
     
     clean.priority
FROM [stg_pc_sales].[dbo].[stg_dim_priority] clean
WHERE NOT EXISTS
(
SELECT 1
FROM [dwh_pc_sales].[dbo].[dwh_dim_priority] dwh
WHERE clean.priority = dwh.priority

);
GO


-----------
--VIEW DATA
-----------
SELECT * FROM [dwh_pc_sales].[dbo].[dwh_dim_priority];
