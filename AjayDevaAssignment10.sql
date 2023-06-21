--*  BusIT 103           Assignment   #10              DUE DATE :  Consult course calendar
							
--You are to develop SQL statements for each task listed.  
--You should type your SQL statements under each task.  

/*	Submit your .sql file named with your last name, first name and assignment # (e.g., SuneelPratimaAssignment10.sql). 
	Submit your file to the instructor through the course site.  
	
	Class standard: All KEYWORDS such as SELECT, FROM, WHERE, INNER JOIN and so on must be in all capital letters and on separate lines. */


--  It is your responsibility to provide a meaningful column name for the return value of the function.


USE AdventureWorksDW2012;

-- 1.a. Find the total number of customers who are single. Be sure to name each derived field. (2 points)
--      8473
SELECT Count(*) as SingleCustomers
FROM DimCustomer
WHERE MaritalStatus = 'S'



--1.b. Find the total number of customers who are married. Be sure to name each derived field. (2 points)
SELECT Count(*) as MarriedCustomers
FROM DimCustomer
WHERE MaritalStatus = 'M'
--1.c. Find the total children and total cars owned for customers who own homes. (2 points)
--     TotalChildren	TotalCars
--	   25,648			18,216	

select sum (TotalChildren)  as TotalChildren, sum (NumberCarsOwned) as TotalCarsOwned
from DimCustomer
where HouseOwnerFlag = 1
--     
--1.d. Find the total children, total cars owned, and average income for customers who own homes. (2 points)
--     TotalChildren	TotalCars	AvgYearlyIncome
--     25,648			18,216		58,326.6677

select sum (TotalChildren)  as TotalChildren, sum (NumberCarsOwned) as TotalCarsOwned, Avg (YearlyIncome) as YearlyIncome
from DimCustomer
where HouseOwnerFlag = 1

--2.a.  List the total dollar amount (SalesAmount) for sales to Resellers. (2 points)
--      80,450,596.9823
SELECT SUM (SalesAmount) as TotalResellerSalesAmount
FROM FactResellerSales


--2.b.  List the total dollar amount (SalesAmount) for 2006 sales to Resellers who are value added resellers. (6 points)
--      10,523,819.7252
SELECT SUM (FR.SalesAmount) as " TotalSalesAmount"
FROM FactResellerSales as FR
INNER JOIN DimReseller as R
ON FR.ResellerKey = R.ResellerKey
WHERE OrderDate between '20060101' and '20061231'
AND R.BusinessType = 'Value Added Reseller'

--3.  List the average selling price for a mountain bike sold by AdventureWorks over the Internet. (6 points)
--	  2002.5673
SELECT AVG (F.SalesAmount) as 'MeanSellingPrice'
FROM FactInternetSales as F
INNER JOIN DimProduct as P
ON F.ProductKey = P.ProductKey
INNER JOIN DimProductSubcategory as S
ON P.ProductSubcategoryKey = S.ProductSubcategoryKey
WHERE EnglishProductSubcategoryName = 'Mountain Bikes'
--4.a. Find average list price for accessory. (2 points)
--     34.2281
SELECT AVG(ListPrice) as MeanListPrice
FROM DimProduct as P
INNER JOIN DimProductSubcategory as C
ON P.ProductSubcategoryKey = C.ProductSubcategoryKey
WHERE C.ProductCategoryKey = 4
--4.b. List all products in the accessories category that have a list price lower than the average list price
--     for an accessory.  Show product alternate key, English product name, and list price.
--	   Order descending by list price. (10 points)
--     25 rows
SELECT AVG(ListPrice) 
FROM DimProduct as P
INNER JOIN DimProductSubcategory as S
ON P.ProductSubcategoryKey = S.ProductSubcategoryKey
INNER JOIN DimProductCategory as C 
ON S.ProductCategoryKey = C.ProductCategoryKey
WHERE C.ProductCategoryKey = 4

SELECT ProductAlternateKey,EnglishProductCategoryName,ListPrice 
FROM DimProduct as P
INNER JOIN DimProductSubcategory as S
ON P.ProductSubcategoryKey = S.ProductSubcategoryKey
INNER JOIN DimProductCategory as C 
ON S.ProductCategoryKey = C.ProductCategoryKey
WHERE C.ProductCategoryKey = 4
AND ListPrice < 34.2281
ORDER BY ListPrice DESC
--5. List the lowest list price, the average list price,  and the highest list price for a helmet. (5 points)
--   33.6442  34.0928  34.99		 

SELECT Min(ListPrice) as LowestPrice, Avg(ListPrice) as MeanPrice, Max(ListPrice) as HighestPrice
FROM DimProduct as P
INNER JOIN DimProductSubcategory as S
ON P.ProductSubcategoryKey = S.ProductSubcategoryKey
WHERE P.ProductSubcategoryKey = 31
-- 6. List total Internet sales for product BK-R64Y-42. Show a calculated amount (using a calculation) and a sum amount, they should match. (6 points)

--    Included both methods of getting total sales
--    CalculatedAmt 334586.3175   SumSalesAmt 334586.3175

 SELECT Sum(SalesAmount) as SumSalesAmt
 FROM FactInternetSales as S
 INNER JOIN DimProduct as P
 ON S.ProductKey = P.ProductKey
 WHERE ProductAlternateKey = 'BK-R64Y-42' 

--7.  In your own words, write a business question that you can answer by querying the data warehouse
--    and using an aggregate function.
--    Then write the complete SQL query that will provide the information that you are seeking. (5 points)

--List the lowest list price, the average list price,  and the highest list price for all accessiories.
--2.29   34.2281   159.00

SELECT Min(ListPrice) as LowestPrice, Avg(ListPrice) as MeanPrice, Max(ListPrice) as HighestPrice
FROM DimProduct as P
INNER JOIN DimProductSubcategory as S
ON P.ProductSubcategoryKey = S.ProductSubcategoryKey
WHERE S.ProductCategoryKey = 4