--------------------------------
--Checking for distinct location
--------------------------------
SELECT DISTINCT [Continent]
      ,[Country_or_State]
      ,[Province_or_City]
      
  FROM [stg_pc_sales].[dbo].[stg_dim_location]
 
/* =========================================
   CREATE clean_dim_location TABLE (SAFE RERUN)
   Database : stg_pc_sales
   Schema   : dbo
   ========================================= */

IF OBJECT_ID('[stg_pc_sales].[dbo].[clean_dim_location]', 'U') IS NULL
BEGIN

    CREATE TABLE [stg_pc_sales].[dbo].[clean_dim_location] (

        [location_key] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
        [continent] VARCHAR(100) NOT NULL,
        [country_or_state] VARCHAR (100) NOT NULL,
        [province_or_city] VARCHAR (100) NOT NULL,
        [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
        [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()
    );

END;

/* =========================================
   INSERT INTO clean_dim_location (SAFE RERUN)
   ========================================= */

INSERT INTO [stg_pc_sales].[dbo].[clean_dim_location]
(
    [continent],
    [country_or_state],
    [province_or_city]
)

SELECT DISTINCT
      stg.continent,
      stg.country_or_state,
      stg.province_or_city
FROM [stg_pc_sales].[dbo].[stg_dim_location] stg
WHERE NOT EXISTS
(
    SELECT 1
    FROM [stg_pc_sales].[dbo].[clean_dim_location] clean
    WHERE clean.continent = stg.continent
      AND clean.country_or_state = stg.country_or_state
      AND clean.province_or_city = stg.province_or_city
);
GO

-----------------------
--View clean_dim_location
-----------------------

SELECT * FROM [stg_pc_sales].[dbo].[clean_dim_location];