------------------------------------------------
--Stored Procedure : Create usp_stg_dim_location
------------------------------------------------
CREATE OR ALTER PROCEDURE [usp_create_stg_dim_customer]
AS
BEGIN
     SET NOCOUNT ON;


    /* =========================================
       CREATE TABLE (SAFE RERUN)
       ========================================= */

    IF OBJECT_ID('[stg_pc_sales].[dbo].[stg_dim_customer]', 'U') IS NULL
    BEGIN

        CREATE TABLE dbo.stg_dim_customer
        (
            customer_key INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
            customer_name VARCHAR(250) NOT NULL,
            customer_surname VARCHAR(250) NOT NULL,
            customer_contact_number VARCHAR(250) NOT NULL,
            customer_email_address VARCHAR(250) NOT NULL,
            created_date DATETIME2(0) NOT NULL DEFAULT GETDATE(),
            modified_date DATETIME2(0) NOT NULL DEFAULT GETDATE()
        );

    END;
    END;
    GO

