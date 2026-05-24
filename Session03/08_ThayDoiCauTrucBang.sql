/* Thêm cột genre vào bảng Books */
ALTER TABLE library.Books ADD COLUMN genre varchar(100);

/* Đổi tên cột avaiable */
ALTER TABLE library.Books RENAME COLUMN available TO is_available;

/* Xóa cột email khỏi bảng Members */
ALTER TABLE library.Members DROP COLUMN email;

/* Xóa bảng OrderDetails */
DROP TABLE sales.OrderDetails;