----------------------------------------
-- Checking total records from raw data
---------------------------------------
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

  SELECT COUNT(*) AS number_of_records
  FROM [stg_pc_sales].[dbo].[raw_pc_data]


  SELECT * FROM [stg_pc_sales].[dbo].[raw_pc_data];

  /*Insight:
  -10 000 records */

  ========================================================================================================


  ---------------------------------------
  -- Checking purchase_date and ship_date
  ---------------------------------------
  SELECT [Purchase_Date] FROM [stg_pc_sales].[dbo].[raw_pc_data];

  /*Insight: 
  -The purchase data has 10 000 records and so does the total records in the dataset, 
  meaning every transaction row has a purchase date assigned to it.
  */

  --------------------------------------
  --Checking for distinct purchase dates
  --------------------------------------
  SELECT DISTINCT [Purchase_Date]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  ORDER BY [Purchase_Date] DESC;

  /*Insight: 
   - 1096 records */



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

  /*Insight:
  - The purchase date ranges from 2021-03-12 to 2024-03-11
  */


  ---------------------------------------
  --Checking for nulls from purchase date 
  ----------------------------------------
  SELECT COUNT(*) AS null_count
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE [Purchase_Date] IS NULL;

  /*Insight:
  - No nulls */


  ==============================================================================================================

  SELECT [Ship_Date] FROM [stg_pc_sales].[dbo].[raw_pc_data];

  /*Insight: 
  -We have 10 000 rows but with n/a ship dates */



  ------------------------------
  --Counting distinct ship dates
  ------------------------------
  SELECT DISTINCT (Ship_Date) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  /*Insight: 
  -We have 1110 distinct ship dates */



  --------------------------------------
  --Couting the number of n/a ship dates
  --------------------------------------
  SELECT COUNT(ShIp_date) AS no_date FROM [stg_pc_sales].[dbo].[raw_pc_data]
  WHERE Ship_Date = 'N/A';

  /*Insight: 
  -We have 5071 unknown ship dates */



  ----------------------------------------------------------
  --Checking for the range date oldest and lastest ship date
  ----------------------------------------------------------
  SELECT MIN(Ship_Date) AS oldest_date,
         MAX(Ship_Date) AS latest_date
  FROM [stg_pc_sales].[dbo].[raw_pc_data];

   /*Insight:
  - The ship date ranges from 2021-03-12 to unknown date
  */



  SELECT DISTINCT [Ship_Date]
  FROM [stg_pc_sales].[dbo].[raw_pc_data]
  ORDER BY Ship_Date DESC;

  /*Insight:
  - The ship date ranges from 2021-03-13 to 2024-04-08 being the latest date
  */



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

   /*Insight:
  - No nulls */

  ===========================================================================================================

  ---------------------------------------------------------------------
  -- CHecking distinct Continent, Country_or_State and Province_or_City
  ---------------------------------------------------------------------

  SELECT DISTINCT (Continent) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT DISTINCT (Country_or_State) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT DISTINCT (Province_or_City) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  /*Insight:
  -2 distinct Continents
  -20 distinct Countries_or_States
  -498 distinct Provinces_or_Cities */


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

  ===========================================================================================================

  -------------------------------------------
  -- Checking distinct Shop_name and Shop_age
  -------------------------------------------
  SELECT DISTINCT (Shop_Name) FROM [stg_pc_sales].[dbo].[raw_pc_data];
  
  SELECT DISTINCT (Shop_Age) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  /*Insight:
  - 17 distinct Shop_names
  - 10 distinct shop_ages */

  ===========================================================================================================

  -----------------------------------------------------------------------------
  -- Checking distinct PC_Make, PC_Model, Storae_Type, RAM and Storage_Capacity
  -----------------------------------------------------------------------------
  SELECT DISTINCT (PC_Make) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT DISTINCT (PC_Model) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT DISTINCT (RAM) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT DISTINCT (Storage_Type) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  SELECT DISTINCT (Storage_Capacity) FROM [stg_pc_sales].[dbo].[raw_pc_data];

  /*Insight:
  - 10 distinct Pc_makes
  - 92 distinct Pc_Models
  - 4 distinct RAMs
  - 3 distinct Storage_capacities */

  ===========================================================================================================

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








