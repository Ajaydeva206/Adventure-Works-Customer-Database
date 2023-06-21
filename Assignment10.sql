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



--1.b. Find the total number of customers who are married. Be sure to name each derived field. (2 points)




--1.c. Find the total children and total cars owned for customers who own homes. (2 points)
--     TotalChildren	TotalCars
--	   25,648			18,216	



--     
--1.d. Find the total children, total cars owned, and average income for customers who own homes. (2 points)
--     TotalChildren	TotalCars	AvgYearlyIncome
--     25,648			18,216		58,326.6677




--2.a.  List the total dollar amount (SalesAmount) for sales to Resellers. (2 points)
--      80,450,596.9823




--2.b.  List the total dollar amount (SalesAmount) for 2006 sales to Resellers who are value added resellers. (6 points)
--      10,523,819.7252




--3.  List the average selling price for a mountain bike sold by AdventureWorks over the Internet. (6 points)
--	  2002.5673




--4.a. Find average list price for accessory. (2 points)
--     34.2281



--4.b. List all products in the accessories category that have a list price lower than the average list price
--     for an accessory.  Show product alternate key, English product name, and list price.
--	   Order descending by list price. (10 points)
--     25 rows




--5. List the lowest list price, the average list price,  and the highest list price for a helmet. (5 points)
--   33.6442  34.0928  34.99		 




-- 6. List total Internet sales for product BK-R64Y-42. Show a calculated amount (using a calculation) and a sum amount, they should match. (6 points)

--    Included both methods of getting total sales
--    CalculatedAmt 334586.3175   SumSalesAmt 334586.3175




--7.  In your own words, write a business question that you can answer by querying the data warehouse
--    and using an aggregate function.
--    Then write the complete SQL query that will provide the information that you are seeking. (5 points)

