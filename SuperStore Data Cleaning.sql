
SELECT *
FROM [SuperStore Data Project]..SuperStoreData

SELECT OrderDateConverted
FROM [SuperStore Data Project]..SuperStoreData

-----------------------------------------------------------------------------------------------------------------------------------------

--- Standardize Date Format


SELECT  [Order Date], CONVERT(Date,[Order Date]) 
FROM [SuperStore Data Project]..SuperStoreData



ALTER TABLE [SuperStore Data Project]..SuperStoreData
Add OrderDateConverted Date;

Update [SuperStore Data Project]..SuperStoreData
SET OrderDateConverted = CONVERT(Date,[Order Date])



--  Remove Duplicate
WITH RowNumCTE AS (
SELECT *,
    ROW_NUMBER()  OVER (
	PARTITION BY  [Row ID],  
	              [Order ID],
				  [PRODUCT ID],
				  [Order Date]
				  order by 
				  [Row ID]
				  ) row_num
FROM [SuperStore Data Project]..SuperStoreData
)
SELECT *
FROM RowNumCTE
WHERE row_num > 1
Order By [Ship Mode]


-- Delete Unused Columns

SELECT *
FROM [SuperStore Data Project]..SuperStoreData

ALTER TABLE  [SuperStore Data Project]..SuperStoreData
DROP COLUMN [Customer Name], [Product Name], Order_date