/* ==========================================================
   Exploratory Data Analysis on : 
   lOCATION - Continent, country or state & Province or city 
   ========================================================== */

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


  SELECT * FROM [stg_pc_sales].[dbo].[raw_pc_data];


   

  ---------------------------------------------------------------------
  -- CHecking distinct Continent, Country_or_State and Province_or_City
  ---------------------------------------------------------------------

  SELECT DISTINCT (Continent) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT DISTINCT (Country_or_State) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT DISTINCT (Province_or_City) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  /*=================================
  Insight:
  -2 distinct Continents
  -20 distinct Countries_or_States
  -498 distinct Provinces_or_Cities 
  ===================================*/


  -----------------------------------------
  --Checking for duplicates from continents
  -----------------------------------------
  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE Continent IS NULL;

   -----------------------------------------
  --Checking for duplicates from Country_or_State
  -----------------------------------------
  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE Country_or_State IS NULL;
  
   -----------------------------------------
  --Checking for duplicates from Province_or_City
  -----------------------------------------
  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE Province_or_City IS NULL;
