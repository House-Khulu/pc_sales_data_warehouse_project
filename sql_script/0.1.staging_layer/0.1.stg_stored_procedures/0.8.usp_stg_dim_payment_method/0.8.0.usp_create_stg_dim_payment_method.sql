------------------------------------------------------
--Stored Procedure : Create usp_stg_dim_payment_method
------------------------------------------------------

CREATE OR ALTER PROCEDURE [usp_create_stg_dim_payment_method]
AS
BEGIN
    SET NOCOUNT ON;
 /* ==============================================
    CREATE stg_dim_payment_method TABLE (SAFE RERUN)
    ============================================== */
IF OBJECT_ID('[stg_pc_sales].[dbo].[stg_dim_payment_method]', 'U') IS NULL
BEGIN
    CREATE TABLE [stg_pc_sales].[dbo].[stg_dim_payment_method](
    [payment_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[payment_method] VARCHAR (50) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()

);
END;
END;
GO
