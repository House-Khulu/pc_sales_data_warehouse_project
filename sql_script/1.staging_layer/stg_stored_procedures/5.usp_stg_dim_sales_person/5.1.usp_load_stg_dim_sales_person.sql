/* ===========================================================================================
   Stored Procedure : Load Data into the stg_dim_sales_person INSERT NEW DISTINCT RECORDS ONLY
   =========================================================================================== */

CREATE OR ALTER PROCEDURE [usp_load_stg_dim_sales_person]
AS
BEGIN
     SET NOCOUNT ON;

/* =============================================
   INSERT INTO stg_dim_sales_person (SAFE RERUN)
   ============================================= */

INSERT INTO [stg_pc_sales].[dbo].[stg_dim_sales_person](
            [sales_person_name],
			[sales_person_department])

SELECT DISTINCT 

             r.sales_person_name,
		     r.sales_person_department
FROM [stg_pc_sales].[dbo].[raw_pc_data] r
WHERE NOT EXISTS
(
    SELECT 1
    FROM [stg_pc_sales].[dbo].[stg_dim_sales_person] s
    WHERE r.sales_person_name = s.sales_person_name
    AND   r.sales_person_department = s.sales_person_department

);
END;
GO