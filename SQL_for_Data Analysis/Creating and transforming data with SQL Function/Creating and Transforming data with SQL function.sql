/*String concatenation: first and last name*/

SELECT 
       [FirstName]
      ,[LastName]
      ,[Full Name] = [FirstName] + ' ' + [LastName]
	  
FROM [AdventureWorks2019].[Person].[Person]


/*Multiplication - Commission YTD*/

SELECT 
	  [CommissionPct],
	  [SalesYTD],
	   [CommissionYTD] = [CommissionPct] * [SalesYTD]

  FROM [AdventureWorks2019].[Sales].[SalesPerson]


/*Subtraction - Income YTD*/

SELECT 
	  [CommissionPct],
	  [SalesYTD],
	  [Bonus],
	  [CommissionYTD] = [CommissionPct] * [SalesYTD],
	  [IncomeYTD] = ([CommissionPct] * [SalesYTD]) + [Bonus]

  FROM [AdventureWorks2019].[Sales].[SalesPerson]


/*Subtraction - Sales Delta Year Over Year*/

SELECT 
       [SalesYTD]
      ,[SalesLastYear]
	  ,[Difference] = [SalesLastYear] - [SalesYTD]


  FROM [AdventureWorks2019].[Sales].[SalesPerson]


/*Division - Bonus Fairness*/

SELECT 
       [SalesYTD]
      ,[Bonus]
	  ,[Bonus %] = ([Bonus] / [SalesYTD]) * 100


  FROM [AdventureWorks2019].[Sales].[SalesPerson]

  ORDER BY 3



/*Division - Handling Whole Numbers*/

SELECT 
       [SafetyStockLevel]
      ,[ReorderPoint]
      ,[ReorderPoint % SafetyStockLevel] = [ReorderPoint] / [SafetyStockLevel]
      ,[ReorderPoint % SafetyStockLevel FIXED] = [ReorderPoint] / ([SafetyStockLevel] * 1.0)

  FROM [AdventureWorks2019].[Production].[Product]


/*LEFT Function*/

SELECT
	  [PhoneNumber],
      [Area Code] = LEFT([PhoneNumber], 3)
FROM [AdventureWorks2019].[Person].[PersonPhone]

WHERE [PhoneNumber] NOT LIKE '%(%'


/*RIGHT Function*/

SELECT 
      [AccountNumber],
      [Last 6] = RIGHT([AccountNumber], 6)

  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]


/*LEN Function*/

SELECT
	  [PhoneNumber],
	  [Phone Number Length] = LEN([PhoneNumber])

 FROM [AdventureWorks2019].[Person].[PersonPhone]

WHERE LEN([PhoneNumber]) <= 12

/*Changing Email Domains With REPLACE*/

SELECT 
      [EmailAddress],
	  [Modified Email Address] = REPLACE([EmailAddress], 'adventure-works', 'hotmail')

FROM [AdventureWorks2019].[Person].[EmailAddress]


/*Combining LEN and LEFT to extract a variable number of characters from the beginning of a string*/

SELECT [EmailAddress]
	  ,[User Name Length] = LEN([EmailAddress]) - 20
	  ,[User Name] = LEFT([EmailAddress], LEN([EmailAddress]) - 20)
FROM [AdventureWorks2019].[Person].[EmailAddress]




/*Padding IDs to 10 characters with leading zeros*/

SELECT 
      [NationalIDNumber],
	  [ID Length] = LEN([NationalIDNumber]),
	  [Padded ID] = RIGHT('0000000000' + [NationalIDNumber], 10)

FROM [AdventureWorks2019].[HumanResources].[Employee]



/*Replacing commmas and periods in a string*/
SELECT [Description],
      [No Commas] = REPLACE([Description], ',', ''),
	  [No Commas Or Periods] = REPLACE(REPLACE([Description], ',', ''), '.', '')

FROM [AdventureWorks2019].[Production].[ProductDescription]


/*Current date and time with GETDATE()*/

SELECT [Current Timestamp] =  GETDATE()

/*Adding an "as of" column with GETDATE()*/

SELECT 
	   [As of Date] = GetDate()
      ,[BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
      ,[OrganizationNode]
      ,[OrganizationLevel]
      ,[JobTitle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[HireDate]
      ,[SalariedFlag]
      ,[VacationHours]
      ,[SickLeaveHours]
      ,[CurrentFlag]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[HumanResources].[Employee]


/*Creating a custom date with DATEFROMPARTS*/

SELECT [Custom Date] = DATEFROMPARTS(2020, 1,1)


/*Using dates in criteria*/

SELECT 
       [Order Year] = YEAR([OrderDate])
      ,[SalesOrderID]
      ,[RevisionNumber]
      ,[OrderDate]
      ,[DueDate]
      ,[ShipDate]
      ,[Status]
      ,[OnlineOrderFlag]
      ,[SalesOrderNumber]
      ,[PurchaseOrderNumber]
      ,[AccountNumber]
      ,[CustomerID]
      ,[SalesPersonID]
      ,[TerritoryID]
      ,[BillToAddressID]
      ,[ShipToAddressID]
      ,[ShipMethodID]
      ,[CreditCardID]
      ,[CreditCardApprovalCode]
      ,[CurrencyRateID]
      ,[SubTotal]
      ,[TaxAmt]
      ,[Freight]
      ,[TotalDue]
      ,[Comment]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]

  WHERE [OrderDate] < DATEFROMPARTS(2014, 1,1)
  --WHERE [OrderDate] >= DATEFROMPARTS(2014, 1,1)
  --WHERE [OrderDate] BETWEEN DATEFROMPARTS(2013, 1,1) AND DATEFROMPARTS(2013, 12, 31)
  --WHERE YEAR([OrderDate]) = 2013


/*Dynamically selecting the first day of the current month*/

SELECT [First Of Month] = DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)


/*Simple date math with GETDATE*/

SELECT GETDATE()
SELECT GETDATE() - 7

/*Determining prior month BOM and EOM with DATEADD*/

SELECT 
      [Current Date] = GETDATE(),
	  [First Of Month] = DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1),
	  [Last Day Previous Month] = DATEADD(DAY, -1, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1)),
	  [First Day Previous Month] = DATEADD(MONTH, -1, DATEFROMPARTS(YEAR(GETDATE()), MONTH(GETDATE()), 1))


/*Calculating elapsed time with DATEDIFF*/

SELECT 
       [OrderDate]
      ,[ShipDate]
	  ,[Elapsed Days] = DATEDIFF(DAY, [OrderDate], [ShipDate])

FROM [AdventureWorks2019].[Purchasing].[PurchaseOrderHeader]


/*Integer division*/

SELECT 3 / 2

/*Implicit conversion from integer type to decimal type*/

SELECT 3 / (2 * 1.0)


/*Converting decimal data to integer data with CAST*/

SELECT 
       [TotalDue]
       ,[Total Due Truncated] = CAST([TotalDue] AS INT)

FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]


/*Converting datetimes to dates*/

SELECT GETDATE() - 2222

SELECT CAST(GETDATE() - 2222 AS DATE)


/*Using converted dates in the WHERE clause*/

SELECT 
       [OrderDate]
      
FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]

--WHERE [OrderDate] >= (GETDATE() - 2222)
WHERE [OrderDate] >= CAST(GETDATE() - 2222 AS DATE)

ORDER BY 1


/*Casting a string as an int*/

SELECT CAST('123' AS INT)


/*Casting a string as date*/

SELECT CAST('2020-01-01' AS DATE)


--Formatting percentages:

SELECT ProductID
      ,Name
      ,StandardCost
      ,ListPrice
	  ,Markup = ListPrice / StandardCost - 1
	  ,EasyMarkup = FORMAT(ListPrice / StandardCost - 1, 'p')

  FROM AdventureWorks2019.Production.Product

WHERE StandardCost > 0


--Formatting currencies and dates:

SELECT 
	 OrderDate
	,FormattedOrderDate = FORMAT(OrderDate, 'MM/dd/yyyy')
	,TotalDue
	,FormattedTotalDue = FORMAT(TotalDue, 'c', 'en-gb')

FROM AdventureWorks2019.Sales.SalesOrderHeader

WHERE OrderDate = CAST('04-05-2014' AS DATE)


/*Creating default text values with ISNULL*/

SELECT  
       [Title]
	  ,[Modified Title] = ISNULL([Title], 'No Title')
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]

FROM [AdventureWorks2019].[Person].[Person]


/*Handling NULLs in inequalities with ISNULL*/

SELECT 
       [SalesQuota]
      ,[Bonus]
      ,[CommissionPct]
      ,[SalesYTD]
      ,[SalesLastYear]

FROM [AdventureWorks2019].[Sales].[SalesPerson]

WHERE ISNULL([SalesQuota], 0) != 250000


/*Basic CASE Statement*/

SELECT
[First Case] = 
	CASE
		WHEN 1 = 2 THEN 'A'
		WHEN 3 > 2 THEN 'B'
		WHEN 3 < 5 THEN 'C'
		ELSE 'D'
	END


/*Applying the CASE Statement to categorizing job titles*/

SELECT [JobTitle],
[Job Category] = 
	CASE
		WHEN [JobTitle] LIKE '%Production%' THEN 'Production'
		WHEN [JobTitle] LIKE '%Officer%' THEN 'Management'
		WHEN [JobTitle] LIKE '%Manager%' THEN 'Management'
		WHEN [JobTitle] LIKE '%President%' THEN 'Management'
		ELSE 'Other'
	END

  FROM [AdventureWorks2019].[HumanResources].[Employee]


/*Applying the CASE statement to aging buckets*/

SELECT 
      [OrderDate],
	  [Current Date] = CAST('07-31-2013' AS DATE),
	  [Elapsed Days] = DATEDIFF(DAY, [OrderDate], CAST('07-31-2013' AS DATE)),
	  [Aging Bucket] =
		CASE
			WHEN DATEDIFF(DAY, [OrderDate], CAST('07-31-2013' AS DATE)) < 10 THEN '< 10 Days'
			WHEN DATEDIFF(DAY, [OrderDate], CAST('07-31-2013' AS DATE)) BETWEEN 10 AND 19 THEN '10-19 Days'
			ELSE '20+ Days'
		END

FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]

WHERE [OrderDate] BETWEEN CAST('07-01-2013' AS DATE) AND CAST('07-31-2013' AS DATE)

