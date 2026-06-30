--------------------------------
--Checking for distinct customer
--------------------------------
SELECT DISTINCT
      
       [Customer_Name]
      ,[Customer_Surname]
      ,[Customer_Contact_Number]
      ,[Customer_Email_Address]
  
  FROM [stg_pc_sales].[dbo].[clean_dim_customer]


/* =========================================
   CREATE dwh_dim_customer TABLE (SAFE RERUN)
   Database : dwh_pc_sales
   Schema   : dbo
   ========================================= */

IF OBJECT_ID('[dwh_pc_sales].[dbo].[dwh_dim_customer]', 'U') IS NULL
BEGIN

CREATE TABLE [dwh_pc_sales].[dbo].[dwh_dim_customer](
    [customer_key] INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	[customer_name] VARCHAR (250) NOT NULL,
	[customer_surname] VARCHAR (250) NOT NULL,
	[customer_contact_number] VARCHAR (250) NOT NULL,
	[customer_email_address] VARCHAR (250) NOT NULL,
    [created_date] DATETIME2(0) NOT NULL DEFAULT GETDATE(),
    [modified_date] DATETIME2(0) NOT NULL DEFAULT GETDATE()

);
END;

/* =========================================
   INSERT INTO dwh_dim_customer (SAFE RERUN)
   ========================================= */

   
INSERT INTO [dwh_pc_sales].[dbo].[dwh_dim_customer] (

    customer_name,
    customer_surname,
    customer_contact_number,
    customer_email_address

)
SELECT DISTINCT
      
      clean.customer_name,
      clean.customer_surname,
      clean.customer_contact_number,
      clean.customer_email_address
FROM [stg_pc_sales].[dbo].[clean_dim_customer] clean
WHERE NOT EXISTS
(
    SELECT 1
    FROM [dwh_pc_sales].[dbo].[dwh_dim_customer] dwh
    WHERE clean.customer_name = dwh.customer_name
    AND   clean.customer_surname = dwh.customer_surname
    AND   clean.customer_email_address =  dwh.customer_email_address
);
GO

-----------------------
--View dwh_dim_customer
-----------------------

SELECT * FROM [dwh_pc_sales].[dbo].[dwh_dim_customer];