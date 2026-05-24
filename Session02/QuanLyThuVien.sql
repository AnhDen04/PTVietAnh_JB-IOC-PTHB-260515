/*
Tạo schema
  */
CREATE SCHEMA ThuVien;
/* Tạo bảng Users */
CREATE TABLE ThuVien.Member (
     member_id serial primary key,
     full_name varchar(150) not null ,
     email varchar(255) unique not null ,
     phone varchar(20),
     dob date,
     address text,
     is_active boolean default true,
     join_date date default current_date
);

/* Tạo bảng Categories */
CREATE TABLE ThuVien.Categories (
    category_id serial primary key,
    category_name varchar(100) not null unique,
    description text
);

/* Tạo bảng Authors */
CREATE TABLE ThuVien.Authors (
  author_id serial primary key,
  author_name varchar(100) not null,
  bio text
);
/* Tạo bảng Books */
CREATE TABLE ThuVien.Books (
  book_id serial primary key,
  isbn varchar(100) not null unique,
    title varchar(255) not null,
    publish_year int,
    publisher varchar(150),
    total_copies int not null check ( total_copies > 0 ),
    available_copies int not null check ( available_copies >= 0 and available_copies <= total_copies),
    category_id int REFERENCES ThuVien.Categories(category_id)
);

/* Tạo bảng Book_Authors */
CREATE TABLE ThuVien.Book_Authors (
    book_id int REFERENCES ThuVien.Books(book_id),
    author_id int REFERENCES ThuVien.Authors(author_id),
    primary key (book_id, author_id)
);

/* Tạo bảng BorrowTickets */
CREATE TABLE ThuVien.BorrowTickets (
    ticket_id serial primary key,
    member_id int REFERENCES ThuVien.Member(member_id),
    borrow_date date not null default current_date,
    due_date date not null,
    actual_return_date date,
    constraint check_date check( due_date >= borrow_date )
);

/* Tạo bảng BorrowDetails */
CREATE TABLE ThuVien.BorrowDetails (
    ticket_id int REFERENCES ThuVien.BorrowTickets(ticket_id),
    book_id int REFERENCES ThuVien.Books(book_id),
    primary key (ticket_id, book_id)
);

