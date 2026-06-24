------------------------------------------------
--Stored Procedure : Create usp_stg_dim_priority
------------------------------------------------

CREATE OR ALTER PROCEDURE [usp_create_stg_dim_priority]
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
	[priority] VARCHAR (50) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()

);
END;
END;
GO