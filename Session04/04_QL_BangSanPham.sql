CREATE TABLE Products (
    id serial primary key ,
    name varchar(100) not null,
    category varchar(100),
    price numeric(15,2),
    stock int,
    manufacturer varchar(100)
);
-- Thêm dữ liệu vào bảng
INSERT INTO Products(name, category, price, stock, manufacturer)
VALUES ('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
       ('Chuột Logitech M90', 'Phụ kiện', 150000, 50, 'Logitech'),
       ('Bàn phím cơ Razer', 'Phụ kiện', 2200000, 0, 'Razer'),
       ('Macbook Air M2', 'Laptop', 32000000, 7, 'Apple'),
       ('iPhone 14 Pro Max', 'Điện thoại', 35000000, 15, 'Apple'),
       ('Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
       ('Tai nghe AirPods 3', 'Phụ kiện', 4500000, NULL, 'Apple');

SELECT * FROM Products;

--1. Chèn dữ liệu mới
INSERT INTO Products(name, category, price, stock, manufacturer)
VALUES ('Chuột không dây Logitech M170','Phụ kiện',300000,20,'Logitech');

--2. Cập nhật dữ liệu
UPDATE Products
SET price = price *1.1
WHERE manufacturer = 'Apple';

--3. Xóa dữ liệu
DELETE FROM Products
WHERE stock = 0;

--4. Lọc theo điều kiện
SELECT name,category,price,stock,manufacturer
FROM Products
WHERE price BETWEEN 1000000 AND 30000000;

 --5. Lọc giá trị null
 SELECT name,category,price,stock,manufacturer
 FROM Products
 WHERE stock ISNULL ;

--6. Loại bỏ trùng
SELECT DISTINCT manufacturer
FROM Products;

--7. Sắp xếp dữ liệu
SELECT name,category,price,stock,manufacturer
FROM Products
ORDER BY price DESC, name ASC ;

--8. Tìm kiếm
SELECT name,category,price,stock,manufacturer
FROM Products
WHERE name ILIKE '%laptop%';

--9. Giới hạn kết quả
SELECT name,category,price,stock,manufacturer
FROM Products
ORDER BY price DESC
LIMIT 2;