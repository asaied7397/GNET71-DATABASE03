-- CREATE TABLE Hotels
-- (
--     HotelId INT IDENTITY(1,1) PRIMARY KEY,
--     Name NVARCHAR(100) NOT NULL,
--     Address NVARCHAR(200),
--     City NVARCHAR(50),
--     StarRating INT,
--     ContactNumber NVARCHAR(20),
--     ManagedId INT UNIQUE
-- );
-- GO

-- CREATE TABLE Staff
-- (
--     StaffId INT IDENTITY(1,1) PRIMARY KEY,
--     FullName NVARCHAR(100) NOT NULL,
--     Position NVARCHAR(50),
--     Salary DECIMAL(10,2),

--     HotelId INT,

--     CONSTRAINT FK_Staff_Hotel
--     FOREIGN KEY(HotelId)
--     REFERENCES Hotels(HotelId)
-- );
-- GO

-- ALTER TABLE Hotels
-- ADD CONSTRAINT FK_Hotel_Manager
-- FOREIGN KEY(ManagedId)
-- REFERENCES Staff(StaffId);
-- GO

-- CREATE TABLE Services
-- (
--     ServiceId INT IDENTITY(1,1) PRIMARY KEY,
--     ServiceName NVARCHAR(100),
--     Charge DECIMAL(10,2),
--     RequestDate DATE,

--     StaffId INT,

--     CONSTRAINT FK_Service_Staff
--     FOREIGN KEY(StaffId)
--     REFERENCES Staff(StaffId)
-- );
-- GO

-- CREATE TABLE Rooms
-- (
--     RoomNumber INT PRIMARY KEY,
--     RoomType NVARCHAR(50),
--     Capacity INT,
--     DailyRate DECIMAL(10,2),
--     Availability BIT,

--     HotelId INT,

--     CONSTRAINT FK_Room_Hotel
--     FOREIGN KEY(HotelId)
--     REFERENCES Hotels(HotelId)
-- );
-- GO

-- CREATE TABLE Amenities
-- (
--     RoomNumber INT,
--     Amenity NVARCHAR(100),

--     PRIMARY KEY(RoomNumber, Amenity),

--     CONSTRAINT FK_Amenity_Room
--     FOREIGN KEY(RoomNumber)
--     REFERENCES Rooms(RoomNumber)
-- );
-- GO

-- CREATE TABLE Guests
-- (
--     GuestId INT IDENTITY(1,1) PRIMARY KEY,
--     FullName NVARCHAR(100) NOT NULL,
--     Nationality NVARCHAR(50),
--     PassportNumber NVARCHAR(50) UNIQUE,
--     DateOfBirth DATE
-- );
-- GO

-- CREATE TABLE Guest_Contact_Details
-- (
--     GuestId INT,
--     Detail NVARCHAR(200),

--     PRIMARY KEY(GuestId, Detail),

--     CONSTRAINT FK_GuestContact_Guest
--     FOREIGN KEY(GuestId)
--     REFERENCES Guests(GuestId)
-- );
-- GO

-- CREATE TABLE Payments
-- (
--     PaymentId INT IDENTITY(1,1) PRIMARY KEY,
--     Method NVARCHAR(50),
--     Date DATE,
--     Amount DECIMAL(10,2),
--     ConfirmationNumber NVARCHAR(100)
-- );
-- GO

-- CREATE TABLE Reservations
-- (
--     ReservationId INT IDENTITY(1,1) PRIMARY KEY,

--     BookingDate DATE,
--     CheckInDate DATE,
--     CheckOutDate DATE,
--     ReservationStatus NVARCHAR(50),
--     TotalPrice DECIMAL(10,2),
--     NumberOfAdults INT,
--     NumberOfChildren INT
-- );
-- GO

-- CREATE TABLE Reservations_Rooms
-- (
--     ReservationId INT,
--     RoomNumber INT,

--     PRIMARY KEY(ReservationId, RoomNumber),

--     CONSTRAINT FK_RR_Reservation
--     FOREIGN KEY(ReservationId)
--     REFERENCES Reservations(ReservationId),

--     CONSTRAINT FK_RR_Room
--     FOREIGN KEY(RoomNumber)
--     REFERENCES Rooms(RoomNumber)
-- );
-- GO

-- CREATE TABLE Reservations_Guest
-- (
--     ReservationId INT,
--     GuestId INT,

--     PRIMARY KEY(ReservationId, GuestId),

--     CONSTRAINT FK_RG_Reservation
--     FOREIGN KEY(ReservationId)
--     REFERENCES Reservations(ReservationId),

--     CONSTRAINT FK_RG_Guest
--     FOREIGN KEY(GuestId)
--     REFERENCES Guests(GuestId)
-- );
-- GO

-- CREATE TABLE ReservationService
-- (
--     ServiceId INT,
--     ReservationId INT,

--     PRIMARY KEY(ServiceId, ReservationId),

--     CONSTRAINT FK_RS_Service
--     FOREIGN KEY(ServiceId)
--     REFERENCES Services(ServiceId),

--     CONSTRAINT FK_RS_Reservation
--     FOREIGN KEY(ReservationId)
--     REFERENCES Reservations(ReservationId)
-- );
-- GO

-- CREATE TABLE Reservations_Payment
-- (
--     ReservationId INT,
--     PaymentId INT,

--     PRIMARY KEY(ReservationId, PaymentId),

--     CONSTRAINT FK_RP_Reservation
--     FOREIGN KEY(ReservationId)
--     REFERENCES Reservations(ReservationId),

--     CONSTRAINT FK_RP_Payment
--     FOREIGN KEY(PaymentId)
--     REFERENCES Payments(PaymentId)
-- );
-- GO