/*==================================================
    CREATE DATABASE
==================================================*/
CREATE DATABASE FastFoodDB;
GO

USE FastFoodDB;
GO

/*==================================================
    USERS
==================================================*/
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    FullName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(255) NOT NULL,
    Phone NVARCHAR(20),
    Address NVARCHAR(255),
    Role NVARCHAR(20) NOT NULL
);
GO

/*==================================================
    RESTAURANTS
==================================================*/
CREATE TABLE Restaurants (
    RestaurantID INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantName NVARCHAR(100) NOT NULL,
    Address NVARCHAR(255),
    Phone NVARCHAR(20),
    OwnerID INT NOT NULL,

    CONSTRAINT FK_Restaurant_Owner
        FOREIGN KEY (OwnerID)
        REFERENCES Users(UserID)
);
GO

/*==================================================
    MENU ITEMS
==================================================*/
CREATE TABLE MenuItems (
    ItemID INT IDENTITY(1,1) PRIMARY KEY,
    RestaurantID INT NOT NULL,
    ItemName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255),
    Price DECIMAL(10,2) NOT NULL,
    StockQuantity INT DEFAULT 100,

    CONSTRAINT FK_MenuItem_Restaurant
        FOREIGN KEY (RestaurantID)
        REFERENCES Restaurants(RestaurantID)
);
GO

/*==================================================
    ORDERS
==================================================*/
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL,
    RestaurantID INT NOT NULL,
    ShipperID INT NULL,

    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2),
    Status NVARCHAR(30),

    CONSTRAINT FK_Order_Customer
        FOREIGN KEY (CustomerID)
        REFERENCES Users(UserID),

    CONSTRAINT FK_Order_Restaurant
        FOREIGN KEY (RestaurantID)
        REFERENCES Restaurants(RestaurantID),

    CONSTRAINT FK_Order_Shipper
        FOREIGN KEY (ShipperID)
        REFERENCES Users(UserID)
);
GO

/*==================================================
    ORDER DETAILS
==================================================*/
CREATE TABLE OrderDetails (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    ItemID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,

    CONSTRAINT FK_OrderDetail_Order
        FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),

    CONSTRAINT FK_OrderDetail_Item
        FOREIGN KEY (ItemID)
        REFERENCES MenuItems(ItemID)
);
GO

/*==================================================
    PAYMENTS
==================================================*/
CREATE TABLE Payments (
    PaymentID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    PaymentMethod NVARCHAR(30),
    PaymentStatus NVARCHAR(30),
    PaymentDate DATETIME DEFAULT GETDATE(),

    CONSTRAINT FK_Payment_Order
        FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
);
GO

/*==================================================
    SAMPLE USERS
==================================================*/
INSERT INTO Users
(FullName, Email, PasswordHash, Phone, Address, Role)
VALUES
('Nguyen Van A','customer1@gmail.com','123456','0901111111','Ha Noi','CUSTOMER'),
('Tran Thi B','customer2@gmail.com','123456','0902222222','Ha Noi','CUSTOMER'),

('KFC Manager','kfc@gmail.com','123456','0903333333','Ha Noi','RESTAURANT'),
('Lotteria Manager','lotteria@gmail.com','123456','0904444444','Ha Noi','RESTAURANT'),

('Nguyen Shipper','shipper1@gmail.com','123456','0905555555','Ha Noi','SHIPPER'),
('Tran Shipper','shipper2@gmail.com','123456','0906666666','Ha Noi','SHIPPER'),

('System Admin','admin@gmail.com','123456','0907777777','Ha Noi','ADMIN');
GO

/*==================================================
    SAMPLE RESTAURANTS
==================================================*/
INSERT INTO Restaurants
(RestaurantName, Address, Phone, OwnerID)
VALUES
('KFC Ha Noi','Cau Giay, Ha Noi','0241111111',3),
('Lotteria Ha Noi','Dong Da, Ha Noi','0242222222',4);
GO

/*==================================================
    SAMPLE MENU ITEMS
==================================================*/
INSERT INTO MenuItems
(RestaurantID, ItemName, Description, Price, StockQuantity)
VALUES
(1,'Ga Ran Truyen Thong','Ga ran KFC',79000,100),
(1,'Burger Bo','Burger bo pho mai',69000,100),
(1,'Pepsi','Nuoc ngot Pepsi',15000,200),

(2,'Burger Ga','Burger ga Lotteria',65000,100),
(2,'Khoai Tay Chien','Khoai tay chien gion',35000,150),
(2,'Coca Cola','Nuoc ngot Coca Cola',15000,200);
GO

/*==================================================
    SAMPLE ORDERS
==================================================*/
INSERT INTO Orders
(CustomerID, RestaurantID, ShipperID, TotalAmount, Status)
VALUES
(1,1,5,148000,'Dang giao'),
(2,2,6,100000,'Da giao');
GO

/*==================================================
    SAMPLE ORDER DETAILS
==================================================*/
INSERT INTO OrderDetails
(OrderID, ItemID, Quantity, UnitPrice)
VALUES
(1,1,1,79000),
(1,3,1,15000),
(1,2,1,69000),

(2,4,1,65000),
(2,5,1,35000);
GO

/*==================================================
    SAMPLE PAYMENTS
==================================================*/
INSERT INTO Payments
(OrderID, PaymentMethod, PaymentStatus)
VALUES
(1,'MoMo','Paid'),
(2,'Cash','Paid');
GO

/*==================================================
    TEST QUERIES
==================================================*/

-- List all menu items
SELECT * FROM MenuItems;

-- List all customers
SELECT * FROM Users
WHERE Role = 'CUSTOMER';

-- List all orders
SELECT *
FROM Orders;

-- Detailed order information
SELECT
    O.OrderID,
    U.FullName AS Customer,
    R.RestaurantName,
    O.Status,
    O.TotalAmount
FROM Orders O
JOIN Users U ON O.CustomerID = U.UserID
JOIN Restaurants R ON O.RestaurantID = R.RestaurantID;

-- Restaurant menu
SELECT
    R.RestaurantName,
    M.ItemName,
    M.Price
FROM MenuItems M
JOIN Restaurants R
    ON M.RestaurantID = R.RestaurantID;