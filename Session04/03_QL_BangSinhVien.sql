CREATE TABLE Students (
    id serial primary key,
    full_name varchar(50) not null ,
    gender varchar(20),
    birth_year int,
    major varchar(50),
    gpa decimal(3,2)
);

INSERT INTO Students(full_name, gender, birth_year, major, gpa)
VALUES ('Nguyễn Văn A','Nam',2002,'CNTT',3.6),
       ('Trần Thị Bích Ngọc', 'Nữ', 2001, 'Kinh tế', 3.2),
       ('Lê Quốc Cường', 'Nam', 2003, 'CNTT', 2.7),
       ('Phạm Minh Anh', 'Nữ', 2000, 'Luật', 3.9),
       ('Nguyễn Văn A', 'Nam', 2002, 'CNTT', 3.6),
       ('Lưu Đức Tài', 'Nam', 2004, 'Cơ khí', NULL),
       ('Võ Thị Thu Hằng', 'Nữ', 2001, 'CNTT', 3.0);

SELECT * FROM Students;

--1 Thêm sinh viên
INSERT INTO Students(full_name, gender, birth_year, major, gpa)
VALUES ('Phan Hoàng Nam','Nam',2003,'CNTT',3.8);

--2. Cập nhật dữ liệu
UPDATE Students
SET gpa = 3.4
WHERE full_name = 'Lê Quốc Cường';

--3. Xóa dữ liệu
DELETE FROM Students
WHERE gpa isnull ;

--4. Truy vấn cơ bản
SELECT full_name,gender,birth_year,major,gpa
FROM Students
WHERE major = 'CNTT' AND gpa >= 3.0
LIMIT 3;

--5. Loại bỏ trùng lặp
SELECT DISTINCT major
FROM Students;

--6. Sắp xếp Hiển thị sinh viên ngành CNTT, sắp xếp giảm dần theo GPA, sau đó tăng dần theo tên
SELECT full_name,major,gpa
FROM Students
ORDER BY gpa DESC, full_name ASC ;

--7. Tìm kiếm sinh viên có tên bắt đầu bằng “Nguyễn”
SELECT full_name
FROM Students
WHERE full_name LIKE 'Nguyễn%';

--8. Khoảng giá trị: Hiển thị sinh viên có năm sinh từ 2001 đến 2003
SELECT full_name,birth_year
FROM Students
WHERE birth_year BETWEEN 2001 AND 2003;