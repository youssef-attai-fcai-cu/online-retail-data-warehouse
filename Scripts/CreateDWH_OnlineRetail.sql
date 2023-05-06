CREATE DATABASE DWH;

USE DWH;

Create TABLE dbo.Dim_Date (
   [DateKey] INT NOT NULL PRIMARY KEY,
   [Date] DATE NOT NULL,
   [Day] TINYINT NOT NULL,
   [DaySuffix] CHAR(2) NOT NULL,
   [Weekday] TINYINT NOT NULL,
   [WeekDayName] VARCHAR(10) NOT NULL,
   [WeekDayName_Short] CHAR(3) NOT NULL,
   [WeekDayName_FirstLetter] CHAR(1) NOT NULL,
   [DOWInMonth] TINYINT NOT NULL,
   [DayOfYear] SMALLINT NOT NULL,
   [WeekOfMonth] TINYINT NOT NULL,
   [WeekOfYear] TINYINT NOT NULL,
   [Month] TINYINT NOT NULL,
   [MonthName] VARCHAR(10) NOT NULL,
   [MonthName_Short] CHAR(3) NOT NULL,
   [MonthName_FirstLetter] CHAR(1) NOT NULL,
   [Quarter] TINYINT NOT NULL,
   [QuarterName] VARCHAR(6) NOT NULL,
   [Year] INT NOT NULL,
   [MMYYYY] CHAR(6) NOT NULL,
   [MonthYear] CHAR(7) NOT NULL,
   [IsWeekend] BIT NOT NULL,
   [IsHoliday] BIT NOT NULL
);

CREATE TABLE [InvoiceDimension] (
	InvoiceKey INT IDENTITY(1,1) PRIMARY KEY,
	ChannelID INT NOT NULL,
	CustomerID INT NOT NULL,
	PaymentMethod VARCHAR(250) NOT NULL,
	InvoiceTotalAmount DECIMAL(10,2) NOT NULL
);

CREATE TABLE [SalesChannelDimension] (
	ChannelKey INT IDENTITY(1,1) PRIMARY KEY,
	ChannelID INT NOT NULL,
	ChannelName VARCHAR(250) NOT NULL,
	Country VARCHAR(250) NOT NULL,
	City VARCHAR(250) NOT NULL
);

CREATE TABLE [ProductDimension] (
	ProductKey INT IDENTITY(1,1) PRIMARY KEY,
	StockCode INT NOT NULL,
	[Description] VARCHAR(250) NOT NULL,
	Category VARCHAR(250) NOT NULL,
	QuantitySold INT NOT NULL,
	UnitPrice DECIMAL(10,2) NOT NULL,
	StartDate DATETIME NOT NULL DEFAULT GETDATE(),
	EndDate DATETIME,
	ActiveFlag TINYINT NOT NULL
);

CREATE TABLE [CustomerDimension] (
	CustomerKey INT IDENTITY(1,1) PRIMARY KEY,
	CustomerID INT NOT NULL,
	FullName VARCHAR(250) NOT NULL,
	Country VARCHAR(250) NOT NULL,
	City VARCHAR(250) NOT NULL,
	Age INT NOT NULL,
	IsMale TINYINT NOT NULL,
	StartDate DATETIME NOT NULL DEFAULT GETDATE(),
	EndDate DATETIME,
	ActiveFlag TINYINT NOT NULL
);

CREATE TABLE [GeographyDimension] (
	LocationKey INT IDENTITY(1,1) PRIMARY KEY,
	Country VARCHAR(250) NOT NULL,
	City VARCHAR(250) NOT NULL,
);

CREATE TABLE [SalesChannelFactTable] (
	DateKey INT REFERENCES [dbo].Dim_Date(DateKey),
	ChannelKey INT REFERENCES [dbo].[SalesChannelDimension](ChannelKey),
	TotalRevenueGained  DECIMAL(10,2) NOT NULL,
	PRIMARY KEY(DateKey, ChannelKey)
);

CREATE TABLE [ProductFactTable] (
	ProductKey INT REFERENCES [dbo].[ProductDimension](ProductKey),
	DateKey INT REFERENCES [dbo].Dim_Date(DateKey),
	StockCode INT NOT NULL,
	TotalQuantitySold INT NOT NULL,
	TotalRevenueGained DECIMAL(10,2) NOT NULL,
	PRIMARY KEY(ProductKey, DateKey)
);

CREATE TABLE [CustomerFactTable] (
	DateKey INT REFERENCES [dbo].Dim_Date(DateKey),
	CustomerKey INT REFERENCES [dbo].[CustomerDimension](CustomerKey),
	TotalSpent DECIMAL(10,2) NOT NULL,
	TotalNoOfOrders INT NOT NULL,
	PRIMARY KEY(CustomerKey, DateKey)
);
