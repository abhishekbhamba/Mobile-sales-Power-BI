USE mobile_sales_database;
-- There are two tables in this database sales table and age table.
SELECT * FROM SALES;
SELECT * FROM AGE;

DESC SALES; -- SUMMARY OF THE TABLE
DESC AGE;

ALTER TABLE SALES
ADD PRIMARY KEY(Transaction_ID); -- adding primary key in both the table
ALTER TABLE AGE
ADD PRIMARY KEY(Transaction_ID);

SELECT truncate(sum((Units_Sold * Price_Per_Unit)/1000000),2) AS "TOTAL SALES IN MILLIONS"
FROM SALES; -- total sales in millions

SELECT COUNT(Transaction_ID) AS "TOTAL TRANSACTIONS"
FROM SALES; -- total transactions

SELECT TRUNCATE(AVG(Units_Sold * Price_Per_Unit),2) AS "AVERAGE SALES"
FROM SALES; -- average sales

SELECT Brand, ROUND(SUM(Units_Sold * Price_Per_Unit),0) AS "TOP 3 SALES"
FROM SALES
GROUP BY Brand
ORDER BY SUM(Units_Sold * Price_Per_Unit) DESC
LIMIT 3; -- top 3 sales by brand

SELECT Brand, ROUND(SUM(Units_Sold * Price_Per_Unit),0) AS "BOTTOM 3 SALES"
FROM SALES
GROUP BY Brand
ORDER BY SUM(Units_Sold * Price_Per_Unit) ASC
LIMIT 3; -- bottom 3 sales by brand

SELECT City, ROUND(SUM(Units_Sold * Price_Per_Unit),2) AS "SALES"
FROM SALES
GROUP BY City
ORDER BY ROUND(SUM(Units_Sold * Price_Per_Unit),2) DESC
LIMIT 5; -- top 5 sales by city

SELECT Month, ROUND(SUM(Units_Sold * Price_Per_Unit),2) AS "SALES BY MONTH"
FROM SALES
GROUP BY Month
ORDER BY ROUND(SUM(Units_Sold * Price_Per_Unit),2) DESC; -- sales by month

SELECT Year, ROUND(SUM(Units_Sold * Price_Per_Unit),2) AS "SALES BY YEAR"
FROM SALES
GROUP BY Year; -- sales by year

SELECT Age_group, COUNT(Transaction_ID) AS "TOTAL TRANSACTIONS"
FROM( SELECT Transaction_ID,
			 CASE
                 WHEN Customer_Age<=30 THEN "LESS THAN 30"
                 WHEN Customer_Age BETWEEN 31 AND 40 THEN "31-40"
                 WHEN Customer_Age BETWEEN 41 AND 50 THEN "41-50"
                 ELSE "GREATER THAN 50"
			 END AS Age_group
	FROM AGE) T
GROUP BY Age_group
ORDER BY Age_group; -- demand by age group