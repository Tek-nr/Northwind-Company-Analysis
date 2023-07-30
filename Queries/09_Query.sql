/********************************
-- Question 9
The Sales Team wants to build a list of KPIs to measure employees' performances. 
In order to help them they asked you to provide them a list of employees with:

1. their full name (first name and last name combined in a single field)
2. their job title
3. their total sales amount excluding discount (formatted to have only 2 decimals)
4. their total number of orders
5. their total number of entries (each row of an order)
6. their average amount per entry (formatted to have only 2 decimals)
7. their average amount per order (formatted to have only 2 decimals)
8. their total discount amount (formatted to have only 2 decimals)
9. their total sales amount including discount (formatted to have only 2 decimals)
10. Their total discount percentage (formatted to have only 2 decimals)

Finally order the results by total sales amount including discount (descending).
***********************************/

WITH KPI AS (
SELECT
	CONCAT(E.FirstName,' ', E.LastName) 
		AS EmployeeName,
	E.Title,
	ROUND(SUM(OD.UnitPrice*OD.Quantity),2) 
		AS TotalSaleAmountExcludingDiscount,
	ROUND(SUM((1-OD.Discount)*(OD.UnitPrice*OD.Quantity)),2) 
		AS TotalSaleAmountIncludingDiscount,
	ROUND(SUM(OD.Discount*OD.UnitPrice*OD.Quantity),2) 
		AS TotalDiscountAmount,
	COUNT(DISTINCT OD.OrderID) 
		AS TotalOrder,
	COUNT(*) 
		AS TotalEntries
FROM	
	Employees E
INNER JOIN
	Orders O ON O.EmployeeID = E.EmployeeID
INNER JOIN 
	[Order Details] OD ON OD.OrderID = O.OrderID
GROUP BY
	CONCAT(E.FirstName,' ', E.LastName),
	E.Title
)
SELECT
	* ,
	ROUND(SUM(TotalSaleAmountExcludingDiscount/TotalOrder),2) 
		AS AverageAmountPerOrder,
	ROUND(SUM(TotalSaleAmountExcludingDiscount/TotalEntries),2) 
		AS AverageAmountPerEntry,
	ROUND(SUM((TotalDiscountAmount*100)/TotalSaleAmountExcludingDiscount),2) 
		AS TotalDiscountPercentage
FROM 
	KPI
GROUP BY
	EmployeeName,
	Title,
	TotalSaleAmountExcludingDiscount,
	TotalSaleAmountIncludingDiscount,
	TotalDiscountAmount,
	TotalOrder,
	TotalEntries
ORDER BY
	TotalSaleAmountIncludingDiscount DESC
