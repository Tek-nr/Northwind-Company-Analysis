/********************************
-- Question 10
The Sales Team wants to build another list of KPIs to measure employees' performances across each category. 
In order to help them they asked you to provide them a list of categories and employees with:
1. their categories name
2. their full name (first name and last name combined in a 3. single field)
3. their total sales amount including discount (formatted to have only 2 decimals)
4. their percentage of total sales amount against the total sales amount across all employees (formatted to have only 2 decimals)
5. their percentage of total sales amount against the total sales amount for each employees (formatted to have only 2 decimals)

Finally order the results by category name (ascending) then total sales amount (descending).
***********************************/

WITH KPI AS (
SELECT 
	C.CategoryName,
	CONCAT(E.FirstName, ' ', E.LastName) 
		AS EmployeeName,
	ROUND(SUM((OD.UnitPrice*OD.Quantity)*(1-OD.Discount)),2) 
		AS TotalSaleIncludingDiscount
FROM 
	Categories C
INNER JOIN 
	Products P ON P.CategoryID = C.CategoryID
INNER JOIN 
	[Order Details] OD ON OD.ProductID = P.ProductID
INNER JOIN 
	Orders O ON O.OrderID = OD.OrderID
INNER JOIN 
	Employees E ON E.EmployeeID = O.EmployeeID
GROUP BY
	CategoryName,
	CONCAT(E.FirstName, ' ', E.LastName)
)

SELECT 
	*,
	ROUND(
		SUM(TotalSaleIncludingDiscount) / 
		SUM(SUM(TotalSaleIncludingDiscount))
		OVER (PARTITION BY EmployeeName) * 100, 2) 
		AS PercentageOfEmployeeSales,
	ROUND(
		SUM(TotalSaleIncludingDiscount) /
		SUM(SUM(TotalSaleIncludingDiscount)) 
		OVER (PARTITION BY CategoryName)*100, 2)
		AS PercentageOfCategorySales
FROM 
	KPI
GROUP BY
	CategoryName,
	EmployeeName,
	TotalSaleIncludingDiscount
ORDER BY 
	CategoryName,
	TotalSaleIncludingDiscount DESC

