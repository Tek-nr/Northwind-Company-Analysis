/********************************
-- Question 4
The Logistics Team wants to do a retrospection of their global performances over 1997-1998, 
in order to identify for which month they perform well. They asked you to provide them a list with:

1. their year/month as single field in a date format (e.g. “1996-01-01” January 1996)
2. their total number of orders
3. their total freight (formatted to have no decimals)

Filtered on the following conditions:
1. the order date is between 1997 and 1998
2. their total number of orders is greater than 35 orders 

Finally order the results by total freight (descending order).
***********************************/

SELECT 
	Year_Month, 
	COUNT(OrderID) AS Total_Number_Orders,
	SUM(Freight) AS Total_Freight
	FROM 
		(SELECT CONCAT(YEAR(OrderDate),'-', MONTH(OrderDate)) AS Year_Month,  
			Freight,
			OrderID
		FROM ORDERS
		WHERE OrderDate BETWEEN '1997-01-01' AND '1998-12-31'
		) 
AS NINETYX

GROUP BY Year_Month
HAVING COUNT(OrderID) > 35
ORDER BY Total_Freight DESC





