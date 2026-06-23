/* =======================================================================================
   Stored Procedure : Load Data into the stg_dim_customer INSERT NEW DISTINCT RECORDS ONLY
   ======================================================================================= */

CREATE OR ALTER PROCEDURE [usp_load_stg_dim_customer]
AS
BEGIN

    SET NOCOUNT ON;


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