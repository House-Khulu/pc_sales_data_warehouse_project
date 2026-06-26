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
  =================================*/
