-- CREATE TABLE Categories
-- (
--     CategoryId INT IDENTITY(1,1) PRIMARY KEY,
--     Name NVARCHAR(100) NOT NULL,
--     Description NVARCHAR(255),
--     MainCategory INT NULL,

--     CONSTRAINT FK_Category_MainCategory
--     FOREIGN KEY (MainCategory)
--     REFERENCES Categories(CategoryId)
-- );
-- GO

-- CREATE TABLE Suppliers
-- (
--     SupplierId INT IDENTITY(1,1) PRIMARY KEY,
--     Name NVARCHAR(100) NOT NULL,
--     Country NVARCHAR(50),
--     Email NVARCHAR(100),
--     Address NVARCHAR(200),
--     ContactNumber NVARCHAR(20)
-- );
-- GO

-- CREATE TABLE Customers
-- (
--     CustomerId INT IDENTITY(1,1) PRIMARY KEY,
--     FullName NVARCHAR(100) NOT NULL,
--     PhoneNumber NVARCHAR(20),
--     Email NVARCHAR(100) UNIQUE,
--     ShippingAddress NVARCHAR(200),
--     RegistrationDate DATE
-- );
-- GO

-- CREATE TABLE Products
-- (
--     ProductId INT IDENTITY(1,1) PRIMARY KEY,
--     StockQuantity INT NOT NULL,
--     Name NVARCHAR(100) NOT NULL,
--     AddedDate DATE,
--     Description NVARCHAR(255),
--     UnitPrice DECIMAL(10,2),

--     CategoryId INT NOT NULL,

--     -- CONSTRAINT FK_Product_Category
--     -- FOREIGN KEY(CategoryId)
--     -- REFERENCES Categories(CategoryId)
-- );
-- GO

-- CREATE TABLE Products_Suppliers
-- (
--     SupplierId INT,
--     ProductId INT,

--     PRIMARY KEY(SupplierId, ProductId),

--     CONSTRAINT FK_PS_Supplier
--     FOREIGN KEY(SupplierId)
--     REFERENCES Suppliers(SupplierId),

--     CONSTRAINT FK_PS_Product
--     FOREIGN KEY(ProductId)
--     REFERENCES Products(ProductId)
-- );
-- GO

-- CREATE TABLE StockTransactions
-- (
--     TranId INT IDENTITY(1,1) PRIMARY KEY,
--     TranDate DATE,
--     QuantityChange INT,
--     Type NVARCHAR(50),
--     Reference NVARCHAR(100),

--     ProductId INT NOT NULL,

--     CONSTRAINT FK_Stock_Product
--     FOREIGN KEY(ProductId)
--     REFERENCES Products(ProductId)
-- );
-- GO

-- CREATE TABLE Reviews
-- (
--     ReviewId INT IDENTITY(1,1) PRIMARY KEY,
--     Rating INT,
--     Date DATE,
--     Comment NVARCHAR(500),

--     ProductId INT,
--     CustomerId INT,


--     CONSTRAINT FK_Review_Product
--     FOREIGN KEY(ProductId)
--     REFERENCES Products(ProductId),


--     CONSTRAINT FK_Review_Customer
--     FOREIGN KEY(CustomerId)
--     REFERENCES Customers(CustomerId)
-- );
-- GO

-- CREATE TABLE Orders
-- (
--     OrderId INT IDENTITY(1,1) PRIMARY KEY,

--     Status NVARCHAR(50),
--     TotalAmount DECIMAL(10,2),
--     OrderDate DATE,

--     CustomerId INT,


--     CONSTRAINT FK_Order_Customer
--     FOREIGN KEY(CustomerId)
--     REFERENCES Customers(CustomerId)
-- );
-- GO

-- CREATE TABLE OrderItems
-- (
--     OrderItemId INT IDENTITY(1,1) PRIMARY KEY,

--     Quantity INT,
--     UnitPrice DECIMAL(10,2),

--     ProductId INT,
--     OrderId INT,


--     CONSTRAINT FK_OrderItem_Product
--     FOREIGN KEY(ProductId)
--     REFERENCES Products(ProductId),


--     CONSTRAINT FK_OrderItem_Order
--     FOREIGN KEY(OrderId)
--     REFERENCES Orders(OrderId)
-- );
-- GO

-- CREATE TABLE Payments
-- (
--     PaymentId INT IDENTITY(1,1) PRIMARY KEY,

--     PaymentDate DATE,
--     Amount DECIMAL(10,2),
--     Status NVARCHAR(50),
--     Method NVARCHAR(50)
-- );
-- GO

-- CREATE TABLE Orders_Payments
-- (
--     OrderId INT,
--     PaymentId INT,


--     PRIMARY KEY(OrderId, PaymentId),


--     CONSTRAINT FK_OP_Order
--     FOREIGN KEY(OrderId)
--     REFERENCES Orders(OrderId),


--     CONSTRAINT FK_OP_Payment
--     FOREIGN KEY(PaymentId)
--     REFERENCES Payments(PaymentId)
-- );
-- GO

-- CREATE TABLE Shipments
-- (
--     ShipmentId INT IDENTITY(1,1) PRIMARY KEY,

--     ShipmentDate DATE,
--     Status NVARCHAR(50),
--     DeliveryDate DATE,
--     CarrierName NVARCHAR(100),
--     TrackingNumber NVARCHAR(100),

--     OrderId INT,


--     CONSTRAINT FK_Shipment_Order
--     FOREIGN KEY(OrderId)
--     REFERENCES Orders(OrderId)
-- );
-- GO