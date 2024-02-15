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
 ID int primary key,
 Description varchar(255),
 Price float not null,
 Stock_Amount date,
 Category_ID int,
 FOREIGN KEY (Category_ID) REFERENCES Category(ID),
 check(Price>=0)
 );
 
 create table Customers(
 ID int primary key,
 User_Name varchar(255) unique not null,
 Password varchar(255) NOT NULL,
 First_Name nvarchar(255),
 Last_Name nvarchar(255),
 Email varchar(255),
 Mobile_phone varchar(255),
 Address nvarchar(255),
 Country nvarchar(255)
 );

 create table Orders(
 ID int primary key,
 Customer_ID int references Customers(ID),
 Order_Date date not null,
 Required_Date date not null,
 Ship_Address nvarchar(255) not null,
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
 Payment_ID int primary key,
 Amount float NOT NULL,
 Date date NOT NULL,
 Order_ID int,
 Customer_ID int,
 FOREIGN KEY (Order_ID) REFERENCES Orders(ID),
 FOREIGN KEY (Customer_ID) REFERENCES Customers(ID),
 check(Amount>0)
 );


 --------------------------------- insert data -----------------------------
 -- Inserting data into Category table
INSERT INTO Category (ID, Label, Description)
VALUES
    (1, 'Electronics', 'Electronics category'),
    (2, 'Clothing', 'Clothing category'),
    (3, 'Home', 'Home category'),
    (4, 'Beauty', 'Beauty category');

-- Inserting data into Items table
INSERT INTO Items (ID, Description, Price, Stock_Amount, Category_ID)
VALUES
    (1, 'Smartphone', 500, '2024-02-15', 1),
    (2, 'Laptop', 1000, '2024-02-15', 1),
    (3, 'T-Shirt', 20, '2024-02-15', 2),
    (4, 'Jeans', 50, '2024-02-15', 2),
    (5, 'Sofa', 800, '2024-02-15', 3),
    (6, 'Bed Frame', 600, '2024-02-15', 3),
    (7, 'Lipstick', 15, '2024-02-15', 4),
    (8, 'Shampoo', 10, '2024-02-15', 4);

-- Inserting data into Customers table
INSERT INTO Customers (ID, User_Name, Password, First_Name, Last_Name, Email, Mobile_phone, Address, Country)
VALUES
	(0, 'admin', '1', 'Minh', 'Hai', 'haivmhe181099@fpt.edu.vn', '+0848524304', '20/42 thi tran Tien Lang, Tien Lang, Haiphong', 'VN'),
    (1, 'john123', 'pass123', 'John', 'Smith', 'john.smith@example.com', '+1234567890', '123 Main St', 'USA'),
    (2, 'sarah89', 'sarah123', 'Sarah', 'Johnson', 'sarah.johnson@example.com', '+9876543210', '456 Elm St', 'USA'),
    (3, 'david22', 'david456', 'David', 'Brown', 'david.brown@example.com', '+5555555555', '789 Oak Ave', 'Canada');

-- Inserting data into Orders table
INSERT INTO Orders (ID, Customer_ID, Order_Date, Required_Date, Ship_Address)
VALUES
    (1, 1, '2024-02-10', '2024-02-15', '123 Main St, USA'),
    (2, 2, '2024-02-11', '2024-02-16', '456 Elm St, USA'),
    (3, 3, '2024-02-12', '2024-02-17', '789 Oak Ave, Canada');

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
INSERT INTO Payments (Payment_ID, Amount, Date, Order_ID, Customer_ID)
VALUES
    (1, 1100, '2024-02-15', 1, 1),
    (2, 110, '2024-02-15', 2, 2),
    (3, 815, '2024-02-15', 3, 3);