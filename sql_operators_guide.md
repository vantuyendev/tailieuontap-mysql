# Hướng Dẫn Các Operator Trong SQL

## 1. Arithmetic Operators (Toán tử số học)

Các toán tử được sử dụng để thực hiện các phép tính toán học.

| Operator | Mô tả | Ví dụ |
|----------|-------|-------|
| + | Cộng | `SELECT price + tax FROM products;` |
| - | Trừ | `SELECT price - discount FROM products;` |
| * | Nhân | `SELECT quantity * price FROM orders;` |
| / | Chia | `SELECT total / quantity FROM orders;` |
| % | Chia lấy dư (Modulo) | `SELECT id % 2 FROM users;` |

**Ví dụ thực tế:**
```sql
-- Tính tổng giá trị đơn hàng
SELECT order_id, quantity * unit_price AS total_amount
FROM order_details;

-- Tính giá sau giảm giá
SELECT product_name, price, price * (1 - discount/100) AS final_price
FROM products;
```

## 2. Comparison Operators (Toán tử so sánh)

Được sử dụng trong mệnh đề WHERE để so sánh các giá trị.

| Operator | Mô tả | Ví dụ |
|----------|-------|-------|
| = | Bằng | `WHERE age = 25` |
| != hoặc <> | Khác | `WHERE status != 'inactive'` |
| > | Lớn hơn | `WHERE price > 100` |
| < | Nhỏ hơn | `WHERE quantity < 10` |
| >= | Lớn hơn hoặc bằng | `WHERE age >= 18` |
| <= | Nhỏ hơn hoặc bằng | `WHERE salary <= 50000` |

**Ví dụ thực tế:**
```sql
-- Tìm sản phẩm có giá trên 1000
SELECT * FROM products
WHERE price > 1000;

-- Tìm nhân viên từ 25 tuổi trở lên
SELECT * FROM employees
WHERE age >= 25;
```

## 3. Logical Operators (Toán tử logic)

Kết hợp nhiều điều kiện trong mệnh đề WHERE.

| Operator | Mô tả | Ví dụ |
|----------|-------|-------|
| AND | Tất cả điều kiện phải đúng | `WHERE age > 18 AND city = 'Hanoi'` |
| OR | Ít nhất một điều kiện đúng | `WHERE city = 'Hanoi' OR city = 'HCMC'` |
| NOT | Phủ định điều kiện | `WHERE NOT status = 'deleted'` |

**Ví dụ thực tế:**
```sql
-- Tìm sản phẩm có giá từ 100 đến 500
SELECT * FROM products
WHERE price >= 100 AND price <= 500;

-- Tìm khách hàng ở Hà Nội hoặc TP.HCM
SELECT * FROM customers
WHERE city = 'Hanoi' OR city = 'HCMC';

-- Tìm đơn hàng chưa bị hủy
SELECT * FROM orders
WHERE NOT status = 'cancelled';
```

## 4. BETWEEN Operator

Kiểm tra giá trị trong một khoảng (bao gồm cả 2 đầu).

**Cú pháp:**
```sql
WHERE column_name BETWEEN value1 AND value2;
```

**Ví dụ:**
```sql
-- Tìm sản phẩm có giá từ 100 đến 500
SELECT * FROM products
WHERE price BETWEEN 100 AND 500;

-- Tìm đơn hàng trong tháng 1/2024
SELECT * FROM orders
WHERE order_date BETWEEN '2024-01-01' AND '2024-01-31';

-- Tìm nhân viên có tuổi từ 25 đến 40
SELECT * FROM employees
WHERE age BETWEEN 25 AND 40;
```

## 5. IN Operator

Kiểm tra giá trị có nằm trong danh sách cho trước không.

**Cú pháp:**
```sql
WHERE column_name IN (value1, value2, ...);
```

**Ví dụ:**
```sql
-- Tìm khách hàng ở các thành phố cụ thể
SELECT * FROM customers
WHERE city IN ('Hanoi', 'HCMC', 'Da Nang');

-- Tìm sản phẩm thuộc các danh mục
SELECT * FROM products
WHERE category_id IN (1, 3, 5, 7);

-- Tìm đơn hàng có trạng thái cụ thể
SELECT * FROM orders
WHERE status IN ('pending', 'processing', 'shipped');
```

## 6. LIKE Operator

Tìm kiếm theo mẫu (pattern matching).

**Ký tự đại diện:**
- `%` : Đại diện cho 0 hoặc nhiều ký tự
- `_` : Đại diện cho đúng 1 ký tự

**Ví dụ:**
```sql
-- Tìm khách hàng có tên bắt đầu bằng 'Nguyen'
SELECT * FROM customers
WHERE name LIKE 'Nguyen%';

-- Tìm email kết thúc bằng '@gmail.com'
SELECT * FROM users
WHERE email LIKE '%@gmail.com';

-- Tìm sản phẩm có chữ 'phone' ở bất kỳ vị trí nào
SELECT * FROM products
WHERE product_name LIKE '%phone%';

-- Tìm mã sản phẩm có 4 ký tự
SELECT * FROM products
WHERE product_code LIKE '____';

-- Tìm tên bắt đầu bằng 'A' và có 5 ký tự
SELECT * FROM employees
WHERE name LIKE 'A____';
```

## 7. IS NULL / IS NOT NULL Operators

Kiểm tra giá trị NULL.

**Ví dụ:**
```sql
-- Tìm khách hàng chưa có email
SELECT * FROM customers
WHERE email IS NULL;

-- Tìm sản phẩm đã có mô tả
SELECT * FROM products
WHERE description IS NOT NULL;

-- Tìm đơn hàng chưa được giao
SELECT * FROM orders
WHERE delivered_date IS NULL;
```

## 8. EXISTS Operator

Kiểm tra sự tồn tại của dữ liệu trong subquery.

**Ví dụ:**
```sql
-- Tìm khách hàng đã từng đặt hàng
SELECT * FROM customers c
WHERE EXISTS (
    SELECT 1 FROM orders o
    WHERE o.customer_id = c.id
);

-- Tìm sản phẩm chưa từng được bán
SELECT * FROM products p
WHERE NOT EXISTS (
    SELECT 1 FROM order_details od
    WHERE od.product_id = p.id
);
```

## 9. ALL và ANY Operators

So sánh với tất cả hoặc bất kỳ giá trị nào trong subquery.

**Ví dụ:**
```sql
-- Tìm sản phẩm có giá cao hơn tất cả sản phẩm trong category 1
SELECT * FROM products
WHERE price > ALL (
    SELECT price FROM products WHERE category_id = 1
);

-- Tìm sản phẩm có giá cao hơn bất kỳ sản phẩm nào trong category 1
SELECT * FROM products
WHERE price > ANY (
    SELECT price FROM products WHERE category_id = 1
);
```

## 10. UNION / UNION ALL Operators

Kết hợp kết quả từ nhiều truy vấn.

**Ví dụ:**
```sql
-- UNION (loại bỏ bản ghi trùng lặp)
SELECT city FROM customers
UNION
SELECT city FROM suppliers;

-- UNION ALL (giữ tất cả bản ghi, kể cả trùng lặp)
SELECT name FROM customers
UNION ALL
SELECT name FROM employees;
```

## 11. CASE Operator

Tạo logic điều kiện trong truy vấn (giống if-else).

**Cú pháp:**
```sql
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE default_result
END
```

**Ví dụ:**
```sql
-- Phân loại sản phẩm theo giá
SELECT 
    product_name,
    price,
    CASE
        WHEN price < 100 THEN 'Rẻ'
        WHEN price BETWEEN 100 AND 500 THEN 'Trung bình'
        WHEN price > 500 THEN 'Đắt'
        ELSE 'Chưa xác định'
    END AS price_category
FROM products;

-- Tính lương thưởng theo hiệu suất
SELECT 
    employee_name,
    salary,
    CASE
        WHEN performance > 90 THEN salary * 1.2
        WHEN performance > 70 THEN salary * 1.1
        ELSE salary
    END AS final_salary
FROM employees;
```

## 12. DISTINCT Operator

Loại bỏ các bản ghi trùng lặp.

**Ví dụ:**
```sql
-- Lấy danh sách các thành phố duy nhất
SELECT DISTINCT city FROM customers;

-- Lấy danh sách các category_id duy nhất
SELECT DISTINCT category_id FROM products;

-- Kết hợp nhiều cột
SELECT DISTINCT city, country FROM customers;
```

## 13. Operator Precedence (Độ ưu tiên toán tử)

Thứ tự ưu tiên từ cao đến thấp:

1. `()` - Dấu ngoặc đơn
2. `*`, `/`, `%` - Nhân, chia, chia lấy dư
3. `+`, `-` - Cộng, trừ
4. `=`, `>`, `<`, `>=`, `<=`, `<>`, `!=` - So sánh
5. `NOT` - Phủ định
6. `AND` - Và
7. `OR` - Hoặc

**Ví dụ:**
```sql
-- Sử dụng dấu ngoặc để điều khiển thứ tự
SELECT * FROM products
WHERE (category_id = 1 OR category_id = 2) AND price > 100;

-- Không dùng ngoặc có thể cho kết quả khác
SELECT * FROM products
WHERE category_id = 1 OR category_id = 2 AND price > 100;
-- (AND được ưu tiên trước OR)
```

## 14. String Operators

Các toán tử xử lý chuỗi.

| Operator | Mô tả | Ví dụ |
|----------|-------|-------|
| \|\| hoặc CONCAT | Nối chuỗi | `SELECT first_name \|\| ' ' \|\| last_name` |
| UPPER() | Chuyển sang chữ hoa | `SELECT UPPER(name) FROM users` |
| LOWER() | Chuyển sang chữ thường | `SELECT LOWER(email) FROM users` |
| LENGTH() | Độ dài chuỗi | `SELECT LENGTH(description) FROM products` |
| SUBSTRING() | Lấy chuỗi con | `SELECT SUBSTRING(name, 1, 5) FROM customers` |
| TRIM() | Xóa khoảng trắng đầu/cuối | `SELECT TRIM(name) FROM users` |

**Ví dụ:**
```sql
-- Nối họ và tên
SELECT first_name || ' ' || last_name AS full_name
FROM employees;

-- Tìm kiếm không phân biệt hoa thường
SELECT * FROM products
WHERE LOWER(product_name) LIKE '%phone%';

-- Lấy 3 ký tự đầu của mã sản phẩm
SELECT SUBSTRING(product_code, 1, 3) AS prefix
FROM products;
```

## 15. Date Operators

Các toán tử xử lý ngày tháng.

**Ví dụ:**
```sql
-- So sánh ngày
SELECT * FROM orders
WHERE order_date > '2024-01-01';

-- Tính khoảng cách ngày
SELECT order_id, 
       DATEDIFF(delivered_date, order_date) AS delivery_days
FROM orders;

-- Lấy năm từ ngày
SELECT YEAR(order_date) AS order_year
FROM orders;

-- Lấy tháng từ ngày
SELECT MONTH(order_date) AS order_month
FROM orders;

-- Thêm ngày
SELECT DATE_ADD(order_date, INTERVAL 7 DAY) AS expected_delivery
FROM orders;
```

## Tổng Kết

- **Arithmetic Operators**: Thực hiện phép tính
- **Comparison Operators**: So sánh giá trị
- **Logical Operators**: Kết hợp điều kiện (AND, OR, NOT)
- **BETWEEN**: Kiểm tra khoảng giá trị
- **IN**: Kiểm tra trong danh sách
- **LIKE**: Tìm kiếm theo mẫu
- **IS NULL**: Kiểm tra giá trị NULL
- **EXISTS**: Kiểm tra sự tồn tại
- **CASE**: Logic điều kiện
- **DISTINCT**: Loại bỏ trùng lặp

## Lưu Ý Quan Trọng

1. **NULL handling**: NULL không bằng bất kỳ giá trị nào, kể cả NULL. Dùng `IS NULL` thay vì `= NULL`.
2. **String comparison**: Phân biệt hoa thường tùy thuộc vào cấu hình database.
3. **Date format**: Luôn sử dụng format chuẩn 'YYYY-MM-DD' khi làm việc với ngày.
4. **Performance**: Operators như LIKE với `%` ở đầu có thể chậm trên bảng lớn.
5. **Precedence**: Sử dụng dấu ngoặc đơn để làm rõ thứ tự thực hiện.
