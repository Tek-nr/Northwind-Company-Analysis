/********************************
-- Question 8
The Pricing Team wants to know for each currently offered product how their unit price
compares against their categories average and median unit price. In order to help them 
they asked you to provide them a list of products with:
1. their category name
2. their product name
3. their unit price
4. their category average unit price (formatted to have only 2 decimals)
5. their category median unit price (formatted to have only 2 decimals)
6. their position against the category average unit price as:
    * “Below Average”
    * “Equal Average”
    * “Over Average”
7. their position against the category median unit price as:
    * “Below Median”
    * “Equal Median”
    * “Over Median”

Filtered on the following conditions:
    * They are not discontinued

*Finally order the results by category name then product name (both ascending).
***********************************/

WITH Price AS(
SELECT 
	C.CategoryName,
	P.ProductName,
	P.UnitPrice,
	ROUND(AVG(OD.UnitPrice),2) 
		AS Average_Unit_Price,
	ROUND((PERCENTILE_CONT(0.5) 
		WITHIN GROUP (ORDER BY OD.UnitPrice) 
		OVER(PARTITION BY C.CategoryID)),2) 
		AS Median_Unit_Price,
	ROW_NUMBER() OVER (ORDER BY C.CategoryName, P.ProductName) AS RowNumber
FROM
	Products P
INNER JOIN
	Categories C ON C.CategoryID = P.CategoryID
INNER JOIN
	[Order Details] OD ON OD.ProductID = P.ProductID
WHERE 
	P.Discontinued = 0
GROUP BY
	C.CategoryName,
	P.ProductName,
	P.UnitPrice,
	OD.UnitPrice,
	C.CategoryID
)

SELECT 
	RowNumber,
	CategoryName,
	ProductName,
	UnitPrice,
	Average_Unit_Price,
	Median_Unit_Price,
	CASE 
		WHEN UnitPrice < Average_Unit_Price THEN 'Below Average'
		WHEN UnitPrice > Average_Unit_Price THEN 'Over Average'
		ELSE 'Equal Average'
	END AS Average_Unit_Price_Position,
	CASE
		WHEN UnitPrice < Median_Unit_Price THEN 'Below Median'
		WHEN UnitPrice > Median_Unit_Price THEN 'Over Median'
		ELSE 'Equal Median'
	END AS Median_Unit_Price_Position
FROM 
	Price
ORDER BY
	CategoryName,
	ProductName

-- I AM NOT SURE OF THIS SOLUTION.




