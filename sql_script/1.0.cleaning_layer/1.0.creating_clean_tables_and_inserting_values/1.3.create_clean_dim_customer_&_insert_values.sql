--------------------------------
--Checking for distinct customer
--------------------------------
SELECT DISTINCT
      
       [Customer_Name]
      ,[Customer_Surname]
      ,[Customer_Contact_Number]
      ,[Customer_Email_Address]
  
  FROM [stg_pc_sales].[dbo].[stg_dim_customer]


/* =========================================
   CREATE clean_dim_customer TABLE (SAFE RERUN)
   Database : stg_pc_sales
   Schema   : dbo
   ========================================= */

IF OBJECT_ID('[stg_pc_sales].[dbo].[clean_dim_customer]', 'U') IS NULL
BEGIN

CREATE TABLE [stg_pc_sales].[dbo].[clean_dim_customer](
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
   INSERT INTO clean_dim_customer (SAFE RERUN)
   ========================================= */

   
INSERT INTO [stg_pc_sales].[dbo].[clean_dim_customer] (

    customer_name,
    customer_surname,
    customer_contact_number,
    customer_email_address

)
SELECT DISTINCT
      
      s.customer_name,
      s.customer_surname,
      s.customer_contact_number,
      s.customer_email_address
FROM [stg_pc_sales].[dbo].[stg_dim_customer] s
WHERE NOT EXISTS
(
    SELECT 1
    FROM [stg_pc_sales].[dbo].[clean_dim_customer] c
    WHERE c.customer_name = s.customer_name
    AND   c.customer_surname = s.customer_surname
    AND   c.customer_email_address =  s.customer_email_address
);
GO

-----------------------
--View clean_dim_customer
-----------------------

SELECT * FROM [stg_pc_sales].[dbo].[clean_dim_customer];