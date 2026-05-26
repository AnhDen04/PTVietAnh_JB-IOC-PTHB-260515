--Tạo bảng
CREATE TABLE Books (
    id serial primary key,
    title varchar(255) not null ,
    author varchar(150),
    category varchar(150),
    publish_year int,
    price numeric(15,2),
    stock int
);

--Thêm dữ liệu
INSERT INTO Books(title, author, category, publish_year, price, stock)
VALUES ('Lập trình C cơ bản','Nguyễn Văn Nam','CNTT',2018,95000,20),
       ('Học SQL qua ví dụ','Trần Thị Hạnh','CSDL',2020,125000,12),
       ('Lập trình C cơ bản','Nguyễn Văn Nam','CNTT',2018,95000,20),
       ('Phân tích dữ liệu với Python','Lê Quốc Bảo','CNTT',2022,180000,null),
       ('Quản trị cơ sở dữ liệu', 'Nguyễn Thị Minh', 'CSDL', 2021, 150000, 5),
       ('Học máy cho người mới bắt đầu', 'Nguyễn Văn Nam', 'AI', 2023, 220000, 8),
       ('Khoa học dữ liệu cơ bản', 'Nguyễn Văn Nam', 'AI', 2023, 220000, NULL);

SELECT * FROM Books;

--1. Cập nhật giá
UPDATE Books
SET price = price * 1.1
WHERE price < 200000 AND publish_year >= 2021;

--2. Xử lý lỗi nhập
UPDATE Books
SET stock = 0
WHERE stock ISNULL;

--3. Truy vấn nâng cao
SELECT title,author,category,publish_year,price,stock
FROM Books
WHERE (category = 'CNTT' OR category = 'AI')
AND price BETWEEN 100000 AND 250000
ORDER BY price DESC, title ASC ;

--4. Tìm kiếm tự do
SELECT title,author,category,publish_year,price,stock
FROM Books
WHERE title ILIKE '%học%';

--5. Thống kê chuyên mục
SELECT DISTINCT category
FROM Books
WHERE publish_year > 2020;

--6. Phân trang kết quả
SELECT title,author,category,publish_year,price,stock
FROM Books
ORDER BY id ASC
LIMIT 2 OFFSET 1;

