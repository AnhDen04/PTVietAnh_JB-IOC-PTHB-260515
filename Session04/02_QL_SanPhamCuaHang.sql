CREATE TABLE Products (
    id serial primary key,
    name varchar(50),
    category varchar(50),
    price decimal(10,2),
    stock int
);

INSERT INTO Products(name, category, price, stock)
VALUES ('Laptop Dell','Electronics',1500.00,5),
       ('Chuột Logitech', 'Electronics', 25.50, 50),
       ('Bàn phím Razer', 'Electronics', 120.00, 20),
       ('Tủ lạnh LG', 'Home Appliances', 800.00, 3),
       ('Máy giặt Samsung', 'Home Appliances', 600.00, 2);

--1. Thêm sản phẩm mới: 'Điều hòa Panasonic', category 'Home Appliances', giá 400.00, stock 10
INSERT INTO Products(name, category, price, stock)
VALUES ('Điều hòa Panasonic','Home Appliances',400.00,10);

SELECT * FROM Products;

--2. Cập nhật stock của 'Laptop Dell' thành 7
UPDATE Products
SET stock = 7
WHERE name = 'Laptop Dell';

--3. Xóa các sản phẩm có stock bằng 0 (nếu có)
DELETE FROM Products
WHERE stock = 0;

--4. Liệt kê tất cả sản phẩm theo giá tăng dần
SELECT name,category,price,stock
FROM Products
ORDER BY price;

--5. Liệt kê danh mục duy nhất của các sản phẩm (DISTINCT)
SELECT DISTINCT category
FROM Products;

--6. Liệt kê sản phẩm có giá từ 100 đến 1000
SELECT name,category,price,stock
FROM Products
WHERE price BETWEEN 100 AND 1000;

--7. Liệt kê các sản phẩm có tên chứa từ 'LG' hoặc 'Samsung'
SELECT name
FROM Products
WHERE name ILIKE '%LG%' OR name ILIKE '%SamSung%';

--8. Hiển thị 2 sản phẩm đầu tiên theo giá giảm dần, hoặc lấy sản phẩm thứ 2 đến thứ 3 bằng LIMIT và OFFSET
SELECT name,category,price,stock
FROM Products
ORDER BY price DESC
LIMIT 2;

SELECT name,category,price,stock
FROM Products
ORDER BY price DESC
LIMIT 2 OFFSET 1;