--------------------------------
--Checking for distinct location
--------------------------------
SELECT DISTINCT [Continent]
      ,[Country_or_State]
      ,[Province_or_City]
      
  FROM [stg_pc_sales].[dbo].[clean_dim_location]


/* =========================================
   CREATE dwh_dim_location TABLE (SAFE RERUN)
   Database : dwh_pc_sales
   Schema   : dbo
   ========================================= */

IF OBJECT_ID('[dwh_pc_sales].[dbo].[dwh_dim_location]', 'U') IS NULL
BEGIN

    CREATE TABLE [dwh_pc_sales].[dbo].[dwh_dim_location] (

        [location_key] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
        [continent] VARCHAR(100) NOT NULL,
        [country_or_state] VARCHAR (100) NOT NULL,
        [province_or_city] VARCHAR (100) NOT NULL,
        [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
        [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()
    );

END;

/* =========================================
   INSERT INTO dwh_dim_location (SAFE RERUN)
   ========================================= */

INSERT INTO [dwh_pc_sales].[dbo].[dwh_dim_location]
(
    [continent],
    [country_or_state],
    [province_or_city]
)

SELECT DISTINCT
      clean.continent,
      clean.country_or_state,
      clean.province_or_city
FROM [stg_pc_sales].[dbo].[clean_dim_location] clean
WHERE NOT EXISTS
(
    SELECT 1
    FROM [dwh_pc_sales].[dbo].[dwh_dim_location] dwh
    WHERE clean.continent = dwh.continent
      AND clean.country_or_state = dwh.country_or_state
      AND clean.province_or_city = dwh.province_or_city
);
GO

-----------------------
--View dwh_dim_location
-----------------------

SELECT * FROM [dwh_pc_sales].[dbo].[dwh_dim_location];