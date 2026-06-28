/* =================================================
   Exploratory Data Analysis on : Sales_person info
   ================================================= */

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
         [Sales_Person_Name]
        ,[Sales_Person_Department]
  FROM [stg_pc_sales].[dbo].[raw_pc_data];


  SELECT * FROM [stg_pc_sales].[dbo].[raw_pc_data];

  ----------------------------------------------------------------
  -- Checking distinct Sales_person_name & Sales_person_department
  ----------------------------------------------------------------
  SELECT DISTINCT [Sales_Person_Department] FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT DISTINCT [Sales_person_name] FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT [Sales_person_name], 
         [Sales_Person_Department],
         [Total_Sales_per_Employee],
  COUNT(*) AS number_of_counts
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  GROUP BY [Sales_person_name],
           [Sales_Person_Department],
           [Total_Sales_per_Employee]
  HAVING COUNT(*) > 1;



  /*==============================================
  Insight: 
  - 4 distinct sales_person_department
  ===============================================*/

  ---------------------------------------------------------------------
  --Checking for NULLS from Sales_person_name & Sales_person_department
  ---------------------------------------------------------------------
  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Sales_person_name] IS NULL;

  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Sales_person_department] IS NULL;

  
  /*=====================================
  Insight:No NULLS from the above queries
  =======================================*/

  /*===================================================================================
  Note: If the original value is not equal to the same values after trimming, it means
  there are spaces. If there are no results after running the query, it means 
  there are no spaces
  =====================================================================================*/

  --------------------------------------------------------------------------
  -- Checking for unwanted space Sales_person_name & Sales_person_department
  --------------------------------------------------------------------------

  SELECT [Sales_person_name]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Sales_person_name] != TRIM([Sales_person_name]);


  SELECT [Sales_person_department]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Sales_person_department] != TRIM([Sales_person_department]);

  /*==================================================
  Insight: there are no spaces from the above queries
  ====================================================*/

