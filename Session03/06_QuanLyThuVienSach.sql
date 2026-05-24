/*
Tạo schema
  */
CREATE SCHEMA library;
/* Tạo bảng Books */
CREATE TABLE library.Books (
    book_id serial primary key,
    title varchar(255) not null,
    author varchar(150) not null,
    published_year int,
    available boolean default true
);

/* Tạo bảng Members */
CREATE TABLE library.Memebers (
    member_id serial primary key,
    name varchar(150) not null,
    email varchar(255) not null unique,
    join_date date default current_date
);