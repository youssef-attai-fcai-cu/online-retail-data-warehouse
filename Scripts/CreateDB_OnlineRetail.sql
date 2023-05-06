CREATE DATABASE [OnlineRetail];

USE [OnlineRetail];

CREATE TABLE [Country] (
	CountryID INT IDENTITY(1,1) PRIMARY KEY,
	Country VARCHAR(250) NOT NULL
);

CREATE TABLE [City] (
	CityID INT IDENTITY(1,1) PRIMARY KEY,
	CountryID INT REFERENCES [dbo].[Country](CountryID),
	City VARCHAR(250) NOT NULL
);

CREATE TABLE [Customer] (
	CustomerID INT IDENTITY(1,1) PRIMARY KEY,
	FullName VARCHAR(250) NOT NULL,
	CityID INT REFERENCES [dbo].[City](CityID),
	Age INT NOT NULL,
	Gender VARCHAR(1) NOT NULL
);

CREATE TABLE [SalesChannel] (
	ChannelID INT IDENTITY(1,1) PRIMARY KEY,
	ChannelName VARCHAR(250) NOT NULL,
	CityID INT REFERENCES [dbo].[City](CityID),
	ContactDetails VARCHAR(250) NOT NULL
);

CREATE TABLE [Order] (
	InvoiceNo INT IDENTITY(1,1) PRIMARY KEY,
	CustomerID INT REFERENCES [dbo].[Customer](CustomerID),
	ChannelID INT REFERENCES [dbo].[SalesChannel](ChannelID),
	InvoiceDatetime DATETIME NOT NULL,
	PaymentMethod VARCHAR(250) NOT NULL
);

CREATE TABLE [Product] (
	StockCode INT IDENTITY(1,1) PRIMARY KEY,
	[Description] VARCHAR(250) NOT NULL,
	Category VARCHAR(250) NOT NULL,
	UnitPrice DECIMAL(10,2) NOT NULL CHECK(UnitPrice > 0)
);

CREATE TABLE [OrderItem] (
	ItemID INT IDENTITY(1,1) PRIMARY KEY,
	InvoiceNo INT REFERENCES [dbo].[Order](InvoiceNo),
	ProductStockCode INT REFERENCES [dbo].[Product](StockCode),
	Quantity INT NOT NULL CHECK(Quantity > 0)
);



drop table  City;
drop table Country;
drop table Customer;
drop table [Order];
drop table OrderItem;
drop table Product;
drop table SalesChannel;