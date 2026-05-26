--Tạo Bảng
CREATE TABLE Employees (
    id serial primary key,
    full_name varchar(100) not null ,
    department varchar(10),
    position varchar(100),
    salary numeric(15,2),
    bonus numeric(15,2),
    join_year int
);
-- Thêm dữ liệu
INSERT INTO Employees(full_name, department, position, salary, bonus, join_year)
VALUES ('Nguyễn Văn Huy','IT','Developer',18000000,1000000,2021),
       ('Trần Thị Mai', 'HR', 'Recruiter', 12000000, NULL, 2020),
       ('Lê Quốc Trung', 'IT', 'Tester', 15000000, 800000, 2023),
       ('Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
       ('Phạm Ngọc Hân', 'Finance', 'Accountant', 14000000, NULL, 2019),
       ('Bùi Thị Lan', 'HR', 'HR Manager', 20000000, 3000000, 2018),
       ('Đặng Hữu Tài', 'IT', 'Developer', 17000000, NULL, 2022);

--1. Chuẩn hóa dữ liệu
DELETE FROM Employees
WHERE id NOT IN  (
    SELECT min(id)
    FROM Employees
    GROUP BY full_name,department,position
    );

SELECT * FROM Employees;

--2. Cập nhật lương thưởng
UPDATE Employees
SET salary = salary *1.1
WHERE department = 'IT' AND salary < 18000000;

--Cập nhật bonus
UPDATE Employees
SET bonus = 500000
WHERE bonus isnull ;

 --3. Hiển thị danh sách nhân viên thuộc phòng IT hoặc HR, gia nhập sau năm 2020, và có tổng thu nhập (salary + bonus) lớn hơn 15,000,000
SELECT full_name,department,position,salary,bonus,join_year, (salary + bonus) AS total_income
FROM Employees
WHERE (department = 'IT' OR department = 'HR')
       AND join_year > 2020
       AND (salary + bonus) > 15000000
ORDER BY total_income DESC
LIMIT 3;

--4. Truy vấn theo tên
SELECT full_name,department,position,salary,bonus,join_year
FROM Employees
WHERE full_name LIKE 'Nguyễn%' OR full_name LIKE '%Hân';

--5. Truy vấn đặc biệt
SELECT DISTINCT department
FROM Employees
WHERE bonus IS NOT NULL;

--6. Khoảng thời gian làm việc
SELECT full_name,department,position,salary,bonus,join_year
FROM Employees
WHERE join_year BETWEEN 2019 AND 2022;
