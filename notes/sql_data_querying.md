# SQL Data Querying Language

```sql
-- Query Data

USE MyDatabase;
GO

-- Practice writing SELECT statements to query data from the customers table.
-- Retrieve all columns and rows from the customers table.
SELECT *
FROM customers
GO

-- WHERE clause to filter data
-- Retrieve customers from Germany
SELECT *
FROM customers
WHERE country = 'Germany'
GO

-- Order the results by score in descending order
SELECT *
FROM customers
ORDER BY score DESC
GO

-- Retrieve customers from Germany and order by score in descending order
SELECT *
FROM customers
WHERE country = 'Germany'
ORDER BY score DESC
GO

/* ==============================================================================
   GROUP BY
=============================================================================== */

/* Retrieve the total score for each country. 
   The GROUP BY clause groups the results by country, 
   and the SUM() function calculates the total score for each group. */
SELECT 
    country,
    SUM(score) AS total_score
FROM customers
GROUP BY country
GO

```