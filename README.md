# Northwind Company Analysis

The Northwind database contains the sales data for a fictitious company called Northwind Traders, which imports and exports specialty foods from around the world.
> My task in this case study is to perform an analysis of the performance of this company using SQL.

## Table Of Contents
* [Dataset](#-dataset)
* [Business Questions](#️-business-questions)

 ## Dataset

> 📍 SQL script to generate the dataset is [here](https://github.com/Tek-nr/Northwind-Company-Analysis/tree/main/Dataset).
The dataset is composed of 13 tables:

<details>
<summary>
Show summary
</summary>

| Table               | Rows |
|---------------------|------|
| Categories          | 8    |
| Customers           | 91   |
| Employees           | 9    |
| EmployeeTerritories | 49   |
| Order Details       | 2155 |
| Orders              | 830  |
| Region              | 4    |
| Products            | 77   |
| Shippers            | 6    |
| Suppliers           | 29   |
| Territories         | 53   |
| Usstates            | 51   |

</details>

Here is the entity relationship diagram (ERD) for this dataset
<p align="center">
  <img width=60% height=60%" src="/img/ERD.png">

## Business Questions
### ⭐️ **Question 1**

For their annual review of the company pricing strategy, the Product Team wants to look at the products that are currently being offered for a specific price range ($20 to $50). In order to help them they asked you to provide them with a list of products with the following information:

1. their name
2. their unit price

Filtered on the following conditions:

1. their unit price is between 20 and 50
2. they are not discontinued

Finally order the results by unit price in a descending order (highest first).


<summary>
Output example
</summary>

![Q1_output](/img/Q1.png)



### ⭐️ **Question 2**

The Logistics Team wants to do a retrospection of their performances for the year 1998, in order to identify for which countries they didn’t perform well. They asked you to provide them a list of countries with the following information:

1. their average days between the order date and the shipping date (formatted to have only 2 decimals)
2. their total number of orders (based on the order date) 
Filtered on the following conditions:

1. the year of order date is 1998
2. their average days between the order date and the shipping date is greater or equal 5 days
3. their total number of orders is greater than 10 orders

Finally order the results by country name in an ascending order (lowest first).


<summary>
Output example
</summary>

![Q2_output](/img/Q2.png)



### ⭐️ **Question 3**
The HR Team wants to know for each employee what was their age on the date they joined the company and who they currently report to. Provide them with a list of every employees with the following information:

1. their full name (first name and last name combined in a single field)
2. their job title
3. their age at the time they were hired
4. their manager full name (first name and last name combined in a single field)
5. their manager job title

Finally order the results by employee age and employee full name in an ascending order (lowest first).


<summary>
Output example
</summary>

![Q3_output](/img/Q3.png)



### ⭐️ **Question 4**
The Logistics Team wants to do a retrospection of their global performances over 1997-1998, in order to identify for which month they perform well. They asked you to provide them a list with:

1. their year/month as single field in a date format (e.g. “1996-01-01” January 1996)
2. their total number of orders
3. their total freight (formatted to have no decimals)

Filtered on the following conditions:

1. the order date is between 1997 and 1998
2. their total number of orders is greater than 35 orders

Finally order the results by total freight (descending order).


<summary>
Output example
</summary>

![Q4_output](/img/Q4.png)




### ⭐️ **Question 5**
The Pricing Team wants to know which products had an unit price increase and the percentage increase was not between 20% and 30%. In order to help them they asked you to provide them a list of products with:

1. their product name
2. their current unit price (formatted to have only 2 decimals)
3. their previous unit price (formatted to have only 2 decimals)
4. their percentage increase as: 

*(New Number -  Original Number) ÷ Original Number × 100* (with the result formatted to an integer, e.g 50 for 50%)

Filtered on the following conditions:

1. their percentage increase is not between 20% and 30%
2. their total number of orders is greater than 10 orders

Finally order the results by percentage increase (ascending order).


<summary>
Output example
</summary>

![Q5_output](/img/Q5.png)




### ⭐️ **Question 6**
The Pricing Team wants to know how each category performs according to their price range. In order to help them they asked you to provide them a list of categories with:

1. their category name
2. their price range as: 

    * “1.Below $20”

    *  “2. $20 - $50”

    * “3. Over $50”

3. their total amount (formatted to be integer)
4. their number of orders

Finally order the results by category name then price range (both ascending order).


<summary>
Output example
</summary>

![Q6_output](/img/Q6.png)


### ⭐️ **Question 7**
The Logistics Team wants to know what is the current state of our regional suppliers' stocks for each category of product. In order to help them they asked you to provide them a list of categories with:

1. their supplier region” as: 
   * “America”
   * “Europe”
   * “Asia-Pacific”
2. their category name
3. their total units in stock
4. their total units on order
5. heir total reorder level

Finally order the results by supplier region then category name then price range (each in ascending order).


<summary>
Output example
</summary>

![Q7_output](/img/Q7.png)



### ⭐️ **Question 8**
The Pricing Team wants to know for each currently offered product how their unit price compares against their categories average and median unit price. In order to help them they asked you to provide them a list of products with:

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

Finally order the results by category name then product name (both ascending).


<summary>
Output example
</summary>

![Q8_output](/img/Q8.png)



### ⭐️ **Question 9**

The Sales Team wants to build a list of KPIs to measure employees' performances. In order to help them they asked you to provide them a list of employees with:

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


<summary>
Output example
</summary>

![Q9_output](/img/Q9.png)



### ⭐️ **Question 10**
The Sales Team wants to build another list of KPIs to measure employees' performances across each category. In order to help them they asked you to provide them a list of categories and employees with:

1. their categories name
2. their full name (first name and last name combined in a 3. single field)
3. their total sales amount including discount (formatted to have only 2 decimals)
4. their percentage of total sales amount against the total sales amount across all employees (formatted to have only 2 decimals)
5. their percentage of total sales amount against the total sales amount for each employees (formatted to have only 2 decimals)

Finally order the results by category name (ascending) then total sales amount (descending).


<summary>
Output example
</summary>

![Q10_output](/img/Q10.png)
