/* =========================================
   CREATE clean_dim_date TABLE
   Database : stg_pc_sales
   Schema   : dbo
   ========================================= */

IF OBJECT_ID('[stg_pc_sales].[dbo].[clean_dim_date]', 'U') IS NULL
BEGIN

    CREATE TABLE [stg_pc_sales].[dbo].[clean_dim_date] (

        date_key            INT PRIMARY KEY,      -- YYYYMMDD
        full_date          DATE NOT NULL,

        year               INT,
        quarter            INT,
        month              INT,
        month_name         VARCHAR(20),
        month_year         VARCHAR(20),

        week_number        INT,

        day                INT,
        day_name           VARCHAR(20),
        day_of_week        INT,

        is_weekend         BIT,
        is_business_day    BIT,

        is_month_start     BIT,
        is_month_end       BIT,

        is_quarter_start   BIT,
        is_quarter_end     BIT

    );

END;


/* =========================================
   GENERATE DATES
   ========================================= */

WITH date_cte AS (

    SELECT CAST('2020-01-01' AS DATE) AS d

    UNION ALL

    SELECT DATEADD(DAY, 1, d)
    FROM date_cte
    WHERE d < '2030-12-31'

)


/* =========================================
   LOAD clean_dim_date (SAFE FOR RE-RUNS)
   ========================================= */

INSERT INTO [stg_pc_sales].[dbo].[clean_dim_date] (

    date_key,
    full_date,

    year,
    quarter,
    month,
    month_name,
    month_year,

    week_number,

    day,
    day_name,
    day_of_week,

    is_weekend,
    is_business_day,

    is_month_start,
    is_month_end,

    is_quarter_start,
    is_quarter_end

)

SELECT

    CAST(CONVERT(VARCHAR(8), d, 112) AS INT) AS date_id,
    d AS full_date,

    YEAR(d) AS year,
    DATEPART(QUARTER, d) AS quarter,
    MONTH(d) AS month,
    DATENAME(MONTH, d) AS month_name,
    FORMAT(d, 'MMM-yyyy') AS month_year,

    DATEPART(WEEK, d) AS week_number,

    DAY(d) AS day,
    DATENAME(WEEKDAY, d) AS day_name,
    DATEPART(WEEKDAY, d) AS day_of_week,

    CASE WHEN DATEPART(WEEKDAY, d) IN (1, 7) THEN 1 ELSE 0 END AS is_weekend,

    CASE WHEN DATEPART(WEEKDAY, d) IN (1, 7) THEN 0 ELSE 1 END AS is_business_day,

    CASE WHEN DAY(d) = 1 THEN 1 ELSE 0 END AS is_month_start,

    CASE WHEN d = EOMONTH(d) THEN 1 ELSE 0 END AS is_month_end,

    CASE
        WHEN MONTH(d) IN (1, 4, 7, 10)
        AND DAY(d) = 1
        THEN 1 ELSE 0
    END AS is_quarter_start,

    CASE
        WHEN MONTH(d) IN (3, 6, 9, 12)
        AND d = EOMONTH(d)
        THEN 1 ELSE 0
    END AS is_quarter_end

FROM date_cte

WHERE NOT EXISTS (
    SELECT 1
    FROM [stg_pc_sales].[dbo].[clean_dim_date] dd
    WHERE dd.full_date = date_cte.d
)

OPTION (MAXRECURSION 0);


/* =========================================
   VALIDATION
   ========================================= */

SELECT
    COUNT(*) AS total_dates,
    MIN(full_date) AS start_date,
    MAX(full_date) AS end_date
FROM [stg_pc_sales].[dbo].[clean_dim_date];


/* =========================================
   VIEW DATA
   ========================================= */

SELECT *
FROM [stg_pc_sales].[dbo].[clean_dim_date]
ORDER BY full_date;