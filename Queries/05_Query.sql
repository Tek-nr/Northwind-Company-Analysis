/********************************
-- Question 5
The Pricing Team wants to know which products had an unit price increase and 
the percentage increase was not between 20% and 30%. In order to help them they 
asked you to provide them a list of products with:

1. their product name
2. their current unit price (formatted to have only 2 decimals)
3. their previous unit price (formatted to have only 2 decimals)
4. their percentage increase as:
(New Number - Original Number) ÷ Original Number × 100 
(with the result formatted to an integer, e.g 50 for 50%)

Filtered on the following conditions:

1. their percentage increase is not between 20% and 30%
2. their total number of orders is greater than 10 orders
***********************************/

WITH PRICELIST AS (
	SELECT 
			P.ProductName,
			P.ProductID,
			P.UnitPrice AS PrevPrice,
			OD.UnitPrice AS CurrentPrice,
			OD.OrderID
	FROM [Order Details] AS OD
	INNER JOIN Products AS P ON P.ProductID = OD.ProductID
)
SELECT 
	ProductName,
	CurrentPrice, 
	PrevPrice,
	ROUND((PrevPrice-CurrentPrice)*100/PrevPrice,2) 
	AS Percentage_Increase
FROM PRICELIST
GROUP BY 
	ProductName, 
	PrevPrice,
	CurrentPrice
HAVING 
COUNT(DISTINCT OrderID) > 10 AND 
	ROUND((PrevPrice-CurrentPrice)*100/PrevPrice,2)
	NOT BETWEEN 20 AND 30
	






