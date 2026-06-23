/* =======================================================================================
   Stored Procedure : Load Data into the stg_dim_product INSERT NEW DISTINCT RECORDS ONLY
   ======================================================================================= */

CREATE OR ALTER PROCEDURE [usp_load_stg_dim_product]
AS
BEGIN

    SET NOCOUNT ON;

    /* =========================================
       LOAD stg_dim_product
       ========================================= */

    INSERT INTO [stg_pc_sales].[dbo].[stg_dim_product]
    (
        pc_make,
        pc_model,
        storage_type,
        RAM,
        storage_capacity
    )
    SELECT DISTINCT
        r.pc_make,
        r.pc_model,
        r.storage_type,
        r.RAM,
        r.storage_capacity
    FROM dbo.raw_pc_data r
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM dbo.stg_dim_product p
        WHERE r.pc_make = p.pc_make
          AND r.pc_model = p.pc_model
          AND r.storage_type = p.storage_type
          AND r.RAM = p.RAM
          AND r.storage_capacity = p.storage_capacity
    );

END;
GO
