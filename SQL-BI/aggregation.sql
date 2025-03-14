------------------------
-- Aggregation Functions
------------------------

USE AdventureWorks2019

SELECT TOP(5) *
FROM [Purchasing].[PurchaseOrderDetail]
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM .[Purchasing].[PurchaseOrderDetail] WHERE UnitPrice > 60)


SELECT MAX(TotalDue) AS sum_total_due
FROM [Sales].[SalesOrderHeader]
WHERE DATEPART(YEAR, OrderDate) = 2013


SELECT COUNT(*)
FROM [Sales].[SalesPerson]


SELECT p.FirstName, p.LastName, s.SalesYTD
FROM [Sales].[SalesPerson] as s
INNER JOIN [Person].[Person] as p ON p.BusinessEntityID = s.BusinessEntityID
WHERE s.SalesYTD > (SELECT STDEV(SalesYTD) FROM [Sales].[SalesPerson])


SELECT ps.Name, COUNT(p.ProductID) AS NumberProduct
FROM [Production].[Product] as p
INNER JOIN [Production].[ProductSubcategory] as ps ON ps.ProductSubcategoryID = p.ProductSubcategoryID
GROUP BY ps.Name
HAVING COUNT(p.ProductID) > 10


SELECT ProductID, Name
FROM [Production].[Product]
ORDER BY Name ASC


SELECT ps.Name AS ProductSubCategory,
        p.Name AS Product
FROM [Production].[Product] as p
INNER JOIN [Production].[ProductSubcategory] AS ps ON ps.ProductSubcategoryID = p.ProductSubcategoryID
ORDER BY ps.Name ASC, p.Name DESC

SELECT p.Name
FROM [Production].[Product] AS p
WHERE p.Name LIKE '%Thin%'

SELECT TOP(10) PERCENT
        p.FirstName,
        p.LastName,
        s.SalesYTD

FROM [Sales].[SalesPerson] as s
INNER JOIN [Person].[Person] AS p ON p.BusinessEntityID = s.BusinessEntityID
ORDER BY s.SalesYTD