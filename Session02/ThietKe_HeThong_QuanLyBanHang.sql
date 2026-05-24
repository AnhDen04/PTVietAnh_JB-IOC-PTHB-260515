/*
Tạo schema
  */
CREATE SCHEMA sales;
/* Tạo bảng Customers */
create table sales.Customers (
  customer_id serial primary key,
  first_name varchar(50) not null,
  last_name varchar(50) not null,
  email varchar(255) not null unique,
  phone varchar(20)
);

/* Tạo bảng Products */
CREATE TABLE sales.Products (
    product_id serial primary key,
    product_name varchar(100) not null,
    price numeric(10,2) not null,
    stock_quantity int not null
);

/* Tạo bảng Oders */
CREATE TABLE sales.Oders (
    order_id serial primary key,
    customer_id bigint REFERENCES sales.Customers(customer_id),
    order_date timestamp not null default now()
);

/* Tạo bẳng OderItems */
CREATE TABLE sales.OrderItems(
  oder_item_id serial primary key,
  oder_id bigint REFERENCES sales.Oders(order_id),
  product_id bigint REFERENCES sales.Products(product_id),
  quantity int not null check ( quantity > 0 )
);