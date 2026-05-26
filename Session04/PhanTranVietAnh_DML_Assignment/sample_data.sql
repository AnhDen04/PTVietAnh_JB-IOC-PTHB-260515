-- Thêm dữ lệu
INSERT INTO ecomerce.Customers(full_name, email, phone, city, join_date)
VALUES ('Nguyễn Văn An','nguyenvanan@gmail.com','0901111111','Hà Nội','2026-03-14'),
       ('Đào Thúy Nhi','daonhi@gmail.com','0902222222','Hà Tĩnh','2026-02-05'),
       ('Lê Hoàng Cường', 'cuongle@email.com', NULL, 'Đà Nẵng', '2026-03-10'),
       ('Phạm Diệu Dung', 'dungpham@email.com', '0904444444', 'Hà Nội', '2026-04-05'),
       ('Vũ Đức Em', 'emvu@email.com', '0905555555', 'Hải Phòng', '2026-05-12'),
       ('Ngô Thị Thủy', 'thuyngo@email.com', '0906666666', 'Cần Thơ', '2026-01-18'),
       ('Đặng Hữu Tài', 'danghuutai@email.com', NULL, 'Hà Nội', '2026-02-22'),
       ('Bùi Văn Hùng', 'hungbui@email.com', '0908888888', 'TP.HCM', '2026-04-30'),
       ('Nguyễn Công Bảo', 'nguyencongbao@email.com', '0909999999', 'Đà Nẵng', '2026-02-14'),
       ('Khách Hàng Ảo', 'khachhangao@email.com', '0910000000', 'Huế', '2026-03-01');

SELECT * FROM ecomerce.Customers;

INSERT INTO ecomerce.Products(product_name, category, price, stock_quantity)
VALUES ('Laptop Dell XPS','Electronics',30000000,10),
       ('Chuột Logitech','Electronics',500000,50),
       ('Bàn phím cơ','Electronics',1500000,20),
       ('Tai nghe Sony','Electronics',2000000,0),
       ('Màn hình LG','Electronics',4000000,15),
       ('Áo thun Nam', 'Clothing', 200000, 100),
       ('Quần Jean Nữ', 'Clothing', 350000, 80),
       ('Giày Thể Thao', 'Clothing', 800000, 40),
       ('Áo khoác gió', 'Clothing', 500000, 60),
       ('Mũ lưỡi trai', 'Clothing', 100000, 0),
       ('Sách SQL Cơ Bản', 'Books', 150000, 30),
       ('Sách Python', 'Books', 200000, 25),
       ('Tiểu thuyết A', 'Books', 120000, 40),
       ('Truyện tranh B', 'Books', 50000, 100),
       ('Sách Tương Lai', 'Books', 300000, 50);

SELECT * FROM ecomerce.Products;

INSERT INTO ecomerce.Orders(customer_id,order_date, total_amount, status)
VALUES (11, '2026-03-20', 30600000, 'CONFIRMED'),
       (12, '2026-02-15', 600000, 'PENDING'),
       (13, '2026-03-15', 2300000, 'SHIPPED'),
       (14, '2026-04-10', 2100000, 'CANCELLED'),
       (15, '2026-05-20', 4000000, 'PENDING'),
       (16, '2026-02-10', 1300000, 'SHIPPED'),
       (17, '2026-03-05', 150000, 'CONFIRMED'),
       (18, '2026-05-05', 120000, 'PENDING');

SELECT * FROM ecomerce.Orders;

INSERT INTO ecomerce.Order_Details(order_id, product_id, quantity, unit_price)
VALUES (9, 1, 1, 30000000),
       (9, 2, 1, 500000),
       (9, 14, 2, 50000),
       (10, 6, 1, 200000),
       (10, 7, 1, 350000),
       (10, 14, 1, 50000),
       (11, 3, 1, 1500000),
       (11, 8, 1, 800000),
       (12, 4, 1, 2000000),
       (12, 10, 1, 100000),
       (13, 5, 1, 4000000),
       (14, 8, 1, 800000),
       (14, 9, 1, 500000),
       (15, 11, 1, 150000),
       (16, 13, 1, 120000);

SELECT * FROM ecomerce.Order_Details;