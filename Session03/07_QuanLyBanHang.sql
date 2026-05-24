/* Tạo schema */
CREATE SCHEMA sales;

/* Tạo bảng Products */
CREATE TABLE sales.Products (
    product_id serial primary key,
    product_name varchar(255) not null,
    price numeric(10,2) not null,
    stock_quantity int not null
);

/* Tạo bảng Orders */
CREATE TABLE sales.Orders (
    order_id serial primary key,
    order_date date default current_date,
    member_id integer REFERENCES library.members(member_id)
);

/* Tạo bảng OrderDetails */
CREATE TABLE sales.OrderDetails (
    order_detail_id serial primary key,
    order_id integer REFERENCES sales.Orders(order_id),
    product_id integer REFERENCES sales.Products(product_id),
    quantity integer not null
);