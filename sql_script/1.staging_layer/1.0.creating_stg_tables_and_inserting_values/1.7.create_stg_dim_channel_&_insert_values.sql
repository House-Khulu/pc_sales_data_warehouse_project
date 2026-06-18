----------------------------
--Checking dinstinct channel
----------------------------
SELECT DISTINCT [channel] FROM [stg_pc_sales].[dbo].[raw_pc_data];


/* =========================================
   CREATE stg_dim_channel TABLE (SAFE RERUN)
   Database : stg_pc_sales
   Schema   : dbo
   ========================================= */


IF OBJECT_ID('[stg_pc_sales].[dbo].[stg_dim_channel]', 'U') IS NULL
BEGIN
    CREATE TABLE [stg_pc_sales].[dbo].[stg_dim_channel](
    [channel_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[channel] [nvarchar](50) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()
);
END;


/* =========================================
   INSERT INTO stg_dim_channel (SAFE RERUN)
   ========================================= */

INSERT INTO [stg_pc_sales].[dbo].[stg_dim_channel](
            [channel])

SELECT DISTINCT

         r.channel
    FROM [stg_pc_sales].[dbo].[raw_pc_data] r
WHERE NOT EXISTS
(
  SELECT 1
    FROM [stg_pc_sales].[dbo].[stg_dim_channel] c
    WHERE  r.channel =  C.channel
);
GO

------------
--VIEW DATA
------------
SELECT * FROM [stg_pc_sales].[dbo].[stg_dim_channel];


