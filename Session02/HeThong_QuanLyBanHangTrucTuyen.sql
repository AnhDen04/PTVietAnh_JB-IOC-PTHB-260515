/*
Tạo schema
  */
CREATE SCHEMA shop;
/* Tạo bảng Users */
CREATE TABLE shop.Users (
    user_id  serial primary key,
    username varchar(50)  not null unique,
    email    varchar(100) not null unique,
    passwork varchar(100) not null,
    role     varchar(20) check ( role IN ('Customer', 'Admin'))
);

/* Tạo bảng Categories */
CREATE TABLE shop.Categories (
    category_id serial primary key,
    categori_name varchar(10) not null unique
);

/* Tạo bảng Products */
CREATE TABLE shop.Products (
    product_id serial primary key,
    product_name varchar(100) not null,
    price numeric(10,2) check ( price > 0 ),
    stock int check ( stock > 0 ),
    category_id int REFERENCES shop.Categories(category_id)
);

/* Tạo bảng Orders */
CREATE TABLE shop.Orders (
    order_id serial primary key,
    user_id int REFERENCES shop.Users(user_id),
    order_date date not null,
    status varchar(20) check ( status in ('Pending','Shipped','Delivered','Cancelled'))
);

/* Tạo bảng OrderDetails */
CREATE TABLE shop.OrderDetails (
    order_detal_id serial primary key,
    order_id int REFERENCES shop.Orders(order_id),
    product_id int REFERENCES shop.Products(product_id),
    quantity int check ( quantity > 0 ),
    price_each numeric(10,2) check ( price_each > 0 )
);

/* Tạo bảng Payments */
CREATE TABLE shop.Payments (
    paymen_id serial primary key,
    order_id int REFERENCES shop.Orders(order_id),
    amount numeric(10,2) check ( amount >= 0 ),
    payment_date date not null,
    method varchar(30) check ( method in ('Credit Card','Momo','Bank Transfer','Cash' ))
);
