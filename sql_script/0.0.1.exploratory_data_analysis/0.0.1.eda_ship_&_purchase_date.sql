/* ==============================
   Exploratory Data Analysis on : 
   Purchase date and Ship date 
   ============================== */

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


  -------------------------------------------------------
  -- Checking the number of transactions on purchase_date
  -------------------------------------------------------
  SELECT [Purchase_Date] FROM [stg_pc_sales].[dbo].[raw_pc_data];


  /*=================================================================================
  Insight: 
  -The purchase data has 10 000 records and so does the total records in the dataset, 
  meaning every transaction row has a purchase date assigned to it.
  ===================================================================================*/


  --------------------------------------
  --Checking for distinct purchase dates
  --------------------------------------
  SELECT DISTINCT [Purchase_Date]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  ORDER BY [Purchase_Date] DESC;

  /*================
  Insight: 
   - 1096 records 
   =================*/



  --------------------------------------------------
  --Counting the number purchases per purchase_date
  --------------------------------------------------
  SELECT [Purchase_Date], 
  COUNT(*) AS number_of_purchases
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  GROUP BY [Purchase_Date]
  HAVING COUNT(*) > 1


  --------------------------------------------------------------
  --Checking for the range date oldest and lastest purchase date
  --------------------------------------------------------------
  SELECT MIN(Purchase_Date) AS oldest_date,
         MAX(Purchase_Date) AS latest_date
  FROM [stg_pc_sales].[dbo].[raw_pc_data];

  /*======================================================
  Insight:
  - The purchase date ranges from 2021-03-12 to 2024-03-11
  ========================================================*/


  ---------------------------------------
  --Checking for nulls from purchase date 
  ----------------------------------------
  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Purchase_Date] IS NULL;

  /*=========
  Insight:
  - No nulls 
  ===========*/


 
  ----------------------------------------------
  -- Checking the number of shipped transactions
  ----------------------------------------------

  SELECT [Ship_Date] FROM [stg_pc_sales].[dbo].[raw_pc_data];

  /*===========================================
  Insight: 
  -We have 10 000 rows but with n/a ship dates 
  =============================================*/



  ------------------------------
  --Counting distinct ship dates
  ------------------------------
  SELECT DISTINCT (Ship_Date) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  /*================================
  Insight: 
  -We have 1110 distinct ship dates 
  ==================================*/



  --------------------------------------
  --Couting the number of n/a ship dates
  --------------------------------------
  SELECT COUNT(ShIp_date) AS no_date FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE Ship_Date = 'N/A';

  /*================================
  Insight: 
  -We have 5071 unknown ship dates 
  ==================================*/



  ----------------------------------------------------------
  --Checking for the range date oldest and lastest ship date
  ----------------------------------------------------------
  SELECT MIN(Ship_Date) AS oldest_date,
         MAX(Ship_Date) AS latest_date
  FROM [stg_pc_sales].[dbo].[raw_pc_data];


 /* ====================================================
   Insight:
  - The ship date ranges from 2021-03-12 to unknown date
  ======================================================*/



  SELECT DISTINCT [Ship_Date]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  ORDER BY Ship_Date DESC;


  /*========================================================================
  Insight:
  - The ship date ranges from 2021-03-13 to 2024-04-08 being the latest date
  ==========================================================================*/



  -----------------------------------------
  --Counting the number ships per ship_date
  -----------------------------------------
  SELECT [Ship_Date], 
  COUNT(*) AS number_of_ships
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  GROUP BY [Ship_Date]
  HAVING COUNT(*) > 1

  ------------------------------------
  --Checking for nulls from ship date 
  ------------------------------------
  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE Ship_Date IS NULL;

 /*==========
   Insight:
  - No nulls 
  ===========*/