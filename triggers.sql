USE classicmodels;

-- TRIGGER 1: BEFORE INSERT - Kiểm tra số lượng sản phẩm trước khi thêm


DROP TRIGGER IF EXISTS before_product_insert;

CREATE TRIGGER before_product_insert
BEFORE INSERT ON products
FOR EACH ROW
BEGIN
    IF NEW.quantityInStock < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Số lượng sản phẩm không thể âm';
    END IF;
    
    IF NEW.buyPrice <= 0 OR NEW.MSRP <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Giá sản phẩm phải lớn hơn 0';
    END IF;
    
    IF NEW.MSRP < NEW.buyPrice THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Giá bán lẻ (MSRP) phải lớn hơn hoặc bằng giá mua (buyPrice)';
    END IF;
END;


-- TRIGGER 2: AFTER INSERT - Ghi log khi có đơn hàng mới

DROP TABLE IF EXISTS order_logs;
CREATE TABLE order_logs (
    logId INT AUTO_INCREMENT PRIMARY KEY,
    orderNumber INT,
    customerNumber INT,
    action VARCHAR(50),
    oldStatus VARCHAR(15),
    newStatus VARCHAR(15),
    logDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    userName VARCHAR(100)
);

DROP TRIGGER IF EXISTS after_order_insert;

CREATE TRIGGER after_order_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_logs(orderNumber, customerNumber, action, oldStatus, newStatus, userName)
    VALUES(NEW.orderNumber, NEW.customerNumber, 'INSERT', NULL, NEW.status, USER());
END;


-- TRIGGER 3: BEFORE UPDATE - Cập nhật tồn kho khi có chi tiết đơn hàng mới

DROP TRIGGER IF EXISTS before_orderdetail_update;

CREATE TRIGGER before_orderdetail_update
BEFORE UPDATE ON orderdetails
FOR EACH ROW
BEGIN
    DECLARE available_stock INT;
    
    -- Lấy số lượng tồn kho
    SELECT quantityInStock INTO available_stock
    FROM products
    WHERE productCode = NEW.productCode;
    
    -- Kiểm tra nếu tăng số lượng đặt hàng
    IF NEW.quantityOrdered > OLD.quantityOrdered THEN
        IF (NEW.quantityOrdered - OLD.quantityOrdered) > available_stock THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Không đủ hàng trong kho để đáp ứng đơn hàng';
        END IF;
    END IF;
    
    -- Đảm bảo số lượng và giá hợp lệ
    IF NEW.quantityOrdered <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Số lượng đặt hàng phải lớn hơn 0';
    END IF;
    
    IF NEW.priceEach <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Giá sản phẩm phải lớn hơn 0';
    END IF;
END;


-- TRIGGER 4: AFTER UPDATE - Ghi log khi trạng thái đơn hàng thay đổi

DROP TRIGGER IF EXISTS after_order_update;

CREATE TRIGGER after_order_update
AFTER UPDATE ON orders
FOR EACH ROW
BEGIN
    IF OLD.status != NEW.status THEN
        INSERT INTO order_logs(orderNumber, customerNumber, action, oldStatus, newStatus, userName)
        VALUES(NEW.orderNumber, NEW.customerNumber, 'UPDATE', OLD.status, NEW.status, USER());
    END IF;
END;


-- TRIGGER 5: BEFORE DELETE - Ngăn chặn xóa khách hàng có đơn hàng


DROP TRIGGER IF EXISTS before_customer_delete;

CREATE TRIGGER before_customer_delete
BEFORE DELETE ON customers
FOR EACH ROW
BEGIN
    DECLARE order_count INT;
    
    -- Đếm số đơn hàng của khách hàng
    SELECT COUNT(*) INTO order_count
    FROM orders
    WHERE customerNumber = OLD.customerNumber;
    
    IF order_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể xóa khách hàng đã có đơn hàng. Vui lòng xóa đơn hàng trước.';
    END IF;
END;

-- TRIGGER 6: AFTER DELETE - Ghi log khi xóa nhân viên

DROP TABLE IF EXISTS employee_delete_logs;
CREATE TABLE employee_delete_logs (
    logId INT AUTO_INCREMENT PRIMARY KEY,
    employeeNumber INT,
    lastName VARCHAR(50),
    firstName VARCHAR(50),
    email VARCHAR(100),
    jobTitle VARCHAR(50),
    deletedDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    deletedBy VARCHAR(100)
);

DROP TRIGGER IF EXISTS after_employee_delete;

DROP TRIGGER IF EXISTS after_employee_delete;

CREATE TRIGGER after_employee_delete
AFTER DELETE ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_delete_logs(
        employeeNumber, 
        lastName, 
        firstName, 
        email, 
        jobTitle, 
        deletedBy
    )
    VALUES(
        OLD.employeeNumber,
        OLD.lastName,
        OLD.firstName,
        OLD.email,
        OLD.jobTitle,
        USER()
    );
END;