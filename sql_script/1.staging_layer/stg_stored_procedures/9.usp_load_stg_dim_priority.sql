/* ===========================================
   STORED PROCEDURE: usp_load_stg_dim_priority
   Database : stg_pc_sales
   Schema   : dbo
   =========================================== */

CREATE OR ALTER PROCEDURE [usp_load_stg_dim_priority]
AS
BEGIN
    SET NOCOUNT ON;

 /* ==============================================
    CREATE stg_dim_priority TABLE (SAFE RERUN)
    ============================================== */

IF OBJECT_ID('[stg_pc_sales].[dbo].[stg_dim_priority]', 'U') IS NULL
BEGIN
    CREATE TABLE [stg_pc_sales].[dbo].[stg_dim_priority](
    [priority_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[priority] [nvarchar](50) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()

);
END;


/* =========================================
   INSERT INTO stg_dim_priority (SAFE RERUN)
   ========================================= */

INSERT INTO [stg_pc_sales].[dbo].[stg_dim_priority]
            ([priority])
SELECT DISTINCT
     
     r.priority
FROM [stg_pc_sales].[dbo].[raw_pc_data] r
WHERE NOT EXISTS
(
SELECT 1
FROM [stg_pc_sales].[dbo].[stg_dim_priority] Pr
WHERE r.priority = pr.priority

);
END;