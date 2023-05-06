CREATE DATABASE STG;

USE STG;

CREATE TABLE [InvoiceSTG] (
	InvoiceKey INT IDENTITY(1,1) PRIMARY KEY,
	ChannelID INT NOT NULL,
	CustomerID INT NOT NULL,
	PaymentMethod VARCHAR(250),
	InvoiceTotalAmount DECIMAL(10,2)
);

CREATE TABLE [SalesChannelSTG] (
	ChannelKey INT IDENTITY(1,1) PRIMARY KEY,
	ChannelID INT,
	ChannelName VARCHAR(250),
	Country VARCHAR(250),
	City VARCHAR(250)
);

CREATE TABLE [ProductSTG] (
	ProductKey INT IDENTITY(1,1) PRIMARY KEY,
	StockCode INT,
	[Description] VARCHAR(250),
	Category VARCHAR(250),
	QuantitySold INT NOT NULL,
	UnitPrice DECIMAL(10,2)
);

CREATE TABLE [CustomerSTG] (
	CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
	CustomerID INT,
	FullName VARCHAR(250),
	Country VARCHAR(250),
	City VARCHAR(250),
	Age INT,
	IsMale TINYINT
);

CREATE TABLE [GeographySTG] (
	LocationKey INT IDENTITY(1,1) PRIMARY KEY,
	Country VARCHAR(250),
	City VARCHAR(250)
);
