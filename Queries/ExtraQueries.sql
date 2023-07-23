select 
	ProductID, 
	CategoryName, 
	ProductName, 
	UnitPrice, 
	UnitsInStock, 
	UnitsOnOrder
from Products p inner join Categories c
	on p.CategoryID = c.CategoryID
where 
	p.UnitPrice between 20 and 100
order by 
	p.UnitPrice
-- Gets only matching results (intersection set)

-- How many orders have we received so far?
-- name -> products, date -> orders, total cost -> Order Details
select  
	p.ProductName, 
	od.OrderID, 
	o.OrderDate, 
	(od.UnitPrice-od.Discount) * od.Quantity 
	as [Total] 
from products p 
	inner join [Order Details] od 
	on p.ProductID = od.ProductID inner join Orders o on o.OrderID= od.OrderID

-- How many products were ordered and what is the total amount of each order?
select 
	o.OrderDate, od.OrderID, 
	count(od.OrderID) as [Number Of Ordered Items],
	sum((od.UnitPrice-od.Discount) * od.Quantity) as [Total] 
from Orders o 
inner join [Order Details] od on o.OrderID= od.OrderID
group by 
	od.OrderID, 
	o.OrderDate
-- if sum function does not exist, the query does not work


select 
	o.OrderDate, 
	od.OrderID, 
	count(od.OrderID) as [Number Of Ordered Items],
	sum((od.UnitPrice-od.Discount) * od.Quantity) as [Total] 
from Orders o 
inner join [Order Details] od on o.OrderID= od.OrderID
where 
	o.OrderDate between '1996-10-01' and '1997-10-01'
group by 
	od.OrderID, 
	o.OrderDate

--
select 
	o.OrderDate, 
	od.OrderID, 
	count(od.OrderID) as [Number Of Ordered Items],
	sum((od.UnitPrice-od.Discount) * od.Quantity) as [Total] 
from 
	Orders o 
inner join [Order Details] od on o.OrderID = od.OrderID
group by 
	od.OrderID, 
	o.OrderDate 
having 
	count(od.OrderID)>=3
order by 
	count(od.OrderID)

--
select * 
from 
	Products p 
left join [Order Details] od 
	on p.ProductID = od.ProductID 
where 
	od.ProductID is null -- we sold all products

-- we want to see customers we have never sold products to before
select * 
from 
	Customers c 
left join Orders o 
	on c.CustomerID = o.CustomerID
where 
	o.CustomerID is null

--Reach customers who have placed an order at least once
select * 
from 
	Customers c 
inner join Orders o
	on c.CustomerID=o.CustomerID


--
select 
	c.CustomerID, 
	c.ContactName 
from 
	Orders o 
right join Customers c 
	on o.CustomerID=c.CustomerID
where 
	o.CustomerID is null

-- How many products did each employee sell?
select 
	e.EmployeeID, 
	count(e.EmployeeID) as [Amount of Sold Products] 
from 
	Employees e 
left join Orders o 
	on e.EmployeeID=o.EmployeeID
group by 
	e.EmployeeID
order by 
	count(e.EmployeeID) desc

-- How many employees do we have who cannot sell any product?
select * 
from 
	Employees e 
left join Orders o
	on e.EmployeeID=o.EmployeeID
where 
	o.EmployeeID is null

-- How many sales did we make for each product?
select 
	p.ProductName, 
	count(p.ProductID) as [Number of Sales] 
from 
	Products p 
inner join [Order Details] od 
	on p.ProductID=od.ProductID
group by 
	p.ProductName

-- How many sales did we make for each category?
select 
	c.CategoryName, 
	count(c.CategoryName) as [Number of Sales] 
from 
	Products p 
inner join [Order Details] od
	on p.ProductID = od.ProductID
inner join Categories c
	on c.CategoryID=p.CategoryID
group by 
	c.CategoryName

