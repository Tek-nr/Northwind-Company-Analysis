/********************************
-- Question 3
The HR Team wants to know for each employee what was their age on the date
they joined the company and who they currently report to. Provide them with 
a list of every employees with the following information:

1. their full name (first name and last name combined in a single field)
2. their job title
3. their age at the time they were hired
4. their manager full name (first name and last name combined in a single field)
5. their manager job title

Finally order the results by employee age and employee full name in an ascending order (lowest first).
***********************************/

SELECT 
	CONCAT(E.FirstName,' ',E.LastName) AS Full_Name, 
	E.Title AS Employee_Title, 
	DATEDIFF(YEAR, E.HireDate, GETDATE()) AS Employee_Age,  
	CONCAT(M.FirstName,' ', M.LastName) AS Manager_Name,
	M.Title AS Manager_Title
FROM EMPLOYEES AS E
JOIN Employees M 
	ON M.EmployeeID = E.ReportsTo
ORDER BY 
	Employee_Age, Full_Name

