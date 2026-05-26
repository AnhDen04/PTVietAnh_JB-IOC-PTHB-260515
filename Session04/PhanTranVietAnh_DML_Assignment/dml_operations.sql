--Cập nhật giá sản phẩm 'Electronics' tăng 10%
UPDATE ecomerce.Products
SET price = price *1.1
WHERE category =  'Electronics';

--Cập nhật SĐT có email cụ thể
UPDATE ecomerce.Customers
SET phone = '0989868686'
WHERE email = 'daonhi@gmail.com';

--Cập nhật trạng thái đơn hàng từ 'PENDING' sang 'CONFIRMED'
UPDATE ecomerce.Orders
SET status = 'CONFIRMED'
WHERE status = 'PENDING';

--Xóa dữ liệu

--Xóa trong bảng Order_Details trước
DELETE FROM ecomerce.Order_Details
WHERE product_id
          IN (SELECT product_id
              FROM ecomerce.Products
              WHERE stock_quantity = 0);

--Xóa trong bảng Products
DELETE FROM ecomerce.Products
WHERE stock_quantity = 0;

-- Xóa khách hàng chưa thực hiện bất kỳ đơn nào
DELETE FROM ecomerce.Customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM ecomerce.Orders
    );
