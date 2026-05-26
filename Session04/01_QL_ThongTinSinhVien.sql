CREATE TABLE Students (
    id serial primary key,
    name varchar(50),
    age int,
    major varchar(50),
    gpa decimal(3,2)
);

INSERT INTO Students(name, age, major, gpa)
VALUES ('An',20,'CNTT',3.5),
       ('Bình',21,'Toán',3.2),
       ('Cường',22,'CNTT',3.8),
       ('Dương',20,'Vật lý',3.0),
       ('Em',21,'CNTT',2.9);

SELECT * FROM Students;

--1. Thêm sinh viên mới
INSERT INTO Students(name, age, major, gpa)
VALUES ('Hùng',23,'Hóa học',3.4);

--2. Cập nhật GPA của sinh viên
UPDATE Students
SET gpa = 3.6
WHERE name = 'Bình';

--3. Xóa sinh viên GPA thấp hơn 3.0
DELETE  FROM Students
WHERE gpa < 3.0;

--4. Liệt kê tất cả sinh viên, chỉ hiển thị tên và chuyên ngành, sắp xếp theo GPA giảm dần
SELECT name,major
FROM Students
ORDER BY gpa desc;

--5. Liệt kê tên sinh viên đầu tiên tìm thấy có chuyên ngành "CNTT"
SELECT name,age, major, gpa
FROM Students
WHERE major = 'CNTT'
LIMIT 1;

--6. Liệt kê sinh viên có GPA từ 3.0 đến 3.6
SELECT name,age,major,gpa
FROM Students
WHERE gpa BETWEEN 3.0 AND 3.6;

--7. Liệt kê sinh viên có tên bắt đầu bằng chữ 'C'
SELECT name
FROM Students
WHERE name ILIKE 'c%';

--8. Hiển thị 3 sinh viên đầu tiên theo thứ tự tên tăng dần, hoặc lấy từ sinh viên thứ 2 đến thứ 4 bằng LIMIT và OFFSET
SELECT name,age,major,gpa
FROM Students
LIMIT 3 OFFSET 1