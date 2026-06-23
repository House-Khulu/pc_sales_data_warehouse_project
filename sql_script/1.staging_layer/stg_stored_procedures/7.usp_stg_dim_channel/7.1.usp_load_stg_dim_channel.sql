/* ======================================================================================
   Stored Procedure : Load Data into the stg_dim_channel INSERT NEW DISTINCT RECORDS ONLY
   ====================================================================================== */

CREATE OR ALTER PROCEDURE [usp_load_stg_dim_channel]
AS
BEGIN
    SET NOCOUNT ON;

/* =========================================
   INSERT INTO stg_dim_channel (SAFE RERUN)
   ========================================= */

INSERT INTO [stg_pc_sales].[dbo].[stg_dim_channel](
            [channel])

SELECT DISTINCT

         r.channel
    FROM [stg_pc_sales].[dbo].[raw_pc_data] r
WHERE NOT EXISTS
(
  SELECT 1
    FROM [stg_pc_sales].[dbo].[stg_dim_channel] c
    WHERE  r.channel =  C.channel
);
END;
