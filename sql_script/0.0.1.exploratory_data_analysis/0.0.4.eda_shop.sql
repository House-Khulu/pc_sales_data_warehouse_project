/* =========================================
   Exploratory Data Analysis on : Shop info
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



  SELECT DISTINCT [Shop_Name]
        ,[Shop_Age]
   FROM [stg_pc_sales].[dbo].[raw_pc_data]



  SELECT * FROM [stg_pc_sales].[dbo].[raw_pc_data];

  -------------------------------------------
  -- Checking distinct Shop_name and Shop_age
  -------------------------------------------
  SELECT DISTINCT (Shop_Name) FROM [stg_pc_sales].[dbo].[raw_pc_data];
  
  SELECT DISTINCT (Shop_Age) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  /*=======================
  Insight:
  - 17 distinct Shop_names
  - 10 distinct shop_ages 
  ========================*/

  ----------------------------------------------
  --Checking for NULLS from Shop_name & Shop_Age
  ----------------------------------------------
  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Shop_Name] IS NULL;

  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Shop_Age] IS NULL;

  /*=====================================
  Insight:No NULLS from the above queries
  =======================================*/

  /*===================================================================================
  Note: If the original value is not equal to the same values after trimming, it means
  there are spaces. If there are no results after running the query, it means 
  there are no spaces
  =====================================================================================*/


  --------------------------------------------------------
  -- Checking for unwanted space from shop_name & shop_age
  --------------------------------------------------------

  SELECT [Shop_Name]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Shop_Name] != TRIM([Shop_Name]);

  SELECT [Shop_Age]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Shop_Age] != TRIM([Shop_Age]);

  /*==================================================
  Insight: there are no spaces from the above queries
  ====================================================*/