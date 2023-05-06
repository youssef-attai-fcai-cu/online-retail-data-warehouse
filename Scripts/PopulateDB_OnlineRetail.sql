USE OnlineRetail;

TRUNCATE TABLE Country;

INSERT INTO [dbo].[Country]
	(Country) VALUES 
	('Egypt');

SELECT * FROM Country;

TRUNCATE TABLE City;

INSERT INTO [dbo].[City]
	(CountryID, City) VALUES 
	(1, 'Cairo'),
	(1, 'Giza'),
	(1, 'Alexandria');

SELECT * FROM City;

TRUNCATE TABLE Customer;

INSERT INTO [dbo].[Customer]
	(FullName, CityID, Age, Gender) VALUES 
	('Ashraf Ashraf', 1, 3, 'F'),
	('Abdelfattah El Sisi', 1, 60, 'M'),
	('Romelo Lukaka', 2, 30, 'F');

SELECT * FROM Customer;

TRUNCATE TABLE SalesChannel;

INSERT INTO [dbo].[SalesChannel]
	(ChannelName, CityID, ContactDetails) VALUES 
	('DummySales', 1, '01552452691'),
	('AboAshraf Sales', 2, 'ashraf@gmail.com');

SELECT * FROM SalesChannel;

TRUNCATE TABLE [Order];

INSERT INTO [dbo].[Order]
	(CustomerID, ChannelID, InvoiceDatetime, PaymentMethod) VALUES 
	(3, 1, '20220618 10:34:09 AM', 'Cash'),
	(1, 2, '20230717 12:32:01 PM', 'Credit Card');

SELECT * FROM [Order];

TRUNCATE TABLE Product;

INSERT INTO [dbo].[Product]
	([Description], Category, UnitPrice) VALUES 
	('Infant Baby', 'Food', 12.99),
	('Blender', 'Electronics', 3.25);

SELECT * FROM Product;

TRUNCATE TABLE [OrderItem];

INSERT INTO [dbo].[OrderItem]
	(InvoiceNo, ProductStockCode, Quantity) VALUES 
	(1, 1, 1),
	(1, 2, 2),
	(2, 1, 3),
	(2, 2, 4);

SELECT * FROM [OrderItem];