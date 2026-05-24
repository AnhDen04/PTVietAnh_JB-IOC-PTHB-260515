/*
Tạo schema
  */
CREATE SCHEMA elearning;
/* Tạo bảng Students */
create table elearning.Students (
  student_id serial primary key,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  email varchar(255) not null unique
);

/* Tạo bảng Instructor */
CREATE TABLE elearning.Instructors (
    instructor_id serial primary key,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(255) not null unique
);

/* Tạo bảng Courses */
CREATE TABLE elearning.Courses (
    course_id serial primary key,
    course_name varchar(100) not null,
    instructor_id bigint REFERENCES elearning.Instructors(instructor_id)
);

/* Tạo bảng Enrollments */
CREATE TABLE elearning.Enrollments (
    enrollment_id serial primary key,
    student_id bigint REFERENCES elearning.Students(student_id),
    course_id bigint REFERENCES elearning.Courses(course_id),
    enroll_date timestamp not null default now()
);

/* Tạo bảng Assignments */
CREATE TABLE elearning.Assignments (
    assignment_id serial primary key,
    course_id bigint REFERENCES elearning.Courses(course_id),
    title varchar(100) not null,
    due_date date not null
);

/* Tạo bảng Submissions */
CREATE TABLE elearning.Submissions (
    submission_id serial primary key,
    assignment_id bigint REFERENCES elearning.Assignments(assignment_id),
    student_id bigint REFERENCES elearning.Students(student_id),
    submission_date date not null,
    grade NUMERIC(5,2) CHECK ( grade >= 0 AND grade <= 100)
);