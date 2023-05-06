USE STG;
SELECT * FROM InvoiceSTG;

USE DWH;
SELECT * FROM InvoiceDimension;

USE STG;
SELECT * FROM CustomerSTG;

USE DWH;
SELECT * FROM CustomerDimension;

USE STG;
SELECT * FROM SalesChannelSTG;

USE DWH;
SELECT * FROM SalesChannelDimension;

USE STG;
SELECT * FROM ProductSTG;

USE DWH;
SELECT * FROM ProductDimension;

USE STG;
SELECT * FROM GeographySTG;

USE DWH;
SELECT * FROM GeographyDimension;

USE DWH;
SELECT * FROM SalesChannelFactTable;

USE DWH;
SELECT * FROM CustomerFactTable;

USE DWH;
SELECT * FROM ProductFactTable;

USE DWH;
SELECT * FROM OrderFactTable;

USE DWH;
SELECT * FROM Dim_Date;

USE OnlineRetail;
UPDATE Customer SET FullName='Ashraf Ashraf' WHERE CustomerID=1;