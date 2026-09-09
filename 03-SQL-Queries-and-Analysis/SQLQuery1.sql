-- 1. Create Database
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'GoogleAnalyticsDB')
BEGIN
    CREATE DATABASE GoogleAnalyticsDB;
END
GO

USE GoogleAnalyticsDB;
GO

-- 2. Drop existing tables if re-running
IF OBJECT_ID('GoogleOrders', 'U') IS NOT NULL DROP TABLE GoogleOrders;
IF OBJECT_ID('GoogleProducts', 'U') IS NOT NULL DROP TABLE GoogleProducts;
GO

-- 3. Create Products Table
CREATE TABLE GoogleProducts (
    ProductID INT IDENTITY(101,1) PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50) NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);
GO

-- 4. Create Orders Table
CREATE TABLE GoogleOrders (
    OrderID INT IDENTITY(1001,1) PRIMARY KEY,
    ProductID INT NOT NULL,
    OrderDate DATE NOT NULL,
    Region VARCHAR(50) NOT NULL,
    CustomerType VARCHAR(50) NOT NULL,
    Quantity INT NOT NULL,
    Discount DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES GoogleProducts(ProductID)
);
GO

-- 5. Insert Products Data
INSERT INTO GoogleProducts (ProductName, Category, Price) VALUES
('Google Pixel 8 Pro', 'Hardware', 999.00),
('Google Pixel Buds Pro', 'Audio', 199.00),
('Nest Wifi Pro', 'Smart Home', 299.00),
('Chromecast with Google TV', 'Smart Home', 49.00),
('Google Merchandise Hoodie', 'Apparel', 65.00),
('Pixel Watch 2', 'Wearables', 349.00);
GO

-- 6. Insert Orders Data
INSERT INTO GoogleOrders (ProductID, OrderDate, Region, CustomerType, Quantity, Discount) VALUES
(101, '2025-01-15', 'North America', 'Consumer', 2, 0.05),
(102, '2025-01-18', 'Europe', 'Corporate', 5, 0.10),
(103, '2025-02-01', 'Asia Pacific', 'Consumer', 3, 0.00),
(104, '2025-02-10', 'North America', 'Consumer', 10, 0.15),
(105, '2025-03-05', 'Europe', 'Consumer', 8, 0.00),
(106, '2025-03-12', 'Latin America', 'Corporate', 4, 0.10),
(101, '2026-01-10', 'North America', 'Corporate', 3, 0.05),
(102, '2026-01-22', 'Asia Pacific', 'Consumer', 6, 0.00),
(105, '2026-02-14', 'North America', 'Consumer', 12, 0.20),
(106, '2026-03-01', 'Europe', 'Corporate', 5, 0.10);
GO

USE GoogleAnalyticsDB;
GO

-- Create View for Power BI Import
CREATE OR ALTER VIEW vw_GoogleSalesPerformance AS
SELECT 
    o.OrderID,
    o.OrderDate,
    YEAR(o.OrderDate) AS OrderYear,
    MONTH(o.OrderDate) AS OrderMonth,
    p.ProductName,
    p.Category,
    o.Region,
    o.CustomerType,
    p.Price,
    o.Quantity,
    o.Discount,
    -- Revenue Calculation: (Price * Quantity) - Discount Amount
    CAST((p.Price * o.Quantity) * (1 - o.Discount) AS DECIMAL(10,2)) AS NetRevenue
FROM GoogleOrders o
JOIN GoogleProducts p ON o.ProductID = p.ProductID;
GO

SELECT * FROM vw_GoogleSalesPerformance;