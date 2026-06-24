----------------------------------------------------
--Stored Procedure : Create usp_stg_dim_sales_person
----------------------------------------------------

CREATE OR ALTER PROCEDURE [usp_create_stg_dim_sales_person]
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
	[sales_person_name] VARCHAR (100) NOT NULL,
	[sales_person_department] VARCHAR (100) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()
);
END;
END;
GO
