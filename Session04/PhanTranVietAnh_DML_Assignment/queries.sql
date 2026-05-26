--Phần 2   TRUY VẤN DỮ LIỆU

--1. Tìm khách hàng theo tên
SELECT full_name,email,phone,city,join_date
FROM ecomerce.Customers
WHERE full_name ILIKE 'Nguyễn%';

--2. Lọc sản phẩm theo khoảng giá
SELECT product_name,category,price,stock_quantity
FROM ecomerce.Products
WHERE price BETWEEN 500000 AND 2000000;

--3. Tìm khách hàng chưa có số điện thoại
SELECT full_name,email,phone,city,join_date
FROM ecomerce.Customers
WHERE phone isnull ;

--4. Top 5 sản phẩm có giá cao nhất
SELECT product_name, category,price,stock_quantity
FROM ecomerce.Products
ORDER BY price DESC
LIMIT 5;

--5. Phân trang danh sách đơn hàng
SELECT customer_id,order_date,total_amount,status
FROM ecomerce.Orders
ORDER BY  order_date DESC
LIMIT 5 OFFSET 5;

--6. Đếm số khách hàng theo thành phố
SELECT city, count(customer_id) AS total_customers
FROM ecomerce.Customers
GROUP BY city
ORDER BY total_customers DESC ;

--7. Tìm đơn hàng trong khoảng thời gian
SELECT order_id,customer_id,order_date,status
FROM ecomerce.Orders
WHERE order_date BETWEEN '2026-03-05' AND '2026-04-10';

--8. Sản phẩm chưa được bán
SELECT p.product_id,p.product_name,p.category
FROM ecomerce.Products p
WHERE NOT EXISTS(      --NOT EXISTS chạy kiểm tra từng dòng
    SELECT 1
    FROM ecomerce.Order_Details od
    WHERE od.product_id = p.product_id
);