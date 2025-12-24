create database Inventory_Management;
use Inventory_Management;

-- Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    category VARCHAR(30),
    price DECIMAL(10,2),
    reorder_level INT);
    
-- Suppliers Table
CREATE TABLE Suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(50),
    contact_no VARCHAR(15));

-- Stock Table
CREATE TABLE Stock (
    product_id INT,
    quantity_available INT,
    last_updated DATE,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Purchases Table
CREATE TABLE Purchases (
    purchase_id INT PRIMARY KEY,
    product_id INT,
    purchase_date DATE,
    quantity_purchased INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    sale_date DATE,
    quantity_sold INT,
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- Add supplier_id to Purchases
ALTER TABLE Purchases
ADD supplier_id INT,
ADD FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id);

-- Add City to Suppliers
ALTER TABLE Suppliers ADD city VARCHAR(50);

-- Insert into Products Table
INSERT INTO Products VALUES
(1,'Laptop','Electronics',55000,5),
(2,'Mouse','Electronics',500,20),
(3,'Keyboard','Electronics',1200,15),
(4,'Monitor','Electronics',15000,8),
(5,'Printer','Electronics',9000,6),
(6,'Chair','Furniture',2500,10),
(7,'Table','Furniture',6000,5),
(8,'Cupboard','Furniture',12000,4),
(9,'Notebook','Stationery',50,50),
(10,'Pen','Stationery',10,100),
(11,'Marker','Stationery',30,60),
(12,'Stapler','Stationery',150,20),
(13,'Headphones','Electronics',2000,12),
(14,'Webcam','Electronics',3500,7),
(15,'Router','Electronics',4000,6),
(16,'Water Bottle','Accessories',300,25),
(17,'Backpack','Accessories',1800,10),
(18,'Calculator','Stationery',700,15),
(19,'Extension Board','Electronics',800,10),
(20,'Paper Ream','Stationery',350,30);

-- Insert into Suppliers Table 
INSERT INTO Suppliers VALUES
(1,'Tech Distributors','9876543210','Mumbai'),
(2,'Office Mart','9123456780','Pune'),
(3,'Electro World','9988776655','Delhi'),
(4,'Smart Supplies','9012345678','Bangalore'),
(5,'Furniture Hub','9090909090','Chennai'),
(6,'Stationery Zone','8888777766','Hyderabad'),
(7,'Digital Store','7777666655','Ahmedabad'),
(8,'Gadget Point','9999888877','Kolkata'),
(9,'Supply Chain Co','9666554433','Jaipur'),
(10,'Warehouse India','9555443322','Indore'),
(11,'Retail Source','9444332211','Bhopal'),
(12,'Prime Distributors','9333221100','Nagpur'),
(13,'Office Needs','9222110099','Noida'),
(14,'Techno Solutions','9111009988','Gurgaon'),
(15,'Metro Traders','9000998877','Thane'),
(16,'City Wholesalers','9888776654','Navi Mumbai'),
(17,'Bulk Buy Ltd','9777665544','Surat'),
(18,'Fast Supply','9666554432','Vadodara'),
(19,'Allied Traders','9555443321','Rajkot'),
(20,'Inventory Experts','9444332209','Udaipur');

-- Insert into Stock Table
INSERT INTO Stock (product_id, quantity_available, last_updated) 
VALUES
(1,4,'2025-03-01'),
(2,25,'2025-03-01'),
(3,10,'2025-03-01'),
(4,6,'2025-03-01'),
(5,3,'2025-03-01'),
(6,8,'2025-03-01'),
(7,2,'2025-03-01'),
(8,5,'2025-03-01'),
(9,120,'2025-03-01'),
(10,300,'2025-03-01'),
(11,50,'2025-03-01'),
(12,18,'2025-03-01'),
(13,9,'2025-03-01'),
(14,6,'2025-03-01'),
(15,4,'2025-03-01'),
(16,30,'2025-03-01'),
(17,12,'2025-03-01'),
(18,10,'2025-03-01'),
(19,7,'2025-03-01'),
(20,40,'2025-03-01');

-- Insert into Purchases Table
INSERT INTO Purchases 
(purchase_id, product_id, purchase_date, quantity_purchased, supplier_id)
VALUES
(101,1,'2025-02-01',10,1),
(102,2,'2025-02-02',50,1),
(103,3,'2025-02-03',30,1),
(104,4,'2025-02-04',15,1),
(105,5,'2025-02-05',10,1),

(106,6,'2025-02-06',20,2),
(107,7,'2025-02-07',10,2),
(108,8,'2025-02-08',8,2),
(109,9,'2025-02-09',200,2),
(110,10,'2025-02-10',500,2),

(111,11,'2025-02-11',100,3),
(112,12,'2025-02-12',50,3),
(113,13,'2025-02-13',25,3),
(114,14,'2025-02-14',20,3),
(115,15,'2025-02-15',18,3),

(116,16,'2025-02-16',60,4),
(117,17,'2025-02-17',30,4),
(118,18,'2025-02-18',40,4),
(119,19,'2025-02-19',35,4),
(120,20,'2025-02-20',80,4);

-- Insert into Sales Table
INSERT INTO Sales VALUES
(201,1,'2025-03-01',6),
(202,2,'2025-03-01',30),
(203,3,'2025-03-01',20),
(204,4,'2025-03-01',9),
(205,5,'2025-03-01',7),
(206,6,'2025-03-02',12),
(207,7,'2025-03-02',8),
(208,8,'2025-03-02',3),
(209,9,'2025-03-02',80),
(210,10,'2025-03-02',200),
(211,11,'2025-03-03',45),
(212,12,'2025-03-03',22),
(213,13,'2025-03-03',16),
(214,14,'2025-03-03',14),
(215,15,'2025-03-03',12),
(216,16,'2025-03-04',25),
(217,17,'2025-03-04',18),
(218,18,'2025-03-04',20),
(219,19,'2025-03-04',28),
(220,20,'2025-03-04',35);

select* from Products;
select* from Suppliers;
select* from Stock;
select* from Purchases;
select* from Sales;

-- Top 10 Analysis
-- 1.Total Number of Products
Select COUNT(*) AS total_products from Products;

-- 2.Total Units Sold
Select SUM(quantity_sold) as Total_Units_Sold from Sales;

-- 3.Current Inventory Value
Select ROUND(SUM(p.price * s.quantity_available),2) AS inventory_value
From Products p
Inner Join  Stock s
on p.product_id = s.product_id;

-- 4.Category-Wise Sales
Select p.category,SUM(s.quantity_sold) AS total_units_sold
From Sales s
Inner Join Products p on s.product_id = p.product_id
Group by p.category;

-- 5.Low-Stock Products (Reorder Alert)
Select p.product_name, s.quantity_available, p.reorder_level
From Products p
Inner Join  Stock s on p.product_id = s.product_id
where s.quantity_available < p.reorder_level;

-- 6.Top 5 Best-Selling Products
Select p.product_name,SUM(s.quantity_sold) AS total_sold
From Sales s
Join Products p 
on s.product_id = p.product_id
group by p.product_name
order by total_sold DESC
limit 5;

-- 7.Dead Stock (Products with No Sales)
Select p.product_name
from Products p
left join Sales sa on p.product_id = sa.product_id
where sa.product_id is null;

-- 8.Supplier-Wise Purchase Analysis
SELECT s.supplier_name, SUM(pu.quantity_purchased) as total_purchased
from Purchases pu
Inner Join Suppliers s
on pu.supplier_id = s.supplier_id
group by s.supplier_name
order by total_purchased DESC;

-- 9.Stock Risk Analysis (Near Reorder Level)
select p.product_name, s.quantity_available
FROM Products p
inner join Stock s 
on p.product_id = s.product_id
where s.quantity_available <= p.reorder_level + 2;

-- 10.Inventory Turnover 
select p.product_name, SUM(sa.quantity_sold) as total_sold
from Products p
left join Sales sa on p.product_id = sa.product_id
group by p.product_name;







