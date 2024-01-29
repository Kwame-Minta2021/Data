SELECT *
FROM [SuperStore Data Project]..SuperStoreData

--Extract year from date  

SELECT 
        OrderDateConverted,
		DATEPART(YEAR, OrderDateConverted) AS YEARS,
		DATEPART(MONTH, OrderDateConverted) AS MONTHS 
FROM [SuperStore Data Project]..SuperStoreData

ALTER TABLE [SuperStore Data Project]..SuperStoreData
ADD  MONTHS VARCHAR(10) 

UPDATE [SuperStore Data Project]..SuperStoreData
SET MONTHS = DATEPART(MONTH, OrderDateConverted)


--Looking at the total sales and average sales per year

SELECT SUM(Sales) AS TotalSales
FROM [SuperStore Data Project]..SuperStoreData

SELECT  SUM(Sales) AS TotalSales, YEARS   
FROM [SuperStore Data Project]..SuperStoreData
Group by YEARS  
Order by YEARS

SELECT AVG(Sales) AS AvgSales
FROM [SuperStore Data Project]..SuperStoreData

SELECT AVG(Sales) AS AvgSales, YEARS
FROM [SuperStore Data Project]..SuperStoreData
--WHERE YEARS = '2016'
GROUP BY YEARS
ORDER BY YEARS


--Total profit per year

SELECT AVG(Profit) AS AvgProfit
FROM [SuperStore Data Project]..SuperStoreData

SELECT SUM(Profit) AS TotalProfit, YEARS
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY YEARS
ORDER BY YEARS

SELECT *
FROM [SuperStore Data Project]..SuperStoreData

--Profit Percentage PER YEAR

SELECT  YEARS,SUM(Profit) as Total_Profit  
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY YEARS
ORDER BY YEARS

SELECT  ROUND(SUM(Profit), 2) as Total_Profit  
FROM [SuperStore Data Project]..SuperStoreData

USE [SuperStore Data Project]
SELECT YEARS,  SUM(Profit)  as 'Total_Profit',
--(SUM(Profit)*100)/SUM(SUM(Profit)) OVER() AS 'Profit_Percentage', 
--CONVERT(float,(SUM(Profit)*100)/SUM(SUM(Profit)) OVER() ),
ROUND((SUM(Profit)*100)/SUM(SUM(Profit)) OVER(), 2) AS 'Profit_Percentage' 
FROM [SuperStore Data Project]..SuperStoreData
WHERE YEARS IS NOT NULL
GROUP BY YEARS
Order by YEARS


--------Total Sales,Maximum Sales, Minimum Sales, Quantity and Profit Percentage Per Product Category And Per Year

----Looking at  Total Sales Per Product Category

SELECT ROUND(SUM(Sales), 2) AS Total_Sales, Category
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY Category
ORDER BY Category

----Looking at  Total Sales Per Product Category by Year
SELECT SUM(Sales) AS Total_Sales, Category, YEARS
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY Category, YEARS
ORDER BY Category, YEARS

--Looking at Maximum Sales Per Product Category by year
SELECT MAX(Sales) AS MAX_Sales, Category, YEARS
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY Category, YEARS
ORDER BY Category, YEARS

--Looking at Minimum Sales Per Product Category by year
SELECT  MIN(Sales) AS MIN_Sales,Category, YEARS 
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY Category, YEARS
ORDER BY Category, YEARS

--Total Quantity of Products Ordered
SELECT  MAX(Quantity) AS MAX_Quantity_Sold,Category 
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY Category
ORDER BY Category

SELECT MAX(Quantity) AS MAX_Quantity_Sold, Category, YEARS
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY Category, YEARS
ORDER BY Category, YEARS

--Total Profit And Maximum Profit Per Category by Years
SELECT  SUM(Profit) as Total_Profit,Category,YEARS  
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY Category, YEARS
ORDER BY Category,YEARS

SELECT MAX(Profit) AS MAX_Profit, Category, YEARS
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY Category, YEARS
ORDER BY Category, YEARS

SELECT   
ROUND((SUM(Profit)*100)/SUM(SUM(Profit)) OVER(), 2) AS 'Profit_Percentage',  Category, YEARS 
FROM [SuperStore Data Project]..SuperStoreData
WHERE YEARS IS NOT NULL
GROUP BY Category, YEARS
Order by Category,YEARS


--------Average Sales,Maximum Sales, Minimum Sales, Total Profit and Profit Percentage  Per Year By States

--Finding out which states of the country needs more attention and which states needs continuous attention for the optimization of the company

----Looking at  Average Sales Per  States

SELECT ROUND(AVG(Sales), 2) AS Total_Sales, State
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY State
ORDER BY State


----Looking at  Average Sales Per State, Per Product Category by Year
SELECT AVG(Sales) AS Avg_Sales, Category, YEARS,State
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY Category, YEARS, State
ORDER BY Category, YEARS,State

--Looking at Maximum Sales Per State Per Product Category by year
SELECT MAX(Sales) AS MAX_Sales, Category, YEARS,State
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY Category, YEARS, State
ORDER BY Category, YEARS,State

--Looking at Minimum Sales Per Product Category by year
SELECT  Min(Sales) AS MIN_Sales,Category, YEARS,State 
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY Category, YEARS, State
ORDER BY Category, YEARS,State

--Total Quantity of Products Ordered Per State
SELECT  MAX(Quantity) AS MAX_Quantity_Sold,Category , State
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY Category, State
ORDER BY Category ,State

SELECT MAX(Quantity) AS MAX_Quantity_Sold, Category, YEARS,State
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY Category, YEARS, State
ORDER BY Category, YEARS, State

--Total Profit And Maximum Profit Per Category by State
SELECT  SUM(Profit) as Total_Profit,Category,State  
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY Category, State
ORDER BY Category,State

SELECT MAX(Profit) AS MAX_Profit, Category, State
FROM [SuperStore Data Project]..SuperStoreData
GROUP BY Category, State
ORDER BY Category, State

SELECT SUM(Profit) AS TOTALPROFIT,   
ROUND((SUM(Profit)*100)/SUM(SUM(Profit)) OVER(), 2) AS 'Profit_Percentage',  Category, State
FROM [SuperStore Data Project]..SuperStoreData
WHERE YEARS IS NOT NULL
GROUP BY Category, State
Order by Category,State








