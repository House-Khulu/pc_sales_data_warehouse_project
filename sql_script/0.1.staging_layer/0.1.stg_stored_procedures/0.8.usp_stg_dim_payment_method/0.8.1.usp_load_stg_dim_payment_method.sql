/* =============================================================================================
   Stored Procedure : Load Data into the stg_dim_payment_method INSERT NEW DISTINCT RECORDS ONLY
   ============================================================================================= */

CREATE OR ALTER PROCEDURE [usp_load_stg_dim_payment_method]
AS
BEGIN
    SET NOCOUNT ON;

/* ===============================================
   INSERT INTO stg_dim_payment_method (SAFE RERUN)
   =============================================== */

INSERT INTO [stg_pc_sales].[dbo].[stg_dim_payment_method]([payment_method])

SELECT DISTINCT
           r.payment_method
      FROM [stg_pc_sales].[dbo].[raw_pc_data] r
   WHERE NOT EXISTS
(
      SELECT 1
    FROM [stg_pc_sales].[dbo].[stg_dim_payment_method] pm
    WHERE r.payment_method = pm.payment_method

 );
 END;
