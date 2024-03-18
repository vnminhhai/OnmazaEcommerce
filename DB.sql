USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'PRJ_ASS_2024')
BEGIN
	ALTER DATABASE PRJ_ASS_2024 SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE PRJ_ASS_2024 SET ONLINE;
	DROP DATABASE PRJ_ASS_2024;
END

GO

CREATE DATABASE PRJ_ASS_2024
GO

USE PRJ_ASS_2024
GO

/*******************************************************************************
	Drop tables if exists
*******************************************************************************/
DECLARE @sql nvarchar(MAX) 
SET @sql = N'' 

SELECT @sql = @sql + N'ALTER TABLE ' + QUOTENAME(KCU1.TABLE_SCHEMA) 
    + N'.' + QUOTENAME(KCU1.TABLE_NAME) 
    + N' DROP CONSTRAINT ' -- + QUOTENAME(rc.CONSTRAINT_SCHEMA)  + N'.'  -- not in MS-SQL
    + QUOTENAME(rc.CONSTRAINT_NAME) + N'; ' + CHAR(13) + CHAR(10) 
FROM INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS AS RC 

INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS KCU1 
    ON KCU1.CONSTRAINT_CATALOG = RC.CONSTRAINT_CATALOG  
    AND KCU1.CONSTRAINT_SCHEMA = RC.CONSTRAINT_SCHEMA 
    AND KCU1.CONSTRAINT_NAME = RC.CONSTRAINT_NAME 

EXECUTE(@sql) 

GO
DECLARE @sql2 NVARCHAR(max)=''

SELECT @sql2 += ' Drop table ' + QUOTENAME(TABLE_SCHEMA) + '.'+ QUOTENAME(TABLE_NAME) + '; '
FROM   INFORMATION_SCHEMA.TABLES
WHERE  TABLE_TYPE = 'BASE TABLE'

Exec Sp_executesql @sql2 
GO 

---------------------- Create tables ------------------
create table Category (
ID int primary key,
Label varchar(255),
Description varchar(255)
);
 
 create table Items(
 ID int primary key identity(1,1),
 Name nvarchar(255),
 Description varchar(255),
 Price float not null,
 Category_ID int,
 Image_ID INT default(0) not null,
 FOREIGN KEY (Category_ID) REFERENCES Category(ID),
 check(Price>=0)
 );
 
 create table Variants(
 Item_ID int references Items(ID),
 Name nvarchar(255),
 Stock_Amount int not null,
 check(Stock_Amount>=0),
 Image_ID INT identity(1,1) not null,
 primary key(Name, Item_ID)
 );

 create table Roles(
 ID int primary key,
 Name nvarchar(255) not null,
 Description nvarchar(255)
 )

 create table Customers(
 ID int primary key identity(0,1),
 User_Name varchar(255) unique not null,
 Password varchar(255) NOT NULL,
 First_Name nvarchar(255),
 Last_Name nvarchar(255),
 Email varchar(255),
 Mobile_Phone varchar(255),
 Address nvarchar(255),
 Country nvarchar(255),
 Image_ID INT default(0) not null,
 Role_ID int references Roles(ID) default(0)
 );

 create table Status(
 ID int primary key,
 Label nvarchar(255) not null
 );

 create table Orders(
 ID int primary key identity(1,1),
 Customer_ID int references Customers(ID),
 Order_Date date not null,
 Required_Date date not null,
 Ship_Address nvarchar(255) not null,
 Status_ID int references Status(ID) default(0) not null,
 check (Order_Date<Required_Date)
 );

 create table Detail(
 Order_ID int references Orders (ID),
 Item_ID int references Items(ID),
 Unit_Prices float not null,
 Quantity int not null,
 check(Quantity>0)
 );
 
 create table Payments(
 ID int primary key,
 Amount float NOT NULL,
 Date date NOT NULL,
 Order_ID int,
 FOREIGN KEY (Order_ID) REFERENCES Orders(ID),
 check(Amount>0)
 );

 create table Cart(
 Customer_ID int references Customers(ID),
 Item_ID int,
 Variant_Name nvarchar(255),
 Quantity int,
 Foreign key (Variant_Name, Item_ID) references Variants(Name, Item_ID)
 )


 --------------------------------- insert data -----------------------------
 -- Inserting data into Category table
INSERT INTO Category (ID, Label, Description)
VALUES
    (1, 'Electronics', 'Electronics category'),
    (2, 'Clothing', 'Clothing category'),
    (3, 'Home', 'Home category'),
    (4, 'Beauty', 'Beauty category');

-- Inserting data into Items table
INSERT INTO Items (Name, Description, Price, Category_ID)
VALUES
    ('Iphone', 'Smartphone from Apple', 500, 1),
    ('Laptop', 'Demo', 1000, 1),
    ('T-Shirt', 'Demo', 20, 2),
    ('Jeans', 'Demo', 50, 2),
    ('Sofa', 'Demo', 800, 3),
    ('Bed Frame', 'Demo', 600, 3),
    ('Lipstick', 'Demo', 15, 4),
    ('Shampoo', 'Demo', 10, 4);

	-- Inserting data into Variants table
INSERT INTO Variants (Item_ID, Name, Stock_Amount)
VALUES
    (1, 'Black', 25),
	(1, 'Gray', 7),
	(1, 'Blue', 12),
	(1, 'White', 5),
	(1, 'Gradient', 20),
	(1, 'Silver', 15),
	(2, 'Laptop', 8),
	(3, 'Brown', 20),
	(3, 'Black', 20),
	(3, 'White', 20),
	(4, 'Turquoise', 50),
	(4, 'Cyan', 50),
	(4, 'Dark Blue', 50),
	(5, 'Blue', 83),
	(5, 'Light Gray', 83),
	(5, 'Dark Gray', 83),
	(6, 'Mixed', 61),
	(6, 'Metal', 61),
	(6, 'Wooden', 61),
	(7, 'Red', 45),
	(7, 'Wine', 45),
	(7, 'Dark Pink', 45),
	(8, 'Shampoo', 106);

-- Inserting data into Roles table
INSERT INTO Roles (ID, Name, Description)
VALUES
    (0, 'Customer', 'Normal user'),
    (1, 'Staff', 'Staff'),
    (2, 'Admin', 'Admin');

-- Inserting data into Customers table
INSERT INTO Customers (User_Name, Password, First_Name, Last_Name, Email, Mobile_phone, Address, Country)
VALUES
	('admin', '$2a$10$Fpbdz7wWS/0RrL6ab9pF/OI6FfOGItV9WA1Fwj6a3EbyQKVpWLmXO', 'Minh', 'Hai', 'haivmhe181099@fpt.edu.vn', '+0848524304', '20/42 thi tran Tien Lang, Tien Lang, Haiphong', 'VN'),
    ('quynh4', '$2a$10$z1DMLZnjixymhozT9tmhA.FWepT2ub/jLgvo1IwOGufj0BWJvB2vW', 'Nhu Quynh', 'Nguyen Thi', 'nofomtre@gmal.com', '+817263450', 'Viet Doan Tien Du Bac Ninh', 'VN'),
	('customer', '$2a$10$Fpbdz7wWS/0RrL6ab9pF/OI6FfOGItV9WA1Fwj6a3EbyQKVpWLmXO', 'Kim Long', 'Nguyen', 'longnkhe181500@fpt.edu.vn', '+0848512345', 'Khoai Chau, Hung Yen', 'VN');

-- Inserting data into Status table
INSERT INTO Status (ID, Label)
VALUES
    (0, 'Pending'),
    (1, 'Transporting'),
    (2, 'Done');

-- Inserting data into Orders table
INSERT INTO Orders (Customer_ID, Order_Date, Required_Date, Ship_Address, Status_ID)
VALUES
    (2, '2024-02-10', '2024-02-15', 'Dai Hoc FPT Ha Noi', 1),
    (2, '2024-02-11', '2024-02-16', 'Viet Doan, Tien Du, Bac Ninh', 2),
    (1, '2024-02-12', '2024-02-17', 'An coffee, Hoa Lac', 1);

-- Inserting data into Detail table
INSERT INTO Detail (Order_ID, Item_ID, Unit_Prices, Quantity)
VALUES
    (1, 1, 500, 2),
    (1, 3, 20, 3),
    (2, 2, 1000, 1),
    (2, 4, 50, 2),
    (3, 5, 800, 1),
    (3, 7, 15, 4);

-- Inserting data into Payments table
INSERT INTO Payments (ID, Amount, Date, Order_ID)
VALUES
    (1, 1100, '2024-02-15', 1),
    (2, 110, '2024-02-15', 2),
    (3, 815, '2024-02-15', 3);

-- Inserting data into Cart table
INSERT INTO Cart (Customer_ID, Item_ID, Variant_Name, Quantity)
VALUES
    (0, 1, 'Black', 1),
    (0, 1, 'Blue', 2),
    (1, 2, 'Laptop', 3);

 -- Update roles
 update Customers set Role_ID = 2 where User_Name = 'admin'
