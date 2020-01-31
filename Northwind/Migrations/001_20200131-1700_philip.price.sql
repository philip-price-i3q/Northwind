-- <Migration ID="7d3a1410-322d-4e7a-9b7a-afdfe99e461b" />
GO

PRINT N'Creating [dbo].[CustomerDemographics]'
GO
CREATE TABLE [dbo].[CustomerDemographics]
(
[CustomerTypeID] [nchar] (10) NOT NULL,
[CustomerDesc] [ntext] NULL
)
GO
PRINT N'Creating primary key [PK_CustomerDemographics] on [dbo].[CustomerDemographics]'
GO
ALTER TABLE [dbo].[CustomerDemographics] ADD CONSTRAINT [PK_CustomerDemographics] PRIMARY KEY NONCLUSTERED  ([CustomerTypeID])
GO
PRINT N'Creating [dbo].[CustomerCustomerDemo]'
GO
CREATE TABLE [dbo].[CustomerCustomerDemo]
(
[CustomerID] [nchar] (5) NOT NULL,
[CustomerTypeID] [nchar] (10) NOT NULL
)
GO
PRINT N'Creating primary key [PK_CustomerCustomerDemo] on [dbo].[CustomerCustomerDemo]'
GO
ALTER TABLE [dbo].[CustomerCustomerDemo] ADD CONSTRAINT [PK_CustomerCustomerDemo] PRIMARY KEY NONCLUSTERED  ([CustomerID], [CustomerTypeID])
GO
PRINT N'Creating [dbo].[Customers]'
GO
CREATE TABLE [dbo].[Customers]
(
[CustomerID] [nchar] (5) NOT NULL,
[CompanyName] [nvarchar] (40) NOT NULL,
[ContactName] [nvarchar] (30) NULL,
[ContactTitle] [nvarchar] (30) NULL,
[Address] [nvarchar] (60) NULL,
[City] [nvarchar] (15) NULL,
[Region] [nvarchar] (15) NULL,
[PostalCode] [nvarchar] (10) NULL,
[Country] [nvarchar] (15) NULL,
[Phone] [nvarchar] (24) NULL,
[Fax] [nvarchar] (24) NULL
)
GO
PRINT N'Creating primary key [PK_Customers] on [dbo].[Customers]'
GO
ALTER TABLE [dbo].[Customers] ADD CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED  ([CustomerID])
GO
PRINT N'Creating index [City] on [dbo].[Customers]'
GO
CREATE NONCLUSTERED INDEX [City] ON [dbo].[Customers] ([City])
GO
PRINT N'Creating index [CompanyName] on [dbo].[Customers]'
GO
CREATE NONCLUSTERED INDEX [CompanyName] ON [dbo].[Customers] ([CompanyName])
GO
PRINT N'Creating index [PostalCode] on [dbo].[Customers]'
GO
CREATE NONCLUSTERED INDEX [PostalCode] ON [dbo].[Customers] ([PostalCode])
GO
PRINT N'Creating index [Region] on [dbo].[Customers]'
GO
CREATE NONCLUSTERED INDEX [Region] ON [dbo].[Customers] ([Region])
GO
PRINT N'Creating [dbo].[Employees]'
GO
CREATE TABLE [dbo].[Employees]
(
[EmployeeID] [int] NOT NULL IDENTITY(1, 1),
[LastName] [nvarchar] (20) NOT NULL,
[FirstName] [nvarchar] (10) NOT NULL,
[Title] [nvarchar] (30) NULL,
[TitleOfCourtesy] [nvarchar] (25) NULL,
[BirthDate] [datetime] NULL,
[HireDate] [datetime] NULL,
[Address] [nvarchar] (60) NULL,
[City] [nvarchar] (15) NULL,
[Region] [nvarchar] (15) NULL,
[PostalCode] [nvarchar] (10) NULL,
[Country] [nvarchar] (15) NULL,
[HomePhone] [nvarchar] (24) NULL,
[Extension] [nvarchar] (4) NULL,
[Photo] [image] NULL,
[Notes] [ntext] NULL,
[ReportsTo] [int] NULL,
[PhotoPath] [nvarchar] (255) NULL
)
GO
PRINT N'Creating primary key [PK_Employees] on [dbo].[Employees]'
GO
ALTER TABLE [dbo].[Employees] ADD CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED  ([EmployeeID])
GO
PRINT N'Creating index [LastName] on [dbo].[Employees]'
GO
CREATE NONCLUSTERED INDEX [LastName] ON [dbo].[Employees] ([LastName])
GO
PRINT N'Creating index [PostalCode] on [dbo].[Employees]'
GO
CREATE NONCLUSTERED INDEX [PostalCode] ON [dbo].[Employees] ([PostalCode])
GO
PRINT N'Creating [dbo].[EmployeeTerritories]'
GO
CREATE TABLE [dbo].[EmployeeTerritories]
(
[EmployeeID] [int] NOT NULL,
[TerritoryID] [nvarchar] (20) NOT NULL
)
GO
PRINT N'Creating primary key [PK_EmployeeTerritories] on [dbo].[EmployeeTerritories]'
GO
ALTER TABLE [dbo].[EmployeeTerritories] ADD CONSTRAINT [PK_EmployeeTerritories] PRIMARY KEY NONCLUSTERED  ([EmployeeID], [TerritoryID])
GO
PRINT N'Creating [dbo].[Territories]'
GO
CREATE TABLE [dbo].[Territories]
(
[TerritoryID] [nvarchar] (20) NOT NULL,
[TerritoryDescription] [nchar] (50) NOT NULL,
[RegionID] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Territories] on [dbo].[Territories]'
GO
ALTER TABLE [dbo].[Territories] ADD CONSTRAINT [PK_Territories] PRIMARY KEY NONCLUSTERED  ([TerritoryID])
GO
PRINT N'Creating [dbo].[Orders]'
GO
CREATE TABLE [dbo].[Orders]
(
[OrderID] [int] NOT NULL IDENTITY(1, 1),
[CustomerID] [nchar] (5) NULL,
[EmployeeID] [int] NULL,
[OrderDate] [datetime] NULL,
[RequiredDate] [datetime] NULL,
[ShippedDate] [datetime] NULL,
[ShipVia] [int] NULL,
[Freight] [money] NULL CONSTRAINT [DF_Orders_Freight] DEFAULT ((0)),
[ShipName] [nvarchar] (40) NULL,
[ShipAddress] [nvarchar] (60) NULL,
[ShipCity] [nvarchar] (15) NULL,
[ShipRegion] [nvarchar] (15) NULL,
[ShipPostalCode] [nvarchar] (10) NULL,
[ShipCountry] [nvarchar] (15) NULL
)
GO
PRINT N'Creating primary key [PK_Orders] on [dbo].[Orders]'
GO
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED  ([OrderID])
GO
PRINT N'Creating index [CustomerID] on [dbo].[Orders]'
GO
CREATE NONCLUSTERED INDEX [CustomerID] ON [dbo].[Orders] ([CustomerID])
GO
PRINT N'Creating index [CustomersOrders] on [dbo].[Orders]'
GO
CREATE NONCLUSTERED INDEX [CustomersOrders] ON [dbo].[Orders] ([CustomerID])
GO
PRINT N'Creating index [EmployeeID] on [dbo].[Orders]'
GO
CREATE NONCLUSTERED INDEX [EmployeeID] ON [dbo].[Orders] ([EmployeeID])
GO
PRINT N'Creating index [EmployeesOrders] on [dbo].[Orders]'
GO
CREATE NONCLUSTERED INDEX [EmployeesOrders] ON [dbo].[Orders] ([EmployeeID])
GO
PRINT N'Creating index [OrderDate] on [dbo].[Orders]'
GO
CREATE NONCLUSTERED INDEX [OrderDate] ON [dbo].[Orders] ([OrderDate])
GO
PRINT N'Creating index [ShippedDate] on [dbo].[Orders]'
GO
CREATE NONCLUSTERED INDEX [ShippedDate] ON [dbo].[Orders] ([ShippedDate])
GO
PRINT N'Creating index [ShipPostalCode] on [dbo].[Orders]'
GO
CREATE NONCLUSTERED INDEX [ShipPostalCode] ON [dbo].[Orders] ([ShipPostalCode])
GO
PRINT N'Creating index [ShippersOrders] on [dbo].[Orders]'
GO
CREATE NONCLUSTERED INDEX [ShippersOrders] ON [dbo].[Orders] ([ShipVia])
GO
PRINT N'Creating [dbo].[Order Details]'
GO
CREATE TABLE [dbo].[Order Details]
(
[OrderID] [int] NOT NULL,
[ProductID] [int] NOT NULL,
[UnitPrice] [money] NOT NULL CONSTRAINT [DF_Order_Details_UnitPrice] DEFAULT ((0)),
[Quantity] [smallint] NOT NULL CONSTRAINT [DF_Order_Details_Quantity] DEFAULT ((1)),
[Discount] [real] NOT NULL CONSTRAINT [DF_Order_Details_Discount] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_Order_Details] on [dbo].[Order Details]'
GO
ALTER TABLE [dbo].[Order Details] ADD CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED  ([OrderID], [ProductID])
GO
PRINT N'Creating index [OrderID] on [dbo].[Order Details]'
GO
CREATE NONCLUSTERED INDEX [OrderID] ON [dbo].[Order Details] ([OrderID])
GO
PRINT N'Creating index [OrdersOrder_Details] on [dbo].[Order Details]'
GO
CREATE NONCLUSTERED INDEX [OrdersOrder_Details] ON [dbo].[Order Details] ([OrderID])
GO
PRINT N'Creating index [ProductID] on [dbo].[Order Details]'
GO
CREATE NONCLUSTERED INDEX [ProductID] ON [dbo].[Order Details] ([ProductID])
GO
PRINT N'Creating index [ProductsOrder_Details] on [dbo].[Order Details]'
GO
CREATE NONCLUSTERED INDEX [ProductsOrder_Details] ON [dbo].[Order Details] ([ProductID])
GO
PRINT N'Creating [dbo].[Products]'
GO
CREATE TABLE [dbo].[Products]
(
[ProductID] [int] NOT NULL IDENTITY(1, 1),
[ProductName] [nvarchar] (40) NOT NULL,
[SupplierID] [int] NULL,
[CategoryID] [int] NULL,
[QuantityPerUnit] [nvarchar] (20) NULL,
[UnitPrice] [money] NULL CONSTRAINT [DF_Products_UnitPrice] DEFAULT ((0)),
[UnitsInStock] [smallint] NULL CONSTRAINT [DF_Products_UnitsInStock] DEFAULT ((0)),
[UnitsOnOrder] [smallint] NULL CONSTRAINT [DF_Products_UnitsOnOrder] DEFAULT ((0)),
[ReorderLevel] [smallint] NULL CONSTRAINT [DF_Products_ReorderLevel] DEFAULT ((0)),
[Discontinued] [bit] NOT NULL CONSTRAINT [DF_Products_Discontinued] DEFAULT ((0))
)
GO
PRINT N'Creating primary key [PK_Products] on [dbo].[Products]'
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED  ([ProductID])
GO
PRINT N'Creating index [CategoriesProducts] on [dbo].[Products]'
GO
CREATE NONCLUSTERED INDEX [CategoriesProducts] ON [dbo].[Products] ([CategoryID])
GO
PRINT N'Creating index [CategoryID] on [dbo].[Products]'
GO
CREATE NONCLUSTERED INDEX [CategoryID] ON [dbo].[Products] ([CategoryID])
GO
PRINT N'Creating index [ProductName] on [dbo].[Products]'
GO
CREATE NONCLUSTERED INDEX [ProductName] ON [dbo].[Products] ([ProductName])
GO
PRINT N'Creating index [SupplierID] on [dbo].[Products]'
GO
CREATE NONCLUSTERED INDEX [SupplierID] ON [dbo].[Products] ([SupplierID])
GO
PRINT N'Creating index [SuppliersProducts] on [dbo].[Products]'
GO
CREATE NONCLUSTERED INDEX [SuppliersProducts] ON [dbo].[Products] ([SupplierID])
GO
PRINT N'Creating [dbo].[Shippers]'
GO
CREATE TABLE [dbo].[Shippers]
(
[ShipperID] [int] NOT NULL IDENTITY(1, 1),
[CompanyName] [nvarchar] (40) NOT NULL,
[Phone] [nvarchar] (24) NULL
)
GO
PRINT N'Creating primary key [PK_Shippers] on [dbo].[Shippers]'
GO
ALTER TABLE [dbo].[Shippers] ADD CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED  ([ShipperID])
GO
PRINT N'Creating [dbo].[Categories]'
GO
CREATE TABLE [dbo].[Categories]
(
[CategoryID] [int] NOT NULL IDENTITY(1, 1),
[CategoryName] [nvarchar] (15) NOT NULL,
[Description] [ntext] NULL,
[Picture] [image] NULL
)
GO
PRINT N'Creating primary key [PK_Categories] on [dbo].[Categories]'
GO
ALTER TABLE [dbo].[Categories] ADD CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED  ([CategoryID])
GO
PRINT N'Creating index [CategoryName] on [dbo].[Categories]'
GO
CREATE NONCLUSTERED INDEX [CategoryName] ON [dbo].[Categories] ([CategoryName])
GO
PRINT N'Creating [dbo].[Suppliers]'
GO
CREATE TABLE [dbo].[Suppliers]
(
[SupplierID] [int] NOT NULL IDENTITY(1, 1),
[CompanyName] [nvarchar] (40) NOT NULL,
[ContactName] [nvarchar] (30) NULL,
[ContactTitle] [nvarchar] (30) NULL,
[Address] [nvarchar] (60) NULL,
[City] [nvarchar] (15) NULL,
[Region] [nvarchar] (15) NULL,
[PostalCode] [nvarchar] (10) NULL,
[Country] [nvarchar] (15) NULL,
[Phone] [nvarchar] (24) NULL,
[Fax] [nvarchar] (24) NULL,
[HomePage] [ntext] NULL
)
GO
PRINT N'Creating primary key [PK_Suppliers] on [dbo].[Suppliers]'
GO
ALTER TABLE [dbo].[Suppliers] ADD CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED  ([SupplierID])
GO
PRINT N'Creating index [CompanyName] on [dbo].[Suppliers]'
GO
CREATE NONCLUSTERED INDEX [CompanyName] ON [dbo].[Suppliers] ([CompanyName])
GO
PRINT N'Creating index [PostalCode] on [dbo].[Suppliers]'
GO
CREATE NONCLUSTERED INDEX [PostalCode] ON [dbo].[Suppliers] ([PostalCode])
GO
PRINT N'Creating [dbo].[Region]'
GO
CREATE TABLE [dbo].[Region]
(
[RegionID] [int] NOT NULL,
[RegionDescription] [nchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_Region] on [dbo].[Region]'
GO
ALTER TABLE [dbo].[Region] ADD CONSTRAINT [PK_Region] PRIMARY KEY NONCLUSTERED  ([RegionID])
GO
PRINT N'Adding constraints to [dbo].[Employees]'
GO
ALTER TABLE [dbo].[Employees] ADD CONSTRAINT [CK_Birthdate] CHECK (([BirthDate]<getdate()))
GO
PRINT N'Adding constraints to [dbo].[Order Details]'
GO
ALTER TABLE [dbo].[Order Details] ADD CONSTRAINT [CK_UnitPrice] CHECK (([UnitPrice]>=(0)))
GO
ALTER TABLE [dbo].[Order Details] ADD CONSTRAINT [CK_Quantity] CHECK (([Quantity]>(0)))
GO
ALTER TABLE [dbo].[Order Details] ADD CONSTRAINT [CK_Discount] CHECK (([Discount]>=(0) AND [Discount]<=(1)))
GO
PRINT N'Adding constraints to [dbo].[Products]'
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [CK_Products_UnitPrice] CHECK (([UnitPrice]>=(0)))
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [CK_UnitsInStock] CHECK (([UnitsInStock]>=(0)))
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [CK_UnitsOnOrder] CHECK (([UnitsOnOrder]>=(0)))
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [CK_ReorderLevel] CHECK (([ReorderLevel]>=(0)))
GO
PRINT N'Adding foreign keys to [dbo].[Products]'
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [FK_Products_Categories] FOREIGN KEY ([CategoryID]) REFERENCES [dbo].[Categories] ([CategoryID])
GO
ALTER TABLE [dbo].[Products] ADD CONSTRAINT [FK_Products_Suppliers] FOREIGN KEY ([SupplierID]) REFERENCES [dbo].[Suppliers] ([SupplierID])
GO
PRINT N'Adding foreign keys to [dbo].[Orders]'
GO
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK_Orders_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK_Orders_Employees] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[Orders] ADD CONSTRAINT [FK_Orders_Shippers] FOREIGN KEY ([ShipVia]) REFERENCES [dbo].[Shippers] ([ShipperID])
GO
PRINT N'Adding foreign keys to [dbo].[Employees]'
GO
ALTER TABLE [dbo].[Employees] ADD CONSTRAINT [FK_Employees_Employees] FOREIGN KEY ([ReportsTo]) REFERENCES [dbo].[Employees] ([EmployeeID])
GO
PRINT N'Adding foreign keys to [dbo].[Order Details]'
GO
ALTER TABLE [dbo].[Order Details] ADD CONSTRAINT [FK_Order_Details_Orders] FOREIGN KEY ([OrderID]) REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[Order Details] ADD CONSTRAINT [FK_Order_Details_Products] FOREIGN KEY ([ProductID]) REFERENCES [dbo].[Products] ([ProductID])
GO
PRINT N'Adding foreign keys to [dbo].[CustomerCustomerDemo]'
GO
ALTER TABLE [dbo].[CustomerCustomerDemo] ADD CONSTRAINT [FK_CustomerCustomerDemo_Customers] FOREIGN KEY ([CustomerID]) REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[CustomerCustomerDemo] ADD CONSTRAINT [FK_CustomerCustomerDemo] FOREIGN KEY ([CustomerTypeID]) REFERENCES [dbo].[CustomerDemographics] ([CustomerTypeID])
GO
PRINT N'Adding foreign keys to [dbo].[EmployeeTerritories]'
GO
ALTER TABLE [dbo].[EmployeeTerritories] ADD CONSTRAINT [FK_EmployeeTerritories_Employees] FOREIGN KEY ([EmployeeID]) REFERENCES [dbo].[Employees] ([EmployeeID])
GO
ALTER TABLE [dbo].[EmployeeTerritories] ADD CONSTRAINT [FK_EmployeeTerritories_Territories] FOREIGN KEY ([TerritoryID]) REFERENCES [dbo].[Territories] ([TerritoryID])
GO
PRINT N'Adding foreign keys to [dbo].[Territories]'
GO
ALTER TABLE [dbo].[Territories] ADD CONSTRAINT [FK_Territories_Region] FOREIGN KEY ([RegionID]) REFERENCES [dbo].[Region] ([RegionID])
GO
