/* =========================================
   Exploratory Data Analysis on : Customers
   ========================================= */

   SELECT [Continent]
      ,[Country_or_State]
      ,[Province_or_City]
      ,[Shop_Name]
      ,[Shop_Age]
      ,[PC_Make]
      ,[PC_Model]
      ,[Storage_Type]
      ,[Customer_Name]
      ,[Customer_Surname]
      ,[Customer_Contact_Number]
      ,[Customer_Email_Address]
      ,[Sales_Person_Name]
      ,[Sales_Person_Department]
      ,[Cost_Price]
      ,[Sale_Price]
      ,[Payment_Method]
      ,[Discount_Amount]
      ,[Purchase_Date]
      ,[Ship_Date]
      ,[Finance_Amount]
      ,[RAM]
      ,[Credit_Score]
      ,[Channel]
      ,[Priority]
      ,[Cost_of_Repairs]
      ,[Total_Sales_per_Employee]
      ,[PC_Market_Price]
      ,[Storage_Capacity]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]


  SELECT DISTINCT
         [Customer_Name]
        ,[Customer_Surname]
        ,[Customer_Contact_Number]
        ,[Customer_Email_Address]
    FROM [stg_pc_sales].[dbo].[raw_pc_data]


  SELECT * FROM [stg_pc_sales].[dbo].[raw_pc_data];

  
  SELECT COUNT(customer_name) number_of_c_names FROM [stg_pc_sales].[dbo].[raw_pc_data];
    
  SELECT COUNT(Customer_Surname) number_of_s_names FROM [stg_pc_sales].[dbo].[raw_pc_data];

  -------------------------------------------------------------------------------------------------------------
  --Checking for NULLS from customer_name and customer_surname,customer_contact_number & Customer_email_address
  -------------------------------------------------------------------------------------------------------------
  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE customer_name IS NULL;

  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE customer_surname IS NULL;

  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE Customer_Contact_Number IS NULL;

  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE Customer_Email_Address IS NULL;

  /*=====================================
  Insight:No NULLS from the above queries
  =======================================*/


  /*===================================================================================
  Note: If the original value is not equal to the same values after trimming, it means
  there are spaces. If there are no results after running the query, it means 
  there are no spaces
  =====================================================================================*/


  -----------------------------------------------------------
  -- Checking for unwanted space on Customer name and surname
  -----------------------------------------------------------

  SELECT [Customer_Name]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Customer_Name] != TRIM([Customer_Name]);

  SELECT [Customer_Surname]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Customer_Surname] != TRIM([Customer_Surname]);

  
  SELECT [Customer_Contact_Number]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Customer_Contact_Number] != TRIM([Customer_Contact_Number]);

  SELECT [Customer_Email_Address]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Customer_Email_Address] != TRIM([Customer_Email_Address]);

  /*==================================================
  Insight: there are no spaces from the above queries
  ====================================================*/

