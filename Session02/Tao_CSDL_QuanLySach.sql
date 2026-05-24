/*
Tạo schema
  */
create SCHEMA  library
/* Tạo bảng */
create table library.Book (
  book_id serial primary key,
  title varchar(100) not null,
  author varchar(50) not null,
  published_year int,
  price numeric(10,2)
);

/* Thêm cột create.at */
ALTER TABLE library.Book ADD COLUMN create_at timestamp;

/* Xóa bảng */
DROP TABLE library.Book;