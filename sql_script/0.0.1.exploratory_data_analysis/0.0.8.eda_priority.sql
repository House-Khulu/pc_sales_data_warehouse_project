/* ===========================================
   Exploratory Data Analysis on : priority info
   =========================================== */

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
  FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT DISTINCT  
         [Priority]
  FROM [stg_pc_sales].[dbo].[raw_pc_data];

  /*=========================
  Insight:3 distinct priority
  ===========================*/

  ----------------------------------
  --Checking for NULLS from priority
  ----------------------------------
  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Priority] IS NULL;

  /*=====================================
  Insight:No NULLS from the above query
  =======================================*/

  
  /*===================================================================================
  Note: If the original value is not equal to the same values after trimming, it means
  there are spaces. If there are no results after running the query, it means 
  there are no spaces
  =====================================================================================*/

  --------------------------------------------
  -- Checking for unwanted space from Priority
  ---------------------------------------------

  SELECT [Priority]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Priority] != TRIM([Priority]);

 /*================================================
  Insight: there are no spaces from the above query
  ================================================*/

