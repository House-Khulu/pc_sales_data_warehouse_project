----------------------------
--checking distinct product
---------------------------
SELECT DISTINCT
       [PC_Make]
      ,[PC_Model]
      ,[Storage_Type]
      ,[RAM]
      ,[Storage_Capacity]
  FROM [stg_pc_sales].[dbo].[stg_dim_product]


/* =========================================
   CREATE clean_dim_product TABLE (SAFE RERUN)
   Database : stg_pc_sales
   Schema   : dbo
   ========================================= */

IF OBJECT_ID('[stg_pc_sales].[dbo].[clean_dim_product]', 'U') IS NULL
BEGIN
    CREATE TABLE [stg_pc_sales].[dbo].[clean_dim_product](
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
   INSERT INTO clean_dim_product (SAFE RERUN)
   ========================================= */

INSERT INTO [stg_pc_sales].[dbo].[clean_dim_product](
            [pc_make],
			[pc_model],
			[storage_type],
			[RAM],
	        [storage_capacity]

)

SELECT DISTINCT
            stg.pc_make,
		    stg.pc_model,
		    stg.storage_type,
		    stg.RAM,
	        stg.storage_capacity
FROM [stg_pc_sales].[dbo].[stg_dim_product] stg
WHERE NOT EXISTS
(
    SELECT 1
    FROM [stg_pc_sales].[dbo].[clean_dim_product] clean
	WHERE stg.pc_make = clean.pc_make
	AND   stg.pc_model = clean.pc_model
	AND   stg.storage_type = clean.storage_type
	AND   stg.RAM = clean.RAM
	AND   stg.storage_capacity = clean.storage_capacity
);
GO

-----------------------
--View clean_dim_product
-----------------------

SELECT * FROM [stg_pc_sales].[dbo].[clean_dim_product];