-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
select CategoryId, Category.CategoryName, Product.ProductName from [Category]
join [Product]
where CategoryId = Category.Id
order by Category.Id;


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
select [Order].Id, [Shipper].CompanyName from [Order]
join [Shipper]
where [Order].ShipVia = [Shipper].Id
and [Order].OrderDate < "2012-08-09";


-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
select [OrderDetail].OrderId, [Product].ProductName, [OrderDetail].Quantity from [OrderDetail]
join [Product]
where [OrderDetail].ProductId = [Product].Id
and [OrderDetail].OrderId = "10251"
order by [Product].ProductName;


-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
select distinct od.OrderId, c.CompanyName, e.LastName from [Order] o
join [OrderDetail] od, [Customer] c, [Employee] e
where o.Id = od.OrderId
and o.CustomerId = c.Id
and o.EmployeeId = e.Id;

or

select [OrderDetail].OrderId, [Customer].CompanyName, [Employee].LastName from [Order]
join [OrderDetail], [Customer], [Employee]
where [Order].Id = [OrderDetail].OrderId
and [Order].CustomerId = [Customer].Id
and [Order].EmployeeId = [Employee].Id
group by [OrderDetail].OrderId;
