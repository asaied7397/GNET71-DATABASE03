-- USE ECommerceDB;
-- GO

-- INSERT INTO Customers
--     (FullName, PhoneNumber, Email, ShippingAddress, RegistrationDate)
-- VALUES
--     ('Ahmed Saied', '01012345678', 'ahmed@example.com',
--      'Cairo, Egypt', GETDATE());
-- GO


-- INSERT INTO Suppliers
--     (Name, Country, Email, Address, ContactNumber)
-- VALUES
--     ('Supplier One', 'Egypt', 'supplier1@example.com',
--      'Cairo', '01011111111'),
--     ('Supplier Two', 'Egypt', 'supplier2@example.com',
--      'Giza', '01022222222'),
--     ('Supplier Three', 'Egypt', 'supplier3@example.com',
--      'Alexandria', '01033333333');
-- GO


-- INSERT INTO Categories
--     (Name, Description)
-- VALUES
--     ('Electronics', 'Electronic products and devices'),
--     ('Clothing', 'Clothes and fashion products');
-- GO

-- ALTER TABLE Products
-- ALTER COLUMN StockQuantity INT NULL;
-- GO

-- ALTER TABLE Products
-- ALTER COLUMN CategoryId INT NULL;
-- GO


-- INSERT INTO Products
--     (Name, UnitPrice)
-- VALUES
--     ('Wireless Mouse', 750.00);
-- GO


-- CREATE TABLE ArchivedStock
-- (
--     TranId INT,
--     ProductId INT,
--     QuantityChange INT,
--     TranDate DATE
-- );
-- GO

-- INSERT INTO ArchivedStock
--     (TranId, ProductId, QuantityChange, TranDate)
-- SELECT
--     TranId,
--     ProductId,
--     QuantityChange,
--     TranDate
-- FROM StockTransactions
-- WHERE TranDate < '2023-01-01';
-- GO

-- UPDATE Products
-- SET UnitPrice = UnitPrice * 1.10
-- WHERE UnitPrice < 100;
-- GO

-- UPDATE Orders
-- SET Status =
--     CASE
--         WHEN TotalAmount > 5000 THEN 'Premium'
--         ELSE 'Standard'
--     END;
-- GO

-- USE HotelDB;
-- GO

-- INSERT INTO Guests
--     (FullName, Nationality, PassportNumber, DateOfBirth)
-- VALUES
--     ('Omar Ahmed', 'Egyptian', 'A12345678', '1998-05-15');
-- GO


-- INSERT INTO Guests
--     (FullName, Nationality, PassportNumber, DateOfBirth)
-- VALUES
--     ('Mohamed Ali', 'Egyptian', 'B12345678', '1995-03-10'),
--     ('Sara Hassan', 'Egyptian', 'C12345678', '2000-07-20'),
--     ('John Smith', 'British', 'D12345678', '1992-11-05');
-- GO

-- UPDATE Rooms
-- SET DailyRate = DailyRate * 1.15
-- WHERE RoomType = 'Suite';
-- GO

-- UPDATE Reservations
-- SET ReservationStatus =
--     CASE
--         WHEN CheckOutDate < GETDATE() THEN 'Completed'
--         WHEN CheckInDate > GETDATE() THEN 'Upcoming'
--         ELSE 'Active'
--     END;
-- GO