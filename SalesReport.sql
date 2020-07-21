/*
Post: Building a Sales Report using Adventure Works database

*/


--------------------------------------------------------------------------------
--------------------------- 10 biggest sales by products
--------------------------------------------------------------------------------

SELECT TOP 10 SUM([OrderQty] * [UnitPrice]) AS TotalSales
      ,[ProductID]

FROM [AdventureWorks2012].[Sales].[SalesOrderDetail]
GROUP BY ProductID
ORDER BY TotalSales DESC


--------------------------------------------------------------------------------
-------------------------- 10 most popular products 
--------------------------------------------------------------------------------


SELECT TOP 10 OrderQty
,[ProductID]
FROM [AdventureWorks2012].[Sales].[SalesOrderDetail]
ORDER BY OrderQty DESC


--------------------------------------------------------------------------------
------------------------------- Montly Sales
--------------------------------------------------------------------------------


SELECT	SUM (Sod.OrderQty * SOD.UnitPrice) AS TotalSales
		,DATENAME(MONTH,SH.OrderDate) AS MONTH

FROM [AdventureWorks2012].[Sales].[SalesOrderDetail] as SOD
INNER JOIN
[AdventureWorks2012].[Sales].[SalesOrderHeader] as SH ON SOD.SalesOrderID = SH.SalesOrderID

WHERE YEAR(SH.OrderDate) = 2005
GROUP BY DATENAME(MONTH,SH.OrderDate), MONTH(SH.OrderDate)
ORDER BY MONTH(SH.OrderDate)

--------------------------------------------------------------------------------
------------------------------- Sales by Country
--------------------------------------------------------------------------------

SELECT	SUM (Sod.OrderQty * SOD.UnitPrice) AS TotalSales
		,DATENAME(MONTH,SH.OrderDate) AS MONTH
		, ST.CountryRegionCode As Country
FROM [AdventureWorks2012].[Sales].[SalesOrderDetail] as SOD
	INNER JOIN
	[AdventureWorks2012].[Sales].[SalesOrderHeader] as SH 
		ON SOD.SalesOrderID = SH.SalesOrderID
	INNER JOIN [AdventureWorks2012].[Sales].[SalesTerritory] as ST
		ON ST.TerritoryID = SH.TerritoryID

WHERE YEAR(SH.OrderDate) = 2005
GROUP BY DATENAME(MONTH,SH.OrderDate), MONTH(SH.OrderDate), ST.CountryRegionCode
ORDER BY MONTH(SH.OrderDate)
