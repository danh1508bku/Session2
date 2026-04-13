CREATE TABLE Books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author VARCHAR(50) NOT NULL,
    published_year INT,
    price DECIMAL(10,2)
);


-- 1. Xem tất cả database
\l

-- 2. Xem tất cả schema
\dn

-- 3. Xem danh sách bảng trong schema
\dt library.*

-- 4. Xem cấu trúc bảng Books
\d library.books
