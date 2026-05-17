-- Active: 1777352198323@@127.0.0.1@3306@ecommerce_db

SHOW DATABASES;

DROP DATABASE ecommerce_db;
--Step 2: Database Schema (DDL)
CREATE DATABASE ecommerce_db;

USE ecommerce_db;
SHOW TABLES; 


-- USERS TABLE
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) UNIQUE,
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CATEGORIES TABLE
CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) UNIQUE NOT NULL
);

-- PRODUCTS TABLE
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(150) NOT NULL,
    price DECIMAL(10,2) NOT NULL CHECK(price > 0),
    stock INT NOT NULL DEFAULT 0 CHECK(stock >= 0),
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- ORDERS TABLE
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    order_date DATE DEFAULT (CURRENT_DATE),
    status VARCHAR(50) DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- ORDER ITEMS TABLE
CREATE TABLE order_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK(quantity > 0),
    price DECIMAL(10,2) NOT NULL CHECK(price > 0),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- PAYMENTS TABLE
CREATE TABLE payments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT UNIQUE,
    payment_method VARCHAR(50) NOT NULL,
    amount DECIMAL(10,2) NOT NULL CHECK(amount > 0),
    payment_date DATE DEFAULT (CURRENT_DATE),
    status VARCHAR(50) DEFAULT 'Paid',
    FOREIGN KEY (order_id) REFERENCES orders(id)
);



--Step 3: Insert Data (DML)

INSERT INTO categories (name)
VALUES
('Electronics'),
('Fashion'),
('Books'),
('Home Appliances'),
('Sports');

INSERT INTO users (name, email, phone, address)
VALUES
('Alice Johnson', 'alice@gmail.com', '01711111111', 'Dhaka'),
('Bob Smith', 'bob@gmail.com', '01722222222', 'Chattogram'),
('Charlie Brown', 'charlie@gmail.com', '01733333333', 'Khulna'),
('David Lee', 'david@gmail.com', '01744444444', 'Rajshahi'),
('Emma Watson', 'emma@gmail.com', '01755555555', 'Sylhet'),
('Farhan Ahmed', 'farhan@gmail.com', '01766666666', 'Dhaka'),
('Grace Miller', 'grace@gmail.com', '01777777777', 'Barishal'),
('Hasan Karim', 'hasan@gmail.com', '01788888888', 'Cumilla'),
('Ibrahim Khan', 'ibrahim@gmail.com', '01799999999', 'Rangpur'),
('Jannat Noor', 'jannat@gmail.com', '01710101010', 'Mymensingh');

INSERT INTO products (name, price, stock, category_id)
VALUES
('Laptop', 85000, 10, 1),
('Smartphone', 30000, 20, 1),
('Headphones', 2500, 50, 1),
('T-Shirt', 800, 100, 2),
('Jeans Pant', 1500, 60, 2),
('Novel Book', 500, 40, 3),
('Programming Book', 1200, 30, 3),
('Microwave Oven', 15000, 15, 4),
('Refrigerator', 55000, 8, 4),
('Football', 1200, 25, 5),
('Cricket Bat', 3500, 18, 5),
('Keyboard', 2000, 35, 1),
('Mouse', 1200, 45, 1),
('Jacket', 2500, 20, 2),
('Blender Machine', 4000, 12, 4);

INSERT INTO orders (user_id, order_date, status)
VALUES
(1, '2026-05-01', 'Delivered'),
(2, '2026-05-01', 'Delivered'),
(3, '2026-05-02', 'Pending'),
(4, '2026-05-02', 'Shipped'),
(5, '2026-05-03', 'Delivered'),
(6, '2026-05-03', 'Pending'),
(7, '2026-05-04', 'Delivered'),
(8, '2026-05-04', 'Shipped'),
(9, '2026-05-05', 'Delivered'),
(10, '2026-05-05', 'Pending'),
(1, '2026-05-06', 'Delivered'),
(2, '2026-05-06', 'Pending'),
(3, '2026-05-07', 'Delivered'),
(4, '2026-05-07', 'Shipped'),
(5, '2026-05-08', 'Delivered'),
(6, '2026-05-08', 'Pending'),
(7, '2026-05-09', 'Delivered'),
(8, '2026-05-09', 'Delivered'),
(9, '2026-05-10', 'Pending'),
(10, '2026-05-10', 'Delivered');

INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES
(1,1,1,85000),
(1,3,2,5000),
(2,2,1,30000),
(3,4,3,2400),
(4,5,2,3000),
(5,6,2,1000),
(6,7,1,1200),
(7,8,1,15000),
(8,9,1,55000),
(9,10,2,2400),
(10,11,1,3500),
(11,12,2,4000),
(12,13,1,1200),
(13,14,1,2500),
(14,15,1,4000),
(15,1,1,85000),
(16,2,1,30000),
(17,3,2,5000),
(18,4,2,1600),
(19,5,1,1500);

INSERT INTO payments (order_id, payment_method, amount, payment_date, status)
VALUES
(1,'Card',90000,'2026-05-01','Paid'),
(2,'Bkash',30000,'2026-05-01','Paid'),
(3,'Cash',2400,'2026-05-02','Pending'),
(4,'Nagad',3000,'2026-05-02','Paid'),
(5,'Card',1000,'2026-05-03','Paid'),
(6,'Cash',1200,'2026-05-03','Pending'),
(7,'Bkash',15000,'2026-05-04','Paid'),
(8,'Card',55000,'2026-05-04','Paid'),
(9,'Nagad',2400,'2026-05-05','Paid'),
(10,'Cash',3500,'2026-05-05','Pending');





--Step 4: Basic Queries

--Find users whose name starts with 'A'
SELECT * 
FROM users
WHERE name LIKE 'A%';


--Get products under Electronics category
SELECT p.name, p.price
FROM products p
JOIN categories c
ON p.category_id = c.id
WHERE c.name = 'Electronics';


--Find orders within a date range
SELECT *
FROM orders
WHERE order_date BETWEEN '2026-05-01' AND '2026-05-05';

--Find products not in Fashion category
SELECT name
FROM products
WHERE category_id NOT IN (
    SELECT id
    FROM categories
    WHERE name = 'Fashion'
);




--Step 5: Aggregation Queries

--Total Sales Per User
SELECT 
    u.name,
    SUM(p.amount) AS total_spent
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN payments p ON o.id = p.order_id
GROUP BY u.name;

--Total Orders Per Day
SELECT 
    order_date,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_date;

--Users Who Spent More Than 5000
SELECT 
    u.name,
    SUM(p.amount) AS total_spent
FROM users u
JOIN orders o ON u.id = o.user_id
JOIN payments p ON o.id = p.order_id
GROUP BY u.name
HAVING SUM(p.amount) > 5000;



--Bonus Task

--Create Order Summary View
CREATE VIEW order_summary AS
SELECT
    o.id AS order_id,
    u.name AS customer_name,
    o.order_date,
    p.amount,
    pay.payment_method,
    pay.status
FROM orders o
JOIN users u ON o.user_id = u.id
JOIN payments pay ON o.id = pay.order_id
JOIN payments p ON o.id = p.order_id;


--Trigger to Update Stock After Order
DELIMITER //
