/*
Tạo schema
  */
create SCHEMA  university
/* Tạo bảng Students */
create table university.Students (
  student_id serial primary key,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  birth_date date,
  email varchar(255) not null unique
);

/* Tạo bảng Courses */
CREATE TABLE university.Courses (
    course_id serial primary key,
    course_name varchar(100) not null,
    credits int
);

/* Tạo bảng phụ Enrollments */
CREATE TABLE university.Enrollments (
    enrollment_id serial primary key,
    student_id bigint REFERENCES university.Students(student_id),
    course_id bigint REFERENCES university.Courses(course_id),
    enroll_date date
);

/* Thêm ràng buộc kiểm tra tuổi >18 */
ALTER TABLE university.Students
ADD CONSTRAINT check_age
CHECK ( extract(year from current_date) - extract(year from Students.birth_date) > 18 );

/* Xóa bảng Erollments */
DROP TABLE university.Enrollments;

/* Xóa bẳng Students, Courses */
DROP TABLE university.Students;
DROP TABLE university.Courses;