


SELECT 
  FORMAT(EOMONTH([Order Date], 0), 'MMM-yyyy') AS Month_Year,
  SUM(Sales) AS Total_Revenue,
  COUNT(*) AS Total_Orders
FROM Orders$
GROUP BY EOMONTH([Order Date], 0)
ORDER BY EOMONTH([Order Date], 0);

SELECT DISTINCT
  EOMONTH([Order Date], 0) AS Month,
  FORMAT(EOMONTH([Order Date], 0), 'MMM-yyyy') AS Month_Year,
  SUM(Sales) OVER (ORDER BY EOMONTH([Order Date], 0)) AS Running_Revenue
FROM Orders$
ORDER BY EOMONTH([Order Date], 0);




WITH MonthlyData AS (
  SELECT
    EOMONTH([Order Date], 0) AS Month,
    SUM(Sales) AS Monthly_Sales
  FROM Orders$
  GROUP BY EOMONTH([Order Date], 0)
)



SELECT 
  Month,
  Monthly_Sales,
  SUM(Monthly_Sales) OVER (ORDER BY Month) AS Running_Total
FROM MonthlyData
ORDER BY Month;
