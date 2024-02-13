# Analyzing Sales and Customer Data in AdventureWorks2019 Using SQL
Microsoft has made available a sample database called AdventureWorks2019 that includes sales and customer information from a made-up cycling business called Adventure Works Cycles. In order to find trends and patterns that help guide corporate strategy and decision-making, we want to examine sales and customer data from the AdventureWorks2019 database in this project. In our work, we will employ ten database tables connected by shared keys and relationships. Gaining knowledge about consumer behavior, product performance, and sales trends is the main goal of this analysis, which can then be used to inform better corporate strategy and decision-making.

## Download AdventureWorks2019 Data set
Download .bak file (backup file) from OLTP data is for most typical online transaction processing workloads.[Link Text](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms).

> Note: The .sql file contains a set of SQL queries showcasing various aspects of querying and manipulating data using Microsoft SQL Server syntax. The examples cover different scenarios, from basic column aliasing to more complex criteria application, pattern matching, sorting, and selecting unique values.


## Table of Contents
1. Aliasing a Column Name
2. Selecting a Literal Value
3. Applying Criteria with WHERE
4. Finding Inequalities and NULLs
5. Multiple Criteria with AND, OR, and IN
6. Combining AND and OR
7. Selecting Numerical Values by Range
8. Matching Text Pattern with Wildcard
9. Sorting Data with ORDER BY
10. Selecting Unique Values with SELECT DISTINCT

## Aliasing a Column Name
#### Title: Aliasing a Column Name in SQL

#### Explanation: This section demonstrates how to use aliases to rename column headers in SQL queries.

```sql
-- Aliasing a column name
SELECT 
       [Organization Level] AS [OrgLevel]
      ,[JobTitle]
      ,[HireDate]
FROM [AdventureWorks2019].[HumanResources].[Employee]
```


## Selecting a Literal Value
#### Title: Selecting a Literal Value in SQL

#### Explanation: Learn how to select a literal value directly in SQL queries.

```sql
-- Selecting a literal value
SELECT [Name] = 'Travis'
```


## Applying Criteria with WHERE
#### Title: Applying Criteria with WHERE Clause

#### Explanation: Explore how to filter query results using the WHERE clause, both for text and numeric fields.

```sql
-- Applying criteria to a text field
SELECT 
       [BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
      ,[JobTitle]
FROM [AdventureWorks2019].[HumanResources].[Employee]
WHERE [JobTitle] = 'Research and Development Manager'

-- Applying criteria to a numeric field
SELECT 
       [BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
      ,[SalariedFlag]
FROM [AdventureWorks2019].[HumanResources].[Employee]
WHERE [SalariedFlag] = 0
```


## Finding Inequalities and NULLs
#### Title: Finding Inequalities and NULLs in SQL

#### Explanation: Learn how to handle inequalities and NULL values in SQL queries.
```sql
-- Inequality example
SELECT [BusinessEntityID]
      ,[TerritoryID]
      ,[SalesQuota]
FROM [AdventureWorks2019].[Sales].[SalesPerson]
WHERE [SalesQuota] != 250000

-- Using IS NULL
SELECT [BusinessEntityID]
      ,[TerritoryID]
      ,[SalesQuota]
FROM [AdventureWorks2019].[Sales].[SalesPerson]
WHERE [SalesQuota] IS NULL

-- Using IS NOT NULL
SELECT [BusinessEntityID]
      ,[TerritoryID]
      ,[SalesQuota]
FROM [AdventureWorks2019].[Sales].[SalesPerson]
WHERE [SalesQuota] IS NOT NULL

-- Combining inequalities and NULLs
SELECT [BusinessEntityID]
      ,[TerritoryID]
      ,[SalesQuota]
FROM [AdventureWorks2019].[Sales].[SalesPerson]
WHERE [SalesQuota] != 250000 OR [SalesQuota] IS NULL
```


## Multiple Criteria with AND, OR, and IN
#### Title: Using Multiple Criteria with AND, OR, and IN

#### Explanation: Explore how to apply multiple criteria to SQL queries using logical operators like AND, OR, and IN.
```sql
-- Example with AND
SELECT [BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
FROM [AdventureWorks2019].[HumanResources].[Employee]
WHERE [JobTitle] = 'Sales Representative'
  AND [MaritalStatus] = 'S'

-- Example with OR
SELECT
       [BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
FROM [AdventureWorks2019].[HumanResources].[Employee]
WHERE [JobTitle] = 'Sales Representative'
  OR [MaritalStatus] = 'S'

-- Example with IN
SELECT
       [BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
FROM [AdventureWorks2019].[HumanResources].[Employee]
WHERE [JobTitle] IN ('Senior Tool Designer', 'Research and Development Engineer', 'Senior Design Engineer')
```


## Combining AND and OR
#### Title: Combining AND and OR in SQL

#### Explanation: Understand how to use parentheses to combine AND and OR in SQL queries for accurate results.
```sql
-- Without parentheses
SELECT TOP (1000) [BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
FROM [AdventureWorks2019].[HumanResources].[Employee]
WHERE [OrganizationLevel] = 4
  AND SalariedFlag = 1
  OR JobTitle = 'Senior Tool Designer'

-- With parentheses
SELECT TOP (1000) [BusinessEntityID]
      ,[NationalIDNumber]
      ,[LoginID]
FROM [AdventureWorks2019].[HumanResources].[Employee]
WHERE [OrganizationLevel] = 4
  AND (SalariedFlag = 1 OR JobTitle = 'Senior Tool Designer')
```


## Selecting Numerical Values by Range
#### Title: Selecting Numerical Values by Range

#### Explanation: Retrieve records within a specific numerical range using comparison operators like >, <, >=, or <=.
```sql
-- Using > and <
SELECT *
FROM TableName
WHERE ColumnName > 100 AND ColumnName < 200

-- Using BETWEEN
SELECT *
FROM TableName
WHERE ColumnName BETWEEN 100 AND 200
```


## Matching Text Pattern with Wildcard
#### Title: Matching Text Pattern with Wildcard

####Explanation: Use wildcard characters like % to match text patterns in SQL queries.
```sql
-- Using % wildcard
SELECT *
FROM TableName
WHERE ColumnName LIKE 'Pattern%'

-- Using brackets for pattern matching
SELECT *
FROM TableName
WHERE ColumnName LIKE '%[0-9]%'
```


## Sorting Data with ORDER BY
#### Title: Sorting Data with ORDER BY

#### Explanation: Arrange query results in ascending or descending order based on specified columns.
```sql
-- Sorting in descending order
SELECT *
FROM TableName
ORDER BY ColumnName DESC

-- Sorting in ascending order (alternative syntax)
SELECT *
FROM TableName
ORDER BY ColumnName ASC
```


## Selecting Unique Values with SELECT DISTINCT
#### Title: Selecting Unique Values with SELECT DISTINCT

#### Explanation: Retrieve distinct (unique) values from a column in SQL queries.
```sql
-- Selecting distinct values from a single column
SELECT DISTINCT ColumnName
FROM TableName

-- Selecting distinct values across multiple columns
SELECT DISTINCT Column1, Column2
FROM TableName
```



## Contribution
   Contributions to the Data Analyst Toolkit are welcome! If you have suggestions, improvements, or new content to add, please follow these steps:

   1. Fork the repository.
   2. Create a new branch for your feature or bug fix.
   3. Make your changes and commit them with clear messages.
   4. Push your changes to your fork.
   5. Open a pull request, explaining the purpose and details of your changes.

## Author
Shamreen Tabassum or contact me Linkedin[Link Text](https://www.linkedin.com/in/shamreen-tabassum-ab56a2247/)  or Tableau Public[Link Text](https://public.tableau.com/app/profile/shamreen.tabassum/vizzes)

Feel free to reach out with any questions or feedback. Happy analyzing!
