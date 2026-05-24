/*
Tạo schema
  */
CREATE SCHEMA hotel;
/* Tạo bảng Students */
CREATE TABLE hotel.RoomTypes (
  room_type_id serial primary key,
  type_name varchar(50) not null unique,
  price_per_night numeric(10,2) CHECK ( price_per_night > 0 ),
  max_capacity int check ( max_capacity > 0 )
);

/* Tạo bảng Rooms */
CREATE TABLE hotel.Rooms (
    room_id serial primary key,
    room_number varchar(10) not null unique ,
    room_type_id int REFERENCES hotel.RoomTypes(room_type_id),
    status varchar(20) CHECK ( status IN ('Available', 'Occupied', 'Maintenance'))
);

/* Tạo bảng Customers */
CREATE TABLE hotel.Customers (
    customer_id serial primary key,
    full_name varchar(100) not null,
    email varchar(100) not null unique,
    phone varchar(15) not null
);

/* Tạo bảng Bookings */
CREATE TABLE hotel.Bookings (
    booking_id serial primary key,
    customer_id int REFERENCES hotel.Customers(customer_id),
    room_id int REFERENCES hotel.Rooms(room_id),
    check_in date not null ,
    check_out date not null ,
    status varchar(20) check ( status in ('Pending','Confirmed','Cancelled'))
);

/* Tạo bảng Payments */
CREATE TABLE hotel.Payments (
    payment_id serial primary key,
    booking_id int REFERENCES hotel.Bookings(booking_id),
    amount numeric(10,2) check ( amount >= 0 ),
    payment_date date not null,
    method varchar(20) check ( method in ('Credit Card', 'Cash', 'Bank Transfer') )
);
