/* =======================================================================================
   Stored Procedure : Load Data into the stg_dim_priority INSERT NEW DISTINCT RECORDS ONLY
   ======================================================================================= */

CREATE OR ALTER PROCEDURE [usp_load_stg_dim_priority]
AS
BEGIN
    SET NOCOUNT ON;

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