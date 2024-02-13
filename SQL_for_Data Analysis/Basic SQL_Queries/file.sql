 --> /*Aliasing a column name in SQL*/

SELECT 
       [Organization Level] = [OrganizationLevel]
      ,[JobTitle]
      ,[HireDate]
      ,[VacationHours]
	  
FROM [AdventureWorks2019].[HumanResources].[Employee]

--> /*Selecting a literal value*/

SELECT [Name] = 'Travis'

/*Selecting custom values*/
SELECT TOP (10) 
       [Query Author] = 'Travis'
      ,[Query Number] = 10
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

--> /*Applying criteria with WHERE*/

/*Applying criteria to a text field*/

SELECT 
	   [BusinessEntityID]
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

WHERE [JobTitle] = 'Research and Development Manager'


/*Applying criteria to a numeric field*/

SELECT 
	   [BusinessEntityID]
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

WHERE [SalariedFlag] = 0

--> /*Finding Inequalities and NULLS*/

/*Inequality example*/

SELECT [BusinessEntityID]
      ,[TerritoryID]
      ,[SalesQuota]
      ,[Bonus]
      ,[CommissionPct]
      ,[SalesYTD]
      ,[SalesLastYear]
      ,[rowguid]
      ,[ModifiedDate]
	  
FROM [AdventureWorks2019].[Sales].[SalesPerson]

WHERE [SalesQuota] != 250000



/*Using IS NULL*/

SELECT [BusinessEntityID]
      ,[TerritoryID]
      ,[SalesQuota]
      ,[Bonus]
      ,[CommissionPct]
      ,[SalesYTD]
      ,[SalesLastYear]
      ,[rowguid]
      ,[ModifiedDate]
	  
FROM [AdventureWorks2019].[Sales].[SalesPerson]

WHERE [SalesQuota] IS NULL


/*Using IS NOT NULL*/

SELECT [BusinessEntityID]
      ,[TerritoryID]
      ,[SalesQuota]
      ,[Bonus]
      ,[CommissionPct]
      ,[SalesYTD]
      ,[SalesLastYear]
      ,[rowguid]
      ,[ModifiedDate]
	  
FROM [AdventureWorks2019].[Sales].[SalesPerson]

WHERE [SalesQuota] IS NOT NULL



/*Combining inequalities and NULLs*/

SELECT [BusinessEntityID]
      ,[TerritoryID]
      ,[SalesQuota]
      ,[Bonus]
      ,[CommissionPct]
      ,[SalesYTD]
      ,[SalesLastYear]
      ,[rowguid]
      ,[ModifiedDate]
	  
FROM [AdventureWorks2019].[Sales].[SalesPerson]

WHERE [SalesQuota] != 250000 OR [SalesQuota] IS NULL


--> /*Multiple criteria with AND, OR, and IN*/ 

/*Example with AND*/

SELECT [BusinessEntityID]
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

  WHERE [JobTitle] = 'Sales Representative'
  AND [MaritalStatus] = 'S'

/*Example with OR*/


  SELECT
       [BusinessEntityID]
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

  WHERE [JobTitle] = 'Sales Representative'
  OR [MaritalStatus] = 'S'

/*Example with IN*/


  SELECT
       [BusinessEntityID]
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

  WHERE [JobTitle] IN('Senior Tool Designer', 'Research and Development Engineer', 'Senior Design Engineer')

--> /*Combining AND and OR*/

 /*
What we want:

 OrganizationLevel = 4,
 AND 
 SalariedFlag = 1 OR JobTitle = 'Senior Tool Designer'
*/

/*
What SQL hears if we don't use parentheses:

 OrganizationLevel = 4 AND SalariedFlag = 1,
 OR 
 JobTitle = 'Senior Tool Designer'
*/

SELECT TOP (1000) [BusinessEntityID]
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

  WHERE [OrganizationLevel] = 4
  AND SalariedFlag = 1
  OR JobTitle = 'Senior Tool Designer'


 /*
What SQL hears WITH parentheses:

 OrganizationLevel = 4, AND SalariedFlag = 1 OR JobTitle = 'Senior Tool Designer'
*/


SELECT TOP (1000) [BusinessEntityID]
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

  WHERE [OrganizationLevel] = 4
  AND (SalariedFlag = 1
  OR JobTitle = 'Senior Tool Designer')

--> Selecting Numerical value BY Range

/*Open-ended inequalities with >, <, >=, and <=*/

SELECT TOP (1000) [BusinessEntityID]
      ,[TerritoryID]
      ,[SalesQuota]
      ,[Bonus]
      ,[CommissionPct]
      ,[SalesYTD]
      ,[SalesLastYear]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Sales].[SalesPerson]

  WHERE [SalesQuota] < 250000
  --WHERE [SalesQuota] > 250000
  --WHERE [SalesQuota] <= 250000
  --WHERE [SalesQuota] >= 250000



/*Specific ranges with inequality operators and the AND keyword*/

SELECT TOP (1000) [SalesOrderID]
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

  WHERE [TotalDue] <= 30000
  AND [TotalDue] >= 20000



/*Specific ranges with the BETWEEN keyword*/

SELECT TOP (1000) [SalesOrderID]
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

  WHERE [TotalDue] BETWEEN 20000 AND 30000

--> /*Matching text Pattern with Wildcard*/

/*Using the % wildcard*/

SELECT [BusinessEntityID]
      ,[PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[AdditionalContactInfo]
      ,[Demographics]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Person].[Person]

  WHERE [FirstName] LIKE 'Tom%'
  AND [LastName] LIKE 'B%'


/*Pattern matching with brackets*/

SELECT [BusinessEntityID]
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

  WHERE [JobTitle] LIKE '%[0-9]%'


/*Using NOT LIKE with brackets*/

SELECT [BusinessEntityID]
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

  WHERE [JobTitle] NOT LIKE '%[0-9]%'

--> /*Sorting data with ORDER BY*/

/*ORDER BY DESC*/
SELECT [SalesOrderID]
      ,[OrderDate]
      ,[TotalDue]

  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]

  WHERE [TotalDue] > 10000

  ORDER BY [TotalDue] DESC


  /*ORDER BY ASC*/
SELECT [SalesOrderID]
      ,[OrderDate]
      ,[TotalDue]

  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]

  WHERE [TotalDue] > 10000

  ORDER BY [TotalDue] ASC --Alternately, just use ORDER BY [TotalDue] here


/*ORDER BY referencing column alias*/
SELECT [SalesOrderID]
      ,[OrderDate]
      ,[Total Amount Due] = [TotalDue]

  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]

  WHERE [TotalDue] > 10000

  ORDER BY [Total Amount Due] DESC


/*ORDER BY referencing column position*/
SELECT [SalesOrderID]
      ,[OrderDate]
      ,[Total Amount Due] = [TotalDue]

  FROM [AdventureWorks2019].[Sales].[SalesOrderHeader]

  WHERE [TotalDue] > 10000

  ORDER BY 3 DESC



/*ORDER BY First Name ONLY*/

SELECT [BusinessEntityID]
      ,[PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[AdditionalContactInfo]
      ,[Demographics]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Person].[Person]

  ORDER BY [FirstName]



/*ORDER BY First Name and Last Name*/

SELECT [BusinessEntityID]
      ,[PersonType]
      ,[NameStyle]
      ,[Title]
      ,[FirstName]
      ,[MiddleName]
      ,[LastName]
      ,[Suffix]
      ,[EmailPromotion]
      ,[AdditionalContactInfo]
      ,[Demographics]
      ,[rowguid]
      ,[ModifiedDate]
  FROM [AdventureWorks2019].[Person].[Person]

  ORDER BY [FirstName], [LastName]

-->  /*Selecting Unique values with SELECT DISTINCT*/

/*Selecting duplicate values from a column without SELECT DISTINCT*/

  SELECT 
       [JobTitle]

  FROM [AdventureWorks2019].[HumanResources].[Employee]


/*Selecting duplicate values from a column without SELECT DISTINCT, sorted*/

  SELECT 
       [JobTitle]

  FROM [AdventureWorks2019].[HumanResources].[Employee]

  ORDER BY 1


/*Selecting unique column values with SELECT DISTINCT*/


  SELECT DISTINCT
       [JobTitle]

  FROM [AdventureWorks2019].[HumanResources].[Employee]

  ORDER BY 1


/*Using SELECT DISTINCT across multiple columns*/


  SELECT DISTINCT
       [FirstName]
      ,[LastName]
  FROM [AdventureWorks2019].[Person].[Person]

  ORDER BY 2,1
  --ORDER BY 2,1