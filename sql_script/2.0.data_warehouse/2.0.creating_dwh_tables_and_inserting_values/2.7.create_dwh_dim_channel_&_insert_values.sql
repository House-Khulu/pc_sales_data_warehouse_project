----------------------------
--Checking dinstinct channel
----------------------------
SELECT DISTINCT [channel] FROM [stg_pc_sales].[dbo].[clean_dim_channel];


/* =========================================
   CREATE dwh_dim_channel TABLE (SAFE RERUN)
   Database : dwh_pc_sales
   Schema   : dbo
   ========================================= */


IF OBJECT_ID('[dwh_pc_sales].[dbo].[dwh_dim_channel]', 'U') IS NULL
BEGIN
    CREATE TABLE [dwh_pc_sales].[dbo].[dwh_dim_channel](
    [channel_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[channel] VARCHAR (50) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()
);
END;


/* =========================================
   INSERT INTO dwh_dim_channel (SAFE RERUN)
   ========================================= */

INSERT INTO [dwh_pc_sales].[dbo].[dwh_dim_channel](
            [channel])

SELECT DISTINCT

         clean.channel
    FROM [stg_pc_sales].[dbo].[raw_pc_data] clean
WHERE NOT EXISTS
(
  SELECT 1
    FROM [dwh_pc_sales].[dbo].[dwh_dim_channel] dwh
    WHERE  clean.channel =  dwh.channel
);
GO

------------
--VIEW DATA
------------
SELECT * FROM [dwh_pc_sales].[dbo].[dwh_dim_channel];


