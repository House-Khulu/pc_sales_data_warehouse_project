
/* =======================================================================================
   Stored Procedure : Load Data into the stg_dim_location INSERT NEW DISTINCT RECORDS ONLY
   ======================================================================================= */

   CREATE OR ALTER PROCEDURE [usp_load_stg_dim_location]
   AS
   BEGIN
        SET NOCOUNT ON;

/* =========================================
   LOAD DATA (SAFE RERUN)
   ========================================= */

    INSERT INTO [stg_pc_sales].[dbo].[stg_dim_location]
    (
        continent,
        country_or_state,
        province_or_city
    )
    SELECT DISTINCT
        r.continent,
        r.country_or_state,
        r.province_or_city
    FROM [stg_pc_sales].[dbo].[raw_pc_data] r
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM [stg_pc_sales].[dbo].[stg_dim_location] l
        WHERE l.continent = r.continent
          AND l.country_or_state = r.country_or_state
          AND l.province_or_city = r.province_or_city
    );

END;
GO

