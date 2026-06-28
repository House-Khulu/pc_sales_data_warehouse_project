/* ===========================================
   Exploratory Data Analysis on : Product info
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
  FROM [stg_pc_sales].[dbo].[raw_pc_data]


SELECT DISTINCT
       [PC_Make]
      ,[PC_Model]
      ,[Storage_Type]
      ,[RAM]
      ,[Storage_Capacity]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]


  SELECT * FROM [stg_pc_sales].[dbo].[raw_pc_data];

  -----------------------------------------------------------------------------
  -- Checking distinct PC_Make, PC_Model, Storae_Type, RAM and Storage_Capacity
  -----------------------------------------------------------------------------
  SELECT DISTINCT (PC_Make) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT DISTINCT (PC_Model) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT DISTINCT (RAM) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT DISTINCT (Storage_Type) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT DISTINCT (Storage_Capacity) FROM [stg_pc_sales].[dbo].[raw_pc_data];



  /*===============================
  Insight:
  - 10 distinct Pc_makes
  - 92 distinct Pc_Models
  - 4 distinct RAMs
  - 3 distinct Storage_capacities 
  - 2 distinct storage type
  =================================*/

   ----------------------------------------------------------------------------------
  --Checking for NULLS from PC make, PC models, RAM, storage capacity & storage type
  -----------------------------------------------------------------------------------
  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [PC_Make] IS NULL;

  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [PC_Model] IS NULL;

  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [RAM] IS NULL;

  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Storage_Capacity] IS NULL;

  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Storage_Type] IS NULL;

  /*=====================================
  Insight:No NULLS from the above queries
  =======================================*/


  /*===================================================================================
  Note: If the original value is not equal to the same values after trimming, it means
  there are spaces. If there are no results after running the query, it means 
  there are no spaces
  =====================================================================================*/

  ---------------------------------------------------------------------------------------
  -- Checking for unwanted space PC make, PC models, RAM, storage capacity & storage type
  ---------------------------------------------------------------------------------------

  SELECT [PC_Model]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [PC_Model] != TRIM([PC_Model]);


  SELECT [PC_Make]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [PC_Make] != TRIM([PC_Make]);

  
  SELECT [RAM]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [RAM] != TRIM([RAM]);


  SELECT [Storage_Capacity]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Storage_Capacity] != TRIM([Storage_Capacity]);


  SELECT [Storage_Type]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Storage_Type] != TRIM([Storage_Type]);


  /*==================================================
  Insight: there are no spaces from the above queries
  ====================================================*/