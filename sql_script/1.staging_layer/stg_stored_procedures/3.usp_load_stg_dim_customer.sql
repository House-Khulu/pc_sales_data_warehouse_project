/* =========================================
   STORED PROCEDURE: usp_load_stg_dim_customer
   Database : stg_pc_sales
   Schema   : dbo
   Purpose  : Create and load stg_dim_customer
   ========================================= */

CREATE OR ALTER PROCEDURE [usp_load_stg_dim_customer]
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
            customer_name NVARCHAR(250) NOT NULL,
            customer_surname NVARCHAR(250) NOT NULL,
            customer_contact_number NVARCHAR(250) NOT NULL,
            customer_email_address NVARCHAR(250) NOT NULL,
            created_date DATETIME2(0) NOT NULL DEFAULT GETDATE(),
            modified_date DATETIME2(0) NOT NULL DEFAULT GETDATE()
        );

    END;

    /* =========================================
       LOAD DATA (SAFE RERUN)
       ========================================= */

    INSERT INTO dbo.stg_dim_customer
    (
        customer_name,
        customer_surname,
        customer_contact_number,
        customer_email_address
    )
    SELECT DISTINCT
           r.customer_name,
           r.customer_surname,
           r.customer_contact_number,
           r.customer_email_address
    FROM dbo.raw_pc_data r
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM dbo.stg_dim_customer c
        WHERE r.customer_name = c.customer_name
          AND r.customer_surname = c.customer_surname
          AND r.customer_email_address = c.customer_email_address
    );

END;
GO