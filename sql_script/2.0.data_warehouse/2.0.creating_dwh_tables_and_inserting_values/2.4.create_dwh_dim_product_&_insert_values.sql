----------------------------
--checking distinct product
---------------------------
SELECT DISTINCT
       [PC_Make]
      ,[PC_Model]
      ,[Storage_Type]
      ,[RAM]
      ,[Storage_Capacity]
  FROM [stg_pc_sales].[dbo].[clean_dim_product]


/* =========================================
   CREATE dwh_dim_product TABLE (SAFE RERUN)
   Database : dwh_pc_sales
   Schema   : dbo
   ========================================= */

IF OBJECT_ID('[dwh_pc_sales].[dbo].[dwh_dim_product]', 'U') IS NULL
BEGIN
    CREATE TABLE [dwh_pc_sales].[dbo].[dwh_dim_product](
    [product_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[pc_make] VARCHAR (50) NOT NULL,
	[pc_model] VARCHAR (50) NOT NULL,
	[storage_type] VARCHAR (50) NOT NULL,
	[RAM] VARCHAR (50) NOT NULL,
	[storage_capacity] VARCHAR (50) NOT NULL,
	[created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()
);
END;


/* =========================================
   INSERT INTO dwh_dim_product (SAFE RERUN)
   ========================================= */

INSERT INTO [dwh_pc_sales].[dbo].[dwh_dim_product](
            [pc_make],
			[pc_model],
			[storage_type],
			[RAM],
	        [storage_capacity]

)

SELECT DISTINCT
            clean.pc_make,
		    clean.pc_model,
		    clean.storage_type,
		    clean.RAM,
	        clean.storage_capacity
FROM [stg_pc_sales].[dbo].[clean_dim_product] clean
WHERE NOT EXISTS
(
    SELECT 1
    FROM [dwh_pc_sales].[dbo].[dwh_dim_product] dwh
	WHERE clean.pc_make = dwh.pc_make
	AND   clean.pc_model = dwh.pc_model
	AND   clean.storage_type = dwh.storage_type
	AND   clean.RAM = dwh.RAM
	AND   clean.storage_capacity = dwh.storage_capacity
);
GO

-----------------------
--View dwh_dim_product
-----------------------

SELECT * FROM [dwh_pc_sales].[dbo].[dwh_dim_product];