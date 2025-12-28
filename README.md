# TÀI LIỆU ÔN TẬP MYSQL TOÀN DIỆN

## MỤC LỤC
1. [Giới thiệu MySQL](#giới-thiệu-mysql)
2. [Cài đặt và Cấu hình](#cài-đặt-và-cấu-hình)
3. [Cú pháp SQL cơ bản](#cú-pháp-sql-cơ-bản)
4. [Câu lệnh SELECT](#câu-lệnh-select)
5. [Mệnh đề WHERE](#mệnh-đề-where)
6. [Toán tử](#toán-tử)
7. [ORDER BY](#order-by)
8. [INSERT INTO](#insert-into)
9. [NULL Values](#null-values)
10. [UPDATE](#update)
11. [DELETE](#delete)
12. [LIMIT](#limit)
13. [MIN và MAX](#min-và-max)
14. [COUNT, AVG, SUM](#count-avg-sum)
15. [LIKE](#like)
16. [Wildcards](#wildcards)
17. [IN](#in)
18. [BETWEEN](#between)
19. [Aliases](#aliases)
20. [JOINS](#joins)
21. [UNION](#union)
22. [GROUP BY](#group-by)
23. [HAVING](#having)
24. [EXISTS](#exists)
25. [ANY và ALL](#any-và-all)
26. [INSERT SELECT](#insert-select)
27. [CASE](#case)
28. [NULL Functions](#null-functions)
29. [Comments](#comments)
30. [Databases](#databases)
31. [Tables](#tables)
32. [Data Types](#data-types)
33. [Constraints](#constraints)
34. [NOT NULL](#not-null)
35. [UNIQUE](#unique)
36. [PRIMARY KEY](#primary-key)
37. [FOREIGN KEY](#foreign-key)
38. [CHECK](#check)
39. [DEFAULT](#default)
40. [CREATE INDEX](#create-index)
41. [AUTO INCREMENT](#auto-increment)
42. [Dates](#dates)
43. [Views](#views)
44. [String Functions](#string-functions)
45. [Numeric Functions](#numeric-functions)
46. [Date Functions](#date-functions)

---

## GIỚI THIỆU MYSQL

### MySQL là gì?
- **MySQL** là hệ quản trị cơ sở dữ liệu quan hệ (RDBMS) mã nguồn mở
- Sử dụng **SQL** (Structured Query Language) để quản lý dữ liệu
- Phổ biến cho các ứng dụng web
- Là một phần của stack LAMP (Linux, Apache, MySQL, PHP/Python/Perl)

### Đặc điểm nổi bật:
- ✓ Mã nguồn mở và miễn phí
- ✓ Hiệu suất cao
- ✓ Đáng tin cậy
- ✓ Dễ sử dụng
- ✓ Hỗ trợ đa nền tảng

---

## CÀI ĐẶT VÀ CẤU HÌNH

### Kết nối MySQL
```bash
mysql -u username -p
```

### Hiển thị phiên bản
```sql
SELECT VERSION();
```

---

## CÚ PHÁP SQL CƠ BẢN

### Các loại câu lệnh SQL:
1. **DDL** (Data Definition Language): CREATE, ALTER, DROP
2. **DML** (Data Manipulation Language): SELECT, INSERT, UPDATE, DELETE
3. **DCL** (Data Control Language): GRANT, REVOKE
4. **TCL** (Transaction Control Language): COMMIT, ROLLBACK

### Lưu ý quan trọng:
- SQL **không phân biệt chữ hoa/thường** (nhưng nên viết hoa keywords)
- Mỗi câu lệnh kết thúc bằng dấu **;**
- Tên bảng/cột có khoảng trắng cần dùng backticks: \`tên bảng\`

---

## CÂU LỆNH SELECT

### Cú pháp cơ bản:
```sql
SELECT column1, column2 FROM table_name;
```

### SELECT tất cả cột:
```sql
SELECT * FROM customers;
```

### SELECT DISTINCT (loại bỏ trùng lặp):
```sql
SELECT DISTINCT country FROM customers;
```

### Đếm số giá trị khác nhau:
```sql
SELECT COUNT(DISTINCT country) FROM customers;
```

---

## MỆNH ĐỀ WHERE

### Cú pháp:
```sql
SELECT * FROM customers
WHERE country = 'Vietnam';
```

### Ví dụ với số:
```sql
SELECT * FROM products
WHERE price > 50;
```

### Ví dụ với chuỗi (phải có dấu ngoặc đơn):
```sql
SELECT * FROM customers
WHERE city = 'Hanoi';
```

---

## TOÁN TỬ

### Toán tử so sánh:
| Toán tử | Ý nghĩa |
|---------|---------|
| = | Bằng |
| <> hoặc != | Khác |
| > | Lớn hơn |
| < | Nhỏ hơn |
| >= | Lớn hơn hoặc bằng |
| <= | Nhỏ hơn hoặc bằng |

### Toán tử logic:
- **AND**: Tất cả điều kiện phải đúng
```sql
SELECT * FROM customers
WHERE country = 'Vietnam' AND city = 'Hanoi';
```

- **OR**: Ít nhất một điều kiện đúng
```sql
SELECT * FROM customers
WHERE city = 'Hanoi' OR city = 'HCM';
```

- **NOT**: Phủ định điều kiện
```sql
SELECT * FROM customers
WHERE NOT country = 'Vietnam';
```

### Kết hợp toán tử:
```sql
SELECT * FROM customers
WHERE country = 'Vietnam' AND (city = 'Hanoi' OR city = 'HCM');
```

---

## ORDER BY

### Sắp xếp tăng dần (mặc định):
```sql
SELECT * FROM customers
ORDER BY country;
```

### Sắp xếp giảm dần:
```sql
SELECT * FROM customers
ORDER BY country DESC;
```

### Sắp xếp nhiều cột:
```sql
SELECT * FROM customers
ORDER BY country ASC, customer_name DESC;
```

---

## INSERT INTO

### Cú pháp đầy đủ:
```sql
INSERT INTO customers (customer_name, contact_name, city, country)
VALUES ('Nguyen Van A', 'A Nguyen', 'Hanoi', 'Vietnam');
```

### Insert tất cả cột:
```sql
INSERT INTO customers
VALUES (1, 'Nguyen Van A', 'A Nguyen', 'Hanoi', 'Vietnam');
```

### Insert nhiều dòng:
```sql
INSERT INTO customers (customer_name, city, country)
VALUES 
  ('Nguyen Van A', 'Hanoi', 'Vietnam'),
  ('Tran Thi B', 'HCM', 'Vietnam'),
  ('Le Van C', 'Da Nang', 'Vietnam');
```

---

## NULL VALUES

### Kiểm tra NULL:
```sql
SELECT * FROM customers
WHERE address IS NULL;
```

### Kiểm tra NOT NULL:
```sql
SELECT * FROM customers
WHERE address IS NOT NULL;
```

**Lưu ý:** Không thể dùng `= NULL` hoặc `!= NULL`

---

## UPDATE

### Cú pháp:
```sql
UPDATE customers
SET contact_name = 'Nguyen Van B', city = 'Hanoi'
WHERE customer_id = 1;
```

### Update tất cả dòng (NGUY HIỂM - cẩn thận!):
```sql
UPDATE customers
SET country = 'Vietnam';
```

**⚠️ CẢNH BÁO:** Luôn dùng WHERE khi UPDATE để tránh cập nhật tất cả dòng!

---

## DELETE

### Xóa dòng cụ thể:
```sql
DELETE FROM customers
WHERE customer_name = 'Nguyen Van A';
```

### Xóa tất cả dòng (NGUY HIỂM!):
```sql
DELETE FROM customers;
```

**⚠️ CẢNH BÁO:** Luôn dùng WHERE khi DELETE!

---

## LIMIT

### Giới hạn số dòng kết quả:
```sql
SELECT * FROM customers
LIMIT 10;
```

### Với OFFSET (bỏ qua n dòng đầu):
```sql
SELECT * FROM customers
LIMIT 5 OFFSET 10;
```

### Cú pháp ngắn gọn:
```sql
SELECT * FROM customers
LIMIT 10, 5;  -- Bỏ qua 10 dòng, lấy 5 dòng tiếp theo
```

---

## MIN VÀ MAX

### Tìm giá trị nhỏ nhất:
```sql
SELECT MIN(price) AS smallest_price
FROM products;
```

### Tìm giá trị lớn nhất:
```sql
SELECT MAX(price) AS largest_price
FROM products;
```

### Kết hợp với WHERE:
```sql
SELECT MIN(price) AS min_price
FROM products
WHERE category_id = 1;
```

---

## COUNT, AVG, SUM

### COUNT - Đếm số dòng:
```sql
SELECT COUNT(*) FROM customers;
```

### COUNT DISTINCT:
```sql
SELECT COUNT(DISTINCT country) FROM customers;
```

### AVG - Giá trị trung bình:
```sql
SELECT AVG(price) FROM products;
```

### SUM - Tổng:
```sql
SELECT SUM(quantity) FROM order_details;
```

### Kết hợp nhiều hàm:
```sql
SELECT 
  COUNT(*) AS total_products,
  AVG(price) AS average_price,
  MIN(price) AS min_price,
  MAX(price) AS max_price
FROM products;
```

---

## LIKE

### Tìm kiếm mẫu chuỗi:
```sql
SELECT * FROM customers
WHERE customer_name LIKE 'Nguyen%';
```

### Các ký tự đại diện:
- **%** : Đại diện cho 0 hoặc nhiều ký tự
- **_** : Đại diện cho đúng 1 ký tự

### Ví dụ:
```sql
-- Bắt đầu bằng 'a'
SELECT * FROM customers WHERE customer_name LIKE 'a%';

-- Kết thúc bằng 'a'
SELECT * FROM customers WHERE customer_name LIKE '%a';

-- Chứa 'or'
SELECT * FROM customers WHERE customer_name LIKE '%or%';

-- Ký tự thứ 2 là 'a'
SELECT * FROM customers WHERE customer_name LIKE '_a%';

-- Bắt đầu bằng 'a' và ít nhất 3 ký tự
SELECT * FROM customers WHERE customer_name LIKE 'a__%';

-- Bắt đầu bằng 'a' và kết thúc bằng 'o'
SELECT * FROM customers WHERE customer_name LIKE 'a%o';
```

### NOT LIKE:
```sql
SELECT * FROM customers
WHERE customer_name NOT LIKE 'a%';
```

---

## WILDCARDS

### Bảng tóm tắt:
| Ký tự | Mô tả | Ví dụ |
|-------|-------|-------|
| % | 0 hoặc nhiều ký tự | bl% → black, blue, blob |
| _ | Đúng 1 ký tự | h_t → hot, hat, hit |
| [] | Bất kỳ ký tự trong ngoặc | h[oa]t → hot, hat |
| ^ | Ký tự KHÔNG có trong ngoặc | h[^oa]t → hit |
| - | Khoảng ký tự | c[a-c]t → cat, cbt, cct |

### Ví dụ nâng cao:
```sql
-- Bắt đầu bằng 'b', 's' hoặc 'p'
SELECT * FROM customers
WHERE city LIKE '[bsp]%';

-- Bắt đầu bằng 'a', 'b', 'c'
SELECT * FROM customers
WHERE city LIKE '[a-c]%';

-- KHÔNG bắt đầu bằng 'b', 's' hoặc 'p'
SELECT * FROM customers
WHERE city LIKE '[!bsp]%';
-- hoặc
WHERE city NOT LIKE '[bsp]%';
```

---

## IN

### Cú pháp:
```sql
SELECT * FROM customers
WHERE country IN ('Vietnam', 'Thailand', 'Singapore');
```

### NOT IN:
```sql
SELECT * FROM customers
WHERE country NOT IN ('Vietnam', 'Thailand');
```

### IN với subquery:
```sql
SELECT * FROM customers
WHERE customer_id IN (
  SELECT customer_id FROM orders WHERE order_date = '2023-01-01'
);
```

---

## BETWEEN

### Cú pháp:
```sql
SELECT * FROM products
WHERE price BETWEEN 10 AND 20;
```

### NOT BETWEEN:
```sql
SELECT * FROM products
WHERE price NOT BETWEEN 10 AND 20;
```

### BETWEEN với text:
```sql
SELECT * FROM products
WHERE product_name BETWEEN 'A' AND 'M';
```

### BETWEEN với ngày:
```sql
SELECT * FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';
```

---

## ALIASES

### Alias cho cột:
```sql
SELECT customer_id AS id, customer_name AS name
FROM customers;
```

### Alias với khoảng trắng:
```sql
SELECT customer_name AS 'Tên khách hàng'
FROM customers;
```

### Alias cho bảng:
```sql
SELECT c.customer_name, o.order_date
FROM customers AS c, orders AS o
WHERE c.customer_id = o.customer_id;
```

### Kết hợp cột với CONCAT:
```sql
SELECT CONCAT(customer_name, ', ', city) AS 'Customer Info'
FROM customers;
```

---

## JOINS

### INNER JOIN (hoặc JOIN):
Trả về các dòng có khớp ở cả 2 bảng.
```sql
SELECT orders.order_id, customers.customer_name
FROM orders
INNER JOIN customers ON orders.customer_id = customers.customer_id;
```

### LEFT JOIN (LEFT OUTER JOIN):
Trả về tất cả dòng từ bảng trái, và các dòng khớp từ bảng phải.
```sql
SELECT customers.customer_name, orders.order_id
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;
```

### RIGHT JOIN (RIGHT OUTER JOIN):
Trả về tất cả dòng từ bảng phải, và các dòng khớp từ bảng trái.
```sql
SELECT orders.order_id, employees.last_name
FROM orders
RIGHT JOIN employees ON orders.employee_id = employees.employee_id;
```

### CROSS JOIN:
Tích Đề-các (Cartesian Product) của 2 bảng.
```sql
SELECT customers.customer_name, products.product_name
FROM customers
CROSS JOIN products;
```

### SELF JOIN:
Join bảng với chính nó.
```sql
SELECT A.customer_name AS Customer1, B.customer_name AS Customer2, A.city
FROM customers A, customers B
WHERE A.customer_id <> B.customer_id
AND A.city = B.city
ORDER BY A.city;
```

---

## UNION

### Kết hợp kết quả từ nhiều SELECT:
```sql
SELECT city FROM customers
UNION
SELECT city FROM suppliers
ORDER BY city;
```

### UNION ALL (giữ trùng lặp):
```sql
SELECT city FROM customers
UNION ALL
SELECT city FROM suppliers
ORDER BY city;
```

### Điều kiện:
- Mỗi SELECT phải có cùng số cột
- Các cột phải có kiểu dữ liệu tương tự
- Các cột phải cùng thứ tự

### UNION với WHERE:
```sql
SELECT city, country FROM customers
WHERE country = 'Vietnam'
UNION
SELECT city, country FROM suppliers
WHERE country = 'Vietnam'
ORDER BY city;
```

---

## GROUP BY

### Nhóm dữ liệu:
```sql
SELECT country, COUNT(*) AS total
FROM customers
GROUP BY country;
```

### GROUP BY với nhiều cột:
```sql
SELECT country, city, COUNT(*) AS total
FROM customers
GROUP BY country, city;
```

### Kết hợp với JOIN:
```sql
SELECT shippers.shipper_name, COUNT(orders.order_id) AS num_orders
FROM orders
LEFT JOIN shippers ON orders.shipper_id = shippers.shipper_id
GROUP BY shipper_name;
```

---

## HAVING

### Lọc sau khi GROUP BY:
```sql
SELECT country, COUNT(*) AS total
FROM customers
GROUP BY country
HAVING COUNT(*) > 5;
```

### HAVING với WHERE:
```sql
SELECT country, COUNT(*) AS total
FROM customers
WHERE country IS NOT NULL
GROUP BY country
HAVING COUNT(*) > 5
ORDER BY COUNT(*) DESC;
```

**Lưu ý:** WHERE lọc TRƯỚC GROUP BY, HAVING lọc SAU GROUP BY.

---

## EXISTS

### Kiểm tra sự tồn tại:
```sql
SELECT supplier_name
FROM suppliers
WHERE EXISTS (
  SELECT product_name FROM products 
  WHERE products.supplier_id = suppliers.supplier_id 
  AND price < 20
);
```

### NOT EXISTS:
```sql
SELECT supplier_name
FROM suppliers
WHERE NOT EXISTS (
  SELECT product_name FROM products 
  WHERE products.supplier_id = suppliers.supplier_id 
  AND price < 20
);
```

---

## ANY VÀ ALL

### ANY (ít nhất một giá trị thỏa mãn):
```sql
SELECT product_name
FROM products
WHERE product_id = ANY (
  SELECT product_id FROM order_details 
  WHERE quantity = 10
);
```

### ALL (tất cả giá trị phải thỏa mãn):
```sql
SELECT product_name
FROM products
WHERE product_id = ALL (
  SELECT product_id FROM order_details 
  WHERE quantity = 10
);
```

---

## INSERT SELECT

### Sao chép dữ liệu từ bảng này sang bảng khác:
```sql
INSERT INTO customers (customer_name, city, country)
SELECT supplier_name, city, country 
FROM suppliers;
```

### Với điều kiện:
```sql
INSERT INTO customers (customer_name, city, country)
SELECT supplier_name, city, country 
FROM suppliers
WHERE country = 'Vietnam';
```

---

## CASE

### Cú pháp:
```sql
SELECT order_id, quantity,
CASE
  WHEN quantity > 30 THEN 'Nhiều'
  WHEN quantity = 30 THEN 'Vừa'
  ELSE 'Ít'
END AS QuantityText
FROM order_details;
```

### Sắp xếp theo CASE:
```sql
SELECT customer_name, city, country
FROM customers
ORDER BY
(CASE
  WHEN city IS NULL THEN country
  ELSE city
END);
```

---

## NULL FUNCTIONS

### IFNULL():
```sql
SELECT product_name, IFNULL(unit_price, 0) AS price
FROM products;
```

### COALESCE() (trả về giá trị đầu tiên không NULL):
```sql
SELECT product_name, COALESCE(unit_price, stock_price, 0) AS price
FROM products;
```

### IF():
```sql
SELECT product_name, IF(unit_price > 0, 'Có giá', 'Miễn phí') AS status
FROM products;
```

---

## COMMENTS

### Comment một dòng:
```sql
-- Đây là comment một dòng
SELECT * FROM customers;
```

```sql
# Đây cũng là comment một dòng (MySQL)
SELECT * FROM customers;
```

### Comment nhiều dòng:
```sql
/*
Đây là comment
nhiều dòng
*/
SELECT * FROM customers;
```

---

## DATABASES

### Tạo database:
```sql
CREATE DATABASE my_database;
```

### Xóa database:
```sql
DROP DATABASE my_database;
```

### Hiển thị tất cả databases:
```sql
SHOW DATABASES;
```

### Chọn database để sử dụng:
```sql
USE my_database;
```

### Tạo database nếu chưa tồn tại:
```sql
CREATE DATABASE IF NOT EXISTS my_database;
```

---

## TABLES

### Tạo bảng:
```sql
CREATE TABLE customers (
  customer_id INT PRIMARY KEY AUTO_INCREMENT,
  customer_name VARCHAR(100) NOT NULL,
  contact_name VARCHAR(100),
  city VARCHAR(50),
  country VARCHAR(50) DEFAULT 'Vietnam',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Xóa bảng:
```sql
DROP TABLE customers;
```

### Xóa bảng nếu tồn tại:
```sql
DROP TABLE IF EXISTS customers;
```

### Xóa dữ liệu trong bảng (giữ cấu trúc):
```sql
TRUNCATE TABLE customers;
```

### Thêm cột:
```sql
ALTER TABLE customers
ADD email VARCHAR(100);
```

### Xóa cột:
```sql
ALTER TABLE customers
DROP COLUMN email;
```

### Đổi tên cột:
```sql
ALTER TABLE customers
CHANGE COLUMN old_name new_name VARCHAR(100);
```

### Thay đổi kiểu dữ liệu cột:
```sql
ALTER TABLE customers
MODIFY COLUMN email VARCHAR(200);
```

### Hiển thị cấu trúc bảng:
```sql
DESCRIBE customers;
-- hoặc
SHOW COLUMNS FROM customers;
```

### Hiển thị tất cả bảng:
```sql
SHOW TABLES;
```

---

## DATA TYPES

### String Data Types:
| Kiểu | Mô tả | Kích thước |
|------|-------|-----------|
| CHAR(n) | Chuỗi cố định | 0-255 ký tự |
| VARCHAR(n) | Chuỗi biến đổi | 0-65,535 ký tự |
| TEXT | Chuỗi dài | Tối đa 65,535 ký tự |
| MEDIUMTEXT | Chuỗi rất dài | Tối đa 16,777,215 ký tự |
| LONGTEXT | Chuỗi cực dài | Tối đa 4,294,967,295 ký tự |
| BLOB | Binary Large Object | Tối đa 65,535 bytes |
| ENUM('x','y','z') | Chỉ chọn 1 trong danh sách | Tối đa 65,535 giá trị |
| SET('x','y','z') | Chọn 0 hoặc nhiều trong danh sách | Tối đa 64 giá trị |

### Numeric Data Types:
| Kiểu | Mô tả | Phạm vi |
|------|-------|---------|
| TINYINT | Số nguyên rất nhỏ | -128 đến 127 |
| SMALLINT | Số nguyên nhỏ | -32,768 đến 32,767 |
| MEDIUMINT | Số nguyên vừa | -8,388,608 đến 8,388,607 |
| INT | Số nguyên | -2,147,483,648 đến 2,147,483,647 |
| BIGINT | Số nguyên lớn | -9,223,372,036,854,775,808 đến 9,223,372,036,854,775,807 |
| FLOAT(p) | Số thực dấu phẩy động | 7 chữ số thập phân |
| DOUBLE(size,d) | Số thực độ chính xác kép | 15 chữ số thập phân |
| DECIMAL(size,d) | Số thập phân chính xác | Chính xác tuyệt đối |

### Date and Time Data Types:
| Kiểu | Mô tả | Format |
|------|-------|--------|
| DATE | Ngày | YYYY-MM-DD |
| DATETIME | Ngày và giờ | YYYY-MM-DD HH:MI:SS |
| TIMESTAMP | Dấu thời gian | YYYY-MM-DD HH:MI:SS |
| TIME | Thời gian | HH:MI:SS |
| YEAR | Năm | YYYY |

---

## CONSTRAINTS

### Các loại Constraints:
1. **NOT NULL** - Không cho phép NULL
2. **UNIQUE** - Giá trị phải duy nhất
3. **PRIMARY KEY** - NOT NULL + UNIQUE
4. **FOREIGN KEY** - Liên kết giữa các bảng
5. **CHECK** - Kiểm tra điều kiện
6. **DEFAULT** - Giá trị mặc định
7. **CREATE INDEX** - Tạo chỉ mục

---

## NOT NULL

### Khi tạo bảng:
```sql
CREATE TABLE persons (
  id INT NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  age INT
);
```

### Thêm sau:
```sql
ALTER TABLE persons
MODIFY age INT NOT NULL;
```

### Xóa NOT NULL:
```sql
ALTER TABLE persons
MODIFY age INT;
```

---

## UNIQUE

### Khi tạo bảng:
```sql
CREATE TABLE persons (
  id INT NOT NULL UNIQUE,
  last_name VARCHAR(50),
  first_name VARCHAR(50)
);
```

### Đặt tên cho constraint:
```sql
CREATE TABLE persons (
  id INT NOT NULL,
  last_name VARCHAR(50),
  first_name VARCHAR(50),
  CONSTRAINT UC_Person UNIQUE (id, last_name)
);
```

### Thêm sau:
```sql
ALTER TABLE persons
ADD UNIQUE (id);
```

### Xóa UNIQUE:
```sql
ALTER TABLE persons
DROP INDEX UC_Person;
```

---

## PRIMARY KEY

### Khi tạo bảng:
```sql
CREATE TABLE persons (
  id INT NOT NULL PRIMARY KEY,
  last_name VARCHAR(50),
  first_name VARCHAR(50)
);
```

### Primary key nhiều cột:
```sql
CREATE TABLE persons (
  id INT NOT NULL,
  last_name VARCHAR(50),
  CONSTRAINT PK_Person PRIMARY KEY (id, last_name)
);
```

### Thêm sau:
```sql
ALTER TABLE persons
ADD PRIMARY KEY (id);
```

### Xóa PRIMARY KEY:
```sql
ALTER TABLE persons
DROP PRIMARY KEY;
```

---

## FOREIGN KEY

### Khi tạo bảng:
```sql
CREATE TABLE orders (
  order_id INT NOT NULL PRIMARY KEY,
  order_number INT NOT NULL,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```

### Đặt tên cho constraint:
```sql
CREATE TABLE orders (
  order_id INT NOT NULL PRIMARY KEY,
  customer_id INT,
  CONSTRAINT FK_CustomerOrder 
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
```

### Thêm sau:
```sql
ALTER TABLE orders
ADD FOREIGN KEY (customer_id) REFERENCES customers(customer_id);
```

### Xóa FOREIGN KEY:
```sql
ALTER TABLE orders
DROP FOREIGN KEY FK_CustomerOrder;
```

### Với ON DELETE CASCADE:
```sql
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);
```

---

## CHECK

### Khi tạo bảng:
```sql
CREATE TABLE persons (
  id INT NOT NULL,
  age INT CHECK (age >= 18)
);
```

### Đặt tên cho constraint:
```sql
CREATE TABLE persons (
  id INT NOT NULL,
  age INT,
  city VARCHAR(50),
  CONSTRAINT CHK_Person CHECK (age >= 18 AND city = 'Hanoi')
);
```

### Thêm sau:
```sql
ALTER TABLE persons
ADD CHECK (age >= 18);
```

### Xóa CHECK:
```sql
ALTER TABLE persons
DROP CHECK CHK_Person;
```

---

## DEFAULT

### Khi tạo bảng:
```sql
CREATE TABLE orders (
  id INT NOT NULL,
  order_date DATE DEFAULT CURRENT_DATE,
  city VARCHAR(50) DEFAULT 'Hanoi'
);
```

### Với hàm:
```sql
CREATE TABLE orders (
  id INT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

### Thêm sau:
```sql
ALTER TABLE orders
ALTER city SET DEFAULT 'Hanoi';
```

### Xóa DEFAULT:
```sql
ALTER TABLE orders
ALTER city DROP DEFAULT;
```

---

## CREATE INDEX

### Tạo index:
```sql
CREATE INDEX idx_lastname
ON persons (last_name);
```

### Tạo index nhiều cột:
```sql
CREATE INDEX idx_name
ON persons (last_name, first_name);
```

### Tạo UNIQUE index:
```sql
CREATE UNIQUE INDEX idx_email
ON persons (email);
```

### Xóa index:
```sql
ALTER TABLE persons
DROP INDEX idx_lastname;
```

### Hiển thị indexes:
```sql
SHOW INDEX FROM persons;
```

---

## AUTO INCREMENT

### Cú pháp:
```sql
CREATE TABLE persons (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50),
  PRIMARY KEY (id)
);
```

### Bắt đầu từ giá trị khác:
```sql
CREATE TABLE persons (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50),
  PRIMARY KEY (id)
) AUTO_INCREMENT = 100;
```

### Thêm sau:
```sql
ALTER TABLE persons AUTO_INCREMENT = 100;
```

---

## DATES

### Các kiểu dữ liệu ngày:
- **DATE**: YYYY-MM-DD
- **DATETIME**: YYYY-MM-DD HH:MI:SS
- **TIMESTAMP**: YYYY-MM-DD HH:MI:SS
- **YEAR**: YYYY hoặc YY

### Truy vấn với ngày:
```sql
SELECT * FROM orders
WHERE order_date = '2023-12-01';
```

### So sánh ngày:
```sql
SELECT * FROM orders
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31';
```

### Ngày hiện tại:
```sql
SELECT NOW();           -- Ngày và giờ hiện tại
SELECT CURDATE();       -- Ngày hiện tại
SELECT CURTIME();       -- Giờ hiện tại
```

---

## VIEWS

### Tạo view:
```sql
CREATE VIEW customer_orders AS
SELECT customers.customer_name, orders.order_id, orders.order_date
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id;
```

### Sử dụng view:
```sql
SELECT * FROM customer_orders;
```

### Cập nhật view:
```sql
CREATE OR REPLACE VIEW customer_orders AS
SELECT customers.customer_name, orders.order_id, orders.order_date, orders.amount
FROM customers
INNER JOIN orders ON customers.customer_id = orders.customer_id;
```

### Xóa view:
```sql
DROP VIEW customer_orders;
```

---

## STRING FUNCTIONS

### ASCII() - Mã ASCII của ký tự đầu:
```sql
SELECT ASCII('A');  -- 65
```

### CHAR_LENGTH() - Độ dài chuỗi:
```sql
SELECT CHAR_LENGTH('Hello');  -- 5
```

### CONCAT() - Nối chuỗi:
```sql
SELECT CONCAT('Hello', ' ', 'World');  -- Hello World
```

### CONCAT_WS() - Nối chuỗi với separator:
```sql
SELECT CONCAT_WS('-', '2023', '12', '01');  -- 2023-12-01
```

### LOWER() - Chuyển thành chữ thường:
```sql
SELECT LOWER('HELLO');  -- hello
```

### UPPER() - Chuyển thành chữ HOA:
```sql
SELECT UPPER('hello');  -- HELLO
```

### SUBSTRING() - Lấy chuỗi con:
```sql
SELECT SUBSTRING('Hello World', 1, 5);  -- Hello
```

### TRIM() - Xóa khoảng trắng đầu/cuối:
```sql
SELECT TRIM('  Hello  ');  -- Hello
```

### LTRIM() - Xóa khoảng trắng bên trái:
```sql
SELECT LTRIM('  Hello');  -- Hello
```

### RTRIM() - Xóa khoảng trắng bên phải:
```sql
SELECT RTRIM('Hello  ');  -- Hello
```

### REPLACE() - Thay thế chuỗi:
```sql
SELECT REPLACE('Hello World', 'World', 'MySQL');  -- Hello MySQL
```

### REVERSE() - Đảo ngược chuỗi:
```sql
SELECT REVERSE('Hello');  -- olleH
```

### LEFT() - Lấy n ký tự bên trái:
```sql
SELECT LEFT('Hello', 2);  -- He
```

### RIGHT() - Lấy n ký tự bên phải:
```sql
SELECT RIGHT('Hello', 2);  -- lo
```

### REPEAT() - Lặp lại chuỗi:
```sql
SELECT REPEAT('MySQL ', 3);  -- MySQL MySQL MySQL
```

### LOCATE() - Tìm vị trí chuỗi con:
```sql
SELECT LOCATE('World', 'Hello World');  -- 7
```

### LENGTH() - Độ dài chuỗi (bytes):
```sql
SELECT LENGTH('Hello');  -- 5
```

---

## NUMERIC FUNCTIONS

### ABS() - Giá trị tuyệt đối:
```sql
SELECT ABS(-10);  -- 10
```

### CEIL() hoặc CEILING() - Làm tròn lên:
```sql
SELECT CEIL(4.2);  -- 5
```

### FLOOR() - Làm tròn xuống:
```sql
SELECT FLOOR(4.9);  -- 4
```

### ROUND() - Làm tròn:
```sql
SELECT ROUND(4.567, 2);  -- 4.57
```

### POW() hoặc POWER() - Lũy thừa:
```sql
SELECT POW(2, 3);  -- 8
```

### SQRT() - Căn bậc 2:
```sql
SELECT SQRT(16);  -- 4
```

### MOD() - Chia lấy dư:
```sql
SELECT MOD(10, 3);  -- 1
```

### RAND() - Số ngẫu nhiên (0-1):
```sql
SELECT RAND();  -- 0.xxxx
```

### GREATEST() - Giá trị lớn nhất:
```sql
SELECT GREATEST(10, 20, 30);  -- 30
```

### LEAST() - Giá trị nhỏ nhất:
```sql
SELECT LEAST(10, 20, 30);  -- 10
```

### TRUNCATE() - Cắt bớt số thập phân:
```sql
SELECT TRUNCATE(4.567, 2);  -- 4.56
```

---

## DATE FUNCTIONS

### NOW() - Ngày giờ hiện tại:
```sql
SELECT NOW();  -- 2023-12-01 10:30:45
```

### CURDATE() - Ngày hiện tại:
```sql
SELECT CURDATE();  -- 2023-12-01
```

### CURTIME() - Giờ hiện tại:
```sql
SELECT CURTIME();  -- 10:30:45
```

### DATE() - Trích xuất phần ngày:
```sql
SELECT DATE('2023-12-01 10:30:45');  -- 2023-12-01
```

### TIME() - Trích xuất phần giờ:
```sql
SELECT TIME('2023-12-01 10:30:45');  -- 10:30:45
```

### YEAR(), MONTH(), DAY():
```sql
SELECT YEAR('2023-12-01');   -- 2023
SELECT MONTH('2023-12-01');  -- 12
SELECT DAY('2023-12-01');    -- 1
```

### HOUR(), MINUTE(), SECOND():
```sql
SELECT HOUR('10:30:45');    -- 10
SELECT MINUTE('10:30:45');  -- 30
SELECT SECOND('10:30:45');  -- 45
```

### DATE_ADD() - Cộng thời gian:
```sql
SELECT DATE_ADD('2023-12-01', INTERVAL 10 DAY);  -- 2023-12-11
SELECT DATE_ADD('2023-12-01', INTERVAL 1 MONTH); -- 2024-01-01
SELECT DATE_ADD('2023-12-01', INTERVAL 1 YEAR);  -- 2024-12-01
```

### DATE_SUB() - Trừ thời gian:
```sql
SELECT DATE_SUB('2023-12-01', INTERVAL 10 DAY);  -- 2023-11-21
```

### DATEDIFF() - Số ngày chênh lệch:
```sql
SELECT DATEDIFF('2023-12-31', '2023-12-01');  -- 30
```

### DATE_FORMAT() - Định dạng ngày:
```sql
SELECT DATE_FORMAT('2023-12-01', '%d/%m/%Y');  -- 01/12/2023
SELECT DATE_FORMAT(NOW(), '%W, %M %d, %Y');    -- Friday, December 01, 2023
```

### Các format specifiers:
- %Y: Năm 4 chữ số (2023)
- %y: Năm 2 chữ số (23)
- %M: Tên tháng đầy đủ (December)
- %m: Tháng 2 chữ số (12)
- %d: Ngày 2 chữ số (01)
- %W: Tên thứ (Friday)
- %H: Giờ 24h (14)
- %h: Giờ 12h (02)
- %i: Phút (30)
- %s: Giây (45)

### DAYNAME(), MONTHNAME():
```sql
SELECT DAYNAME('2023-12-01');    -- Friday
SELECT MONTHNAME('2023-12-01');  -- December
```

### WEEK(), WEEKDAY():
```sql
SELECT WEEK('2023-12-01');    -- Tuần thứ mấy trong năm
SELECT WEEKDAY('2023-12-01'); -- Thứ mấy (0=Monday, 6=Sunday)
```

---

## CÁC HÀM NÂNG CAO

### IF() - Điều kiện:
```sql
SELECT IF(500 > 1000, 'Lớn hơn', 'Nhỏ hơn');  -- Nhỏ hơn
```

### IFNULL() - Thay thế NULL:
```sql
SELECT IFNULL(NULL, 'Giá trị mặc định');  -- Giá trị mặc định
```

### NULLIF() - Trả về NULL nếu bằng nhau:
```sql
SELECT NULLIF(10, 10);  -- NULL
SELECT NULLIF(10, 20);  -- 10
```

### COALESCE() - Giá trị đầu tiên không NULL:
```sql
SELECT COALESCE(NULL, NULL, 'Giá trị 1', 'Giá trị 2');  -- Giá trị 1
```

---

## STORED PROCEDURES

### Tạo Stored Procedure:
```sql
DELIMITER //
CREATE PROCEDURE GetAllCustomers()
BEGIN
  SELECT * FROM customers;
END //
DELIMITER ;
```

### Gọi Stored Procedure:
```sql
CALL GetAllCustomers();
```

### Procedure với tham số:
```sql
DELIMITER //
CREATE PROCEDURE GetCustomerByCountry(IN country_name VARCHAR(50))
BEGIN
  SELECT * FROM customers WHERE country = country_name;
END //
DELIMITER ;

-- Gọi:
CALL GetCustomerByCountry('Vietnam');
```

### Procedure với OUT parameter:
```sql
DELIMITER //
CREATE PROCEDURE CountCustomers(OUT total INT)
BEGIN
  SELECT COUNT(*) INTO total FROM customers;
END //
DELIMITER ;

-- Gọi:
CALL CountCustomers(@total);
SELECT @total;
```

### Xóa Stored Procedure:
```sql
DROP PROCEDURE IF EXISTS GetAllCustomers;
```

---

## TRIGGERS

### Tạo Trigger:
```sql
CREATE TRIGGER before_customer_insert
BEFORE INSERT ON customers
FOR EACH ROW
SET NEW.created_at = NOW();
```

### Trigger AFTER INSERT:
```sql
CREATE TRIGGER after_order_insert
AFTER INSERT ON orders
FOR EACH ROW
INSERT INTO order_log (order_id, action, timestamp)
VALUES (NEW.order_id, 'INSERT', NOW());
```

### Xóa Trigger:
```sql
DROP TRIGGER IF EXISTS before_customer_insert;
```

### Hiển thị triggers:
```sql
SHOW TRIGGERS;
```

---

## TRANSACTIONS

### Bắt đầu transaction:
```sql
START TRANSACTION;
-- hoặc
BEGIN;
```

### Commit (lưu thay đổi):
```sql
COMMIT;
```

### Rollback (hủy thay đổi):
```sql
ROLLBACK;
```

### Ví dụ:
```sql
START TRANSACTION;

UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;
UPDATE accounts SET balance = balance + 100 WHERE account_id = 2;

-- Nếu mọi thứ OK:
COMMIT;

-- Nếu có lỗi:
-- ROLLBACK;
```

### SAVEPOINT:
```sql
START TRANSACTION;

INSERT INTO customers VALUES (1, 'Customer 1');
SAVEPOINT sp1;

INSERT INTO customers VALUES (2, 'Customer 2');
SAVEPOINT sp2;

-- Quay lại sp1:
ROLLBACK TO sp1;

COMMIT;
```

---

## USERS VÀ PRIVILEGES

### Tạo user:
```sql
CREATE USER 'username'@'localhost' IDENTIFIED BY 'password';
```

### Cấp quyền:
```sql
-- Tất cả quyền trên database:
GRANT ALL PRIVILEGES ON database_name.* TO 'username'@'localhost';

-- Quyền SELECT, INSERT, UPDATE:
GRANT SELECT, INSERT, UPDATE ON database_name.table_name TO 'username'@'localhost';
```

### Thu hồi quyền:
```sql
REVOKE ALL PRIVILEGES ON database_name.* FROM 'username'@'localhost';
```

### Hiển thị quyền:
```sql
SHOW GRANTS FOR 'username'@'localhost';
```

### Xóa user:
```sql
DROP USER 'username'@'localhost';
```

### Đổi password:
```sql
ALTER USER 'username'@'localhost' IDENTIFIED BY 'new_password';
```

### Reload privileges:
```sql
FLUSH PRIVILEGES;
```

---

## BACKUP VÀ RESTORE

### Backup database (command line):
```bash
mysqldump -u username -p database_name > backup.sql
```

### Backup tất cả databases:
```bash
mysqldump -u username -p --all-databases > all_databases.sql
```

### Backup chỉ cấu trúc (không có data):
```bash
mysqldump -u username -p --no-data database_name > structure.sql
```

### Restore database:
```bash
mysql -u username -p database_name < backup.sql
```

### Backup từ MySQL:
```sql
SELECT * INTO OUTFILE '/tmp/customers.txt'
FROM customers;
```

### Load data từ file:
```sql
LOAD DATA INFILE '/tmp/customers.txt'
INTO TABLE customers;
```

---

## PERFORMANCE OPTIMIZATION

### EXPLAIN - Phân tích câu query:
```sql
EXPLAIN SELECT * FROM customers WHERE country = 'Vietnam';
```

### Optimize table:
```sql
OPTIMIZE TABLE customers;
```

### Analyze table:
```sql
ANALYZE TABLE customers;
```

### Show table status:
```sql
SHOW TABLE STATUS LIKE 'customers';
```

### Show process list:
```sql
SHOW PROCESSLIST;
```

### Kill process:
```sql
KILL process_id;
```

---

## CÁC TIP TỐI ƯU HÓA

### 1. Sử dụng INDEX hợp lý:
- Tạo index cho các cột thường xuất hiện trong WHERE, JOIN, ORDER BY
- Không tạo quá nhiều index (làm chậm INSERT/UPDATE)

### 2. SELECT chỉ cột cần thiết:
```sql
-- TỐT:
SELECT customer_name, city FROM customers;

-- KHÔNG TỐT:
SELECT * FROM customers;
```

### 3. Sử dụng LIMIT:
```sql
SELECT * FROM customers LIMIT 100;
```

### 4. Tránh SELECT DISTINCT không cần thiết:
```sql
-- Nếu có thể, dùng GROUP BY thay vì DISTINCT
```

### 5. Sử dụng JOIN thay vì subquery khi có thể:
```sql
-- TỐT:
SELECT c.customer_name, o.order_id
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- CHẬM HƠN:
SELECT customer_name, 
  (SELECT order_id FROM orders WHERE customer_id = customers.customer_id)
FROM customers;
```

### 6. Sử dụng EXISTS thay vì IN với subquery lớn:
```sql
-- TỐT:
SELECT * FROM customers c
WHERE EXISTS (SELECT 1 FROM orders WHERE customer_id = c.customer_id);

-- CHẬM HƠN với subquery lớn:
SELECT * FROM customers
WHERE customer_id IN (SELECT customer_id FROM orders);
```

### 7. Tránh sử dụng LIKE với % ở đầu:
```sql
-- TỐT (có thể dùng index):
SELECT * FROM customers WHERE customer_name LIKE 'Nguyen%';

-- CHẬM (không dùng được index):
SELECT * FROM customers WHERE customer_name LIKE '%Nguyen%';
```

### 8. Sử dụng UNION ALL thay vì UNION nếu không cần loại trùng:
```sql
SELECT city FROM customers
UNION ALL
SELECT city FROM suppliers;
```

---

## CÁC LỖI THƯỜNG GẶP

### 1. Quên WHERE trong UPDATE/DELETE:
```sql
-- NGUY HIỂM! Sẽ xóa tất cả:
DELETE FROM customers;

-- ĐÚNG:
DELETE FROM customers WHERE customer_id = 1;
```

### 2. Không dùng backticks cho tên có khoảng trắng:
```sql
-- SAI:
SELECT * FROM customer data;

-- ĐÚNG:
SELECT * FROM `customer data`;
```

### 3. So sánh NULL sai cách:
```sql
-- SAI:
SELECT * FROM customers WHERE address = NULL;

-- ĐÚNG:
SELECT * FROM customers WHERE address IS NULL;
```

### 4. Quên GROUP BY khi dùng aggregate functions:
```sql
-- SAI:
SELECT country, COUNT(*) FROM customers;

-- ĐÚNG:
SELECT country, COUNT(*) FROM customers GROUP BY country;
```

### 5. Dùng WHERE sau GROUP BY:
```sql
-- SAI:
SELECT country, COUNT(*) FROM customers
GROUP BY country
WHERE COUNT(*) > 5;

-- ĐÚNG:
SELECT country, COUNT(*) FROM customers
GROUP BY country
HAVING COUNT(*) > 5;
```

---

## THỨ TỰ THỰC THI CÂU LỆNH SQL

```
1. FROM        - Chọn bảng
2. JOIN        - Nối bảng
3. WHERE       - Lọc dòng
4. GROUP BY    - Nhóm dữ liệu
5. HAVING      - Lọc nhóm
6. SELECT      - Chọn cột
7. DISTINCT    - Loại trùng lặp
8. ORDER BY    - Sắp xếp
9. LIMIT       - Giới hạn kết quả
```

---

## CÚ PHÁP ĐẦY ĐỦ CỦA SELECT

```sql
SELECT [DISTINCT] column1, column2, ...
FROM table1
[JOIN table2 ON condition]
[WHERE condition]
[GROUP BY column]
[HAVING condition]
[ORDER BY column [ASC|DESC]]
[LIMIT number [OFFSET number]];
```

---

## BẢNG TÓM TẮT NHANH

### Các câu lệnh quan trọng:
| Lệnh | Mô tả |
|------|-------|
| SELECT | Truy vấn dữ liệu |
| INSERT | Thêm dữ liệu |
| UPDATE | Cập nhật dữ liệu |
| DELETE | Xóa dữ liệu |
| CREATE | Tạo database/table |
| ALTER | Thay đổi cấu trúc |
| DROP | Xóa database/table |
| TRUNCATE | Xóa dữ liệu trong table |

### Các mệnh đề quan trọng:
| Mệnh đề | Mô tả |
|---------|-------|
| WHERE | Lọc dữ liệu |
| GROUP BY | Nhóm dữ liệu |
| HAVING | Lọc sau GROUP BY |
| ORDER BY | Sắp xếp |
| LIMIT | Giới hạn kết quả |

### Các hàm tổng hợp:
| Hàm | Mô tả |
|-----|-------|
| COUNT() | Đếm số dòng |
| SUM() | Tổng |
| AVG() | Trung bình |
| MIN() | Giá trị nhỏ nhất |
| MAX() | Giá trị lớn nhất |

---

## KẾT LUẬN

Đây là tài liệu tham khảo toàn diện về MySQL, bao gồm:
- ✓ Tất cả câu lệnh SQL cơ bản và nâng cao
- ✓ Các hàm built-in
- ✓ Quản lý database và tables
- ✓ Constraints và indexes
- ✓ Views, stored procedures, triggers
- ✓ Transactions và user management
- ✓ Tips tối ưu hóa performance

**Lời khuyên cuối:**
1. Thực hành thường xuyên
2. Luôn dùng WHERE với UPDATE/DELETE
3. Tạo backup trước khi thay đổi quan trọng
4. Sử dụng index hợp lý
5. Viết query rõ ràng, dễ đọc

**Chúc bạn học tốt MySQL! 🚀**

---

*Tài liệu được tạo ngày: 28/12/2025*
