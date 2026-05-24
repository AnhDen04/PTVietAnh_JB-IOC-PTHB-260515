/* Tạo bảng Students */
CREATE TABLE Students (
    student_id serial primary key,
    name varchar(150) not null,
    dob date
);

/* Tạo bảng Courses */
CREATE TABLE Courses (
    course_id serial primary key,
    course_name varchar(255) not null,
    credits int
);

/* Tạo bảng Enrollments */
CREATE TABLE Enrollments (
    enrollment_id serial primary key,
    student_id int REFERENCES Students(student_id),
    course_id int REFERENCES Courses(course_id),
    grade varchar(1) check ( grade IN ('A','B','C','D','F'))
);