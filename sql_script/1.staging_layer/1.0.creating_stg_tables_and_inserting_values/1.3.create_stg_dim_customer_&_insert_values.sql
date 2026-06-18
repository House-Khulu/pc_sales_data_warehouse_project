--------------------------------
--Checking for distinct customer
--------------------------------
SELECT DISTINCT
      
       [Customer_Name]
      ,[Customer_Surname]
      ,[Customer_Contact_Number]
      ,[Customer_Email_Address]
  
  FROM [stg_pc_sales].[dbo].[raw_pc_data]


/* =========================================
   CREATE stg_dim_customer TABLE (SAFE RERUN)
   Database : stg_pc_sales
   Schema   : dbo
   ========================================= */

IF OBJECT_ID('[stg_pc_sales].[dbo].[stg_dim_customer]', 'U') IS NULL
BEGIN

CREATE TABLE [stg_pc_sales].[dbo].[stg_dim_customer](
    [customer_key] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[customer_name] [nvarchar](250) NOT NULL,
	[customer_surname] [nvarchar](250) NOT NULL,
	[customer_contact_number] [nvarchar](250) NOT NULL,
	[customer_email_address] [nvarchar](250) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()

);
END;

/* =========================================
   INSERT INTO stg_dim_customer (SAFE RERUN)
   ========================================= */

   
INSERT INTO [stg_pc_sales].[dbo].[stg_dim_customer] (

    customer_name,
    customer_surname,
    customer_contact_number,
    customer_email_address

)
SELECT DISTINCT
      
      r.customer_name,
      r.customer_surname,
      r.customer_contact_number,
      r.customer_email_address
FROM [stg_pc_sales].[dbo].[raw_pc_data] r
WHERE NOT EXISTS
(
    SELECT 1
    FROM [stg_pc_sales].[dbo].[stg_dim_customer] c
    WHERE r.customer_name = c.customer_name
    AND   r.customer_surname = C.customer_surname
    AND   r.customer_email_address =  C.customer_email_address
);
GO

-----------------------
--View stg_dim_customer
-----------------------

SELECT * FROM [stg_pc_sales].[dbo].[stg_dim_customer];