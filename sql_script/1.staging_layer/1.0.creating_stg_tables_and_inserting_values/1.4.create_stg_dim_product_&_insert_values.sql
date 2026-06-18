----------------------------
--checking distinct product
---------------------------
SELECT DISTINCT
       [PC_Make]
      ,[PC_Model]
      ,[Storage_Type]
      ,[RAM]
      ,[Storage_Capacity]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]


/* =========================================
   CREATE stg_dim_product TABLE (SAFE RERUN)
   Database : stg_pc_sales
   Schema   : dbo
   ========================================= */

IF OBJECT_ID('[stg_pc_sales].[dbo].[stg_dim_product]', 'U') IS NULL
BEGIN
    CREATE TABLE [stg_pc_sales].[dbo].[stg_dim_product](
    [product_key] INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
	[pc_make] [nvarchar](50) NOT NULL,
	[pc_model] [nvarchar](50) NOT NULL,
	[storage_type] [nvarchar](50) NOT NULL,
	[RAM] [nvarchar](50) NOT NULL,
	[storage_capacity] [nvarchar](50) NOT NULL,
	[created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()
);
END;


/* =========================================
   INSERT INTO stg_dim_product (SAFE RERUN)
   ========================================= */

INSERT INTO [stg_pc_sales].[dbo].[stg_dim_product](
            [pc_make],
			[pc_model],
			[storage_type],
			[RAM],
	        [storage_capacity]

)

SELECT DISTINCT
            r.pc_make,
		    r.pc_model,
		    r.storage_type,
		    r.RAM,
	        r.storage_capacity
FROM [stg_pc_sales].[dbo].[raw_pc_data] r
WHERE NOT EXISTS
(
    SELECT 1
    FROM [stg_pc_sales].[dbo].[stg_dim_product] p
	WHERE r.pc_make = P.pc_make
	AND   r.pc_model = P.pc_model
	AND   r.storage_type = P.storage_type
	AND   r.RAM = P.RAM
	AND   r.storage_capacity = P.storage_capacity
);
GO

-----------------------
--View stg_dim_product
-----------------------

SELECT * FROM [stg_pc_sales].[dbo].[stg_dim_product];