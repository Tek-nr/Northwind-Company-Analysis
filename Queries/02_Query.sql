/********************************
-- Question 2
The Logistics Team wants to do a retrospection of their performances for the year 1998, 
in order to identify for which countries they didn’t perform well. They asked you to 
provide them a list of countries with the following information:

1. their average days between the order date and the shipping date (formatted to have only 2 decimals)
2. their total number of orders (based on the order date). Filtered on the following conditions:
	1. the year of order date is 1998
	2. their average days between the order date and the shipping date is greater or equal 5 days
	3. their total number of orders is greater than 10 orders

Finally order the results by country name in an ascending order (lowest first).
***********************************/

WITH PerformanceTable AS(
SELECT ShipCountry 
	AS Country, 
ROUND(AVG(DATEDIFF(Day, OrderDate, ShippedDate)), 2) 
	AS AverageDaysBetweenOrderAndShipping ,
COUNT(DISTINCT OrderID) 
	AS TotalOrderNumbers 
FROM ORDERS
WHERE OrderDate 
BETWEEN '1998-01-01' AND '1998-12-31'
GROUP BY ShipCountry
)

SELECT * FROM PerformanceTable
WHERE AverageDaysBetweenOrderAndShipping >= 5
AND TotalOrderNumbers > 10
ORDER BY Country







