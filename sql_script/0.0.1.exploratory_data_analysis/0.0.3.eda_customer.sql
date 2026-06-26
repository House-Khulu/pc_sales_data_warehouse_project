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


  SELECT * FROM [stg_pc_sales].[dbo].[raw_pc_data];


   -----------------------------------------------------
  -- Checking distinct customer_name & customer_surname
  -----------------------------------------------------
  SELECT DISTINCT (customer_name) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  
  SELECT COUNT(customer_name) N FROM [stg_pc_sales].[dbo].[raw_pc_data];

  --------------------------------------------
  --Checking for duplicates from customer_name
  --------------------------------------------
  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE customer_name IS NULL;

  SELECT DISTINCT (customer_surname) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT COUNT(Customer_Surname) s FROM [stg_pc_sales].[dbo].[raw_pc_data];

  --------------------------------------------
  --Checking for duplicates from customer_name
  --------------------------------------------
  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE Customer_Surname IS NULL;

  /*Insight:
  - We have no nulls from the customer's Name & Surname */
