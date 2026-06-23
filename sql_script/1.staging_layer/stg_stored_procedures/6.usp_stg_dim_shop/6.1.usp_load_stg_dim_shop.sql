/* ===================================================================================
   Stored Procedure : Load Data into the stg_dim_shop INSERT NEW DISTINCT RECORDS ONLY
   =================================================================================== */

CREATE OR ALTER PROCEDURE [usp_load_stg_dim_shop]
AS
BEGIN
    SET NOCOUNT ON;

/* =====================================
   INSERT INTO stg_dim_shop (SAFE RERUN)
   ===================================== */

INSERT INTO [stg_pc_sales].[dbo].[stg_dim_shop](
            [shop_name],
			[shop_age])

SELECT DISTINCT 
            r.shop_name,
		    r.shop_age
FROM [stg_pc_sales].[dbo].[raw_pc_data] r
WHERE NOT EXISTS
(
    SELECT 1
    FROM [stg_pc_sales].[dbo].[stg_dim_shop] sh
    WHERE r.shop_name = sh.shop_name
    AND   r.shop_age = sh.shop_age

);
END;
GO

