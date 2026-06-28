/* ======================================
   Exploratory Data Analysis on : Metrics
   ====================================== */

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


  ------------------------------------------
  --Retrieving columns consisting of metrics
  ------------------------------------------

  SELECT 
       [Cost_Price]
      ,[Sale_Price]
      ,[Discount_Amount]
      ,[Finance_Amount]
      ,[Credit_Score]
      ,[Cost_of_Repairs]
      ,[Total_Sales_per_Employee]
      ,[PC_Market_Price]
  FROM [stg_pc_sales].[dbo].[raw_pc_data];


  /*=================================================================
  Checking for NULLS or negatvive numbers on the following columns:
  - Cost_Price
  - Sale_Price
  - Discount_Amount
  - Finance_Amount
  - Credit_Score
  - Cost_of_Repairs
  - Total_Sales_per_Employee
  - PC_Market_Price

  Note : No results means there are no NULLS or ngetaive numbers
  ===================================================================*/
  
  SELECT [Cost_Price]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Cost_Price] < 0 OR [Cost_Price] IS NULL;


  SELECT [Sale_Price]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Sale_Price] < 0 OR [Sale_Price] IS NULL;


  SELECT [Discount_Amount]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Discount_Amount] < 0 OR [Discount_Amount] IS NULL;


  SELECT [Finance_Amount]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Finance_Amount] < 0 OR [Finance_Amount] IS NULL;


  SELECT [Credit_Score]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Credit_Score] < 0 OR [Credit_Score] IS NULL;


  SELECT [Cost_of_Repairs]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Cost_of_Repairs] < 0 OR [Cost_of_Repairs] IS NULL;


  SELECT [Total_Sales_per_Employee]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Total_Sales_per_Employee] < 0 OR [Total_Sales_per_Employee] IS NULL;


  SELECT [PC_Market_Price]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [PC_Market_Price] < 0 OR [PC_Market_Price] IS NULL;

 /*==========================================================
  Insight:No NULLS nor negative values from the above queries
  ===========================================================*/


  --------------------------------
  --Count total sales per employee
  --------------------------------

  SELECT COUNT([Total_sales_per_employee]) AS Total_sales
  FROM [stg_pc_sales].[dbo].[raw_pc_data];

  /*===============================================
  Insight: 10 000 Total sales just as total records  
  =================================================*/



