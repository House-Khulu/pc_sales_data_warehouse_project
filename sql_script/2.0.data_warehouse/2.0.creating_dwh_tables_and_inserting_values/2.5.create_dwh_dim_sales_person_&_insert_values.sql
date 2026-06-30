---------------------------------
--Checking dinstinct sales_person
---------------------------------
SELECT DISTINCT
       [Sales_Person_Name]
      ,[Sales_Person_Department]
  FROM [stg_pc_sales].[dbo].[clean_dim_sales_person]


/* ==============================================
   CREATE dwh_dim_sales_person TABLE (SAFE RERUN)
   Database : dwh_pc_sales
   Schema   : dbo
   ============================================== */

IF OBJECT_ID('[dwh_pc_sales].[dbo].[dwh_dim_sales_person]', 'U') IS NULL
BEGIN
    CREATE TABLE [dwh_pc_sales].[dbo].[dwh_dim_sales_person](
    [sales_person_key] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[sales_person_name] VARCHAR (100) NOT NULL,
	[sales_person_department] VARCHAR (100) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()
);
END;

/* =============================================
   INSERT INTO dwh_dim_sales_person (SAFE RERUN)
   ============================================= */

INSERT INTO [dwh_pc_sales].[dbo].[dwh_dim_sales_person](
            [sales_person_name],
			[sales_person_department])

SELECT DISTINCT 

             clean.sales_person_name,
		     clean.sales_person_department
FROM [stg_pc_sales].[dbo].[clean_dim_sales_person] clean
WHERE NOT EXISTS
(
    SELECT 1
    FROM [dwh_pc_sales].[dbo].[dwh_dim_sales_person] dwh
    WHERE clean.sales_person_name = dwh.sales_person_name
    AND   clean.sales_person_department = dwh.sales_person_department

);
GO


-----------
--View data
-----------
SELECT * FROM [dwh_pc_sales].[dbo].[dwh_dim_sales_person];
