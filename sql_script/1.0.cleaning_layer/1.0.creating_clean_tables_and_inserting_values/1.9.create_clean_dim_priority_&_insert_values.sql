-----------------------------
--Checking dinstinct priority
-----------------------------

SELECT DISTINCT
     [priority]
FROM [stg_pc_sales].[dbo].[stg_dim_priority];


/* ================================================
   CREATE clean_dim_priority TABLE (SAFE RERUN)
   Database : stg_pc_sales
   Schema   : dbo
   ================================================ */

IF OBJECT_ID('[stg_pc_sales].[dbo].[clean_dim_priority]', 'U') IS NULL
BEGIN
    CREATE TABLE [stg_pc_sales].[dbo].[clean_dim_priority](
    [priority_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[priority] VARCHAR (50) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()

);
END;


/* =========================================
   INSERT INTO clean_dim_priority (SAFE RERUN)
   ========================================= */

INSERT INTO [stg_pc_sales].[dbo].[clean_dim_priority]
            ([priority])
SELECT DISTINCT
     
     r.priority
FROM [stg_pc_sales].[dbo].[stg_dim_priority] r
WHERE NOT EXISTS
(
SELECT 1
FROM [stg_pc_sales].[dbo].[clean_dim_priority] Pr
WHERE r.priority = pr.priority

);
GO


-----------
--VIEW DATA
-----------
SELECT * FROM [stg_pc_sales].[dbo].[clean_dim_priority];




