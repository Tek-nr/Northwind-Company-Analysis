/********************************
-- Question 6
The Pricing Team wants to know how each category performs according to their price range. 
In order to help them they asked you to provide them a list of categories with:

1. their category name
2. their price range as:
    “1.Below $20”
    “2. $20 - $50”
    “3. Over $50”
3. their total amount (formatted to be integer)
4. their number of orders

Finally order the results by category name then price range (both ascending order).
***********************************/

SELECT 
	C.CategoryName AS Categories,
	ROUND(SUM(OD.UnitPrice*OD.Quantity),2) AS TotalAmount,
	COUNT(DISTINCT OD.OrderID) AS TotalNumberOrders,
	CASE 
			WHEN P.UnitPrice < 20 THEN '1. Below $20'
			WHEN P.UnitPrice >= 20 AND P.UnitPrice < 50 THEN '2. $20 - $50'
			WHEN P.UnitPrice > 50 THEN '3. Over $50'
	END AS PriceRange
FROM 
	Products P
INNER JOIN 
	Categories C ON C.CategoryID = P.CategoryID
INNER JOIN 
	[Order Details] OD ON OD.ProductID = P.ProductID
GROUP BY 
	C.CategoryName,
	CASE 
			WHEN P.UnitPrice < 20 THEN '1. Below $20'
			WHEN P.UnitPrice >= 20 AND P.UnitPrice < 50 THEN '2. $20 - $50'
			WHEN P.UnitPrice > 50 THEN '3. Over $50'
	END
ORDER BY
	C.CategoryName,
	CASE 
			WHEN P.UnitPrice < 20 THEN '1. Below $20'
			WHEN P.UnitPrice >= 20 AND P.UnitPrice < 50 THEN '2. $20 - $50'
			WHEN P.UnitPrice > 50 THEN '3. Over $50'
	END

-- The error occurred when I tried to type PriceRange instead of the Case.
