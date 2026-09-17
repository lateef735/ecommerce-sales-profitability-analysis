
--code for the whole view

select 
o.OrderID,
c.CustomerID,
p.ProductID,
pay.PaymentID
OrderDate,
Quantity,
round(Discount, 2) as discount,
PaymentMethod,
PaymentStatus,
age,
case
	when age < 20 then 'under 20'
	when age between 21 and 30 then '21 - 30'
	when age between 31 and 40 then '31 - 40'
	when age between 41 and 50 then '41 - 50'
	else 'above 50'
end GroupedAge,
DATEDIFF(MONTH, SignupDate, GETDATE()) as lifespan,
CustomerSegment,
PaymentStatus,
ProductName,
Category, 
UnitPrice,
ROUND(p.UnitPrice * o.Quantity * (1 - o.Discount), 2) AS NetRevenue

from dbo.orders as o 

inner join dbo.customers as c on o.CustomerID = c.CustomerID
inner join dbo.products as p on o.ProductID = p.ProductID
left join dbo.payments as pay on o.OrderID = pay.OrderID

where age is not null