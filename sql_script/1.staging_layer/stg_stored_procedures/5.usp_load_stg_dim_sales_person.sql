/* ===============================================
   STORED PROCEDURE: usp_load_stg_dim_sales_person
   Database : stg_pc_sales
   Schema   : dbo
   =============================================== */

CREATE OR ALTER PROCEDURE [usp_load_stg_dim_sales_person]
AS
BEGIN

    SET NOCOUNT ON;

    /* ==============================================
       CREATE stg_dim_sales_person TABLE (SAFE RERUN)
       ============================================== */
   
IF OBJECT_ID('[stg_pc_sales].[dbo].[stg_dim_sales_person]', 'U') IS NULL
BEGIN
    CREATE TABLE [stg_pc_sales].[dbo].[stg_dim_sales_person](
    [sales_person_key] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[sales_person_name] [nvarchar](100) NOT NULL,
	[sales_person_department] [nvarchar](100) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()
);
END;

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