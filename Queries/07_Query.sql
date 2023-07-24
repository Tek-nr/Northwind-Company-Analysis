/********************************
-- Question 7
The Logistics Team wants to know what is the current state of our regional 
suppliers' stocks for each category of product. In order to help them they 
asked you to provide them a list of categories with:

1. their supplier region” as: 
   * “America”
   * “Europe”
   * “Asia-Pacific”
2. their category name
3. their total units in stock
4. their total units on order
5. heir total reorder level

Finally order the results by supplier region then category name then price range 
(each in ascending order).
***********************************/

SELECT 
	C.CategoryName,
	CASE
		WHEN S.Country IN ('Australia', 'Singapore', 'Japan' ) THEN 'Asia-Pacific'
		WHEN S.Country IN ('US', 'Brazil', 'Canada') THEN 'America'
		ELSE 'Europe'
	END AS Supplier_Region,
	P.UnitsInStock AS UnitsInStock,
	P.UnitsOnOrder AS UnitsOnOrder,
	P.ReorderLevel AS ReorderLevel
FROM 
	Suppliers AS S
INNER JOIN
	Products P ON P.SupplierID = S.SupplierID
INNER JOIN 
	Categories C ON C.CategoryID = P.CategoryID
WHERE s.region IS NOT NULL
ORDER BY 
	C.CategoryName,
	Supplier_Region,
	P.UnitPrice
