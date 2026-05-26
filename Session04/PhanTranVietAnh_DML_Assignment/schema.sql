CREATE SCHEMA ecomerce;

--Tạo bảng Customers
CREATE TABLE ecomerce.Customers (
    customer_id serial primary key ,
    full_name varchar(150) not null ,
    email varchar(150) not null unique ,
    phone varchar(20),
    city varchar(150),
    join_date date
);

--Tạo bảng Products
CREATE TABLE ecomerce.Products (
    product_id serial primary key ,
    product_name varchar(150) not null ,
    category varchar(150),
    price numeric(15,2) check ( price >= 0 ),
    stock_quantity int check ( stock_quantity >= 0 )
);

--Tạo bảng Orders
CREATE TABLE ecomerce.Orders (
    order_id serial primary key ,
    customer_id int REFERENCES ecomerce.Customers(customer_id),
    order_date date default current_date,
    total_amount numeric(15,2),
    status varchar(20) check ( status IN ('PENDING','CONFIRMED','SHIPPED','CANCELLED') )
);

--Tạo bảng Order_details
CREATE TABLE ecomerce.Order_Details (
    order_detail_id serial primary key ,
    order_id int REFERENCES ecomerce.Orders(order_id),
    product_id int REFERENCES ecomerce.Products(product_id),
    quantity int check ( quantity > 0 ),
    unit_price numeric(15,2)
);