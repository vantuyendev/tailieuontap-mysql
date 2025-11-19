USE sampledatabase;

DELIMITER //

-- ============================================
-- 1. Thủ tục truy vấn tất cả dữ liệu từ bảng employees
-- ============================================
CREATE PROCEDURE sp_GetAllEmployees()
BEGIN
    SELECT 
        id,
        name,
        email,
        department,
        salary,
        hire_date,
        created_at
    FROM employees
    ORDER BY id;
END //

-- ============================================
-- 2. Thủ tục truy vấn dữ liệu từ bảng với tham số ID
-- ============================================
CREATE PROCEDURE sp_GetEmployeeById(
    IN p_id INT
)
BEGIN
    SELECT 
        id,
        name,
        email,
        department,
        salary,
        hire_date,
        created_at
    FROM employees
    WHERE id = p_id;
END //

-- ============================================
-- 3. Thủ tục thêm thông tin vào bảng employees
-- ============================================
CREATE PROCEDURE sp_InsertEmployee(
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_department VARCHAR(50),
    IN p_salary DECIMAL(10, 2),
    IN p_hire_date DATE
)
BEGIN
    INSERT INTO employees (name, email, department, salary, hire_date)
    VALUES (p_name, p_email, p_department, p_salary, p_hire_date);
    
    -- Trả về ID của bản ghi vừa thêm
    SELECT LAST_INSERT_ID() AS new_id;
END //

-- ============================================
-- 4. Thủ tục sửa thông tin trên bảng employees
-- ============================================
CREATE PROCEDURE sp_UpdateEmployee(
    IN p_id INT,
    IN p_name VARCHAR(100),
    IN p_email VARCHAR(100),
    IN p_department VARCHAR(50),
    IN p_salary DECIMAL(10, 2),
    IN p_hire_date DATE
)
BEGIN
    UPDATE employees
    SET 
        name = p_name,
        email = p_email,
        department = p_department,
        salary = p_salary,
        hire_date = p_hire_date
    WHERE id = p_id;
    
    -- Trả về số dòng bị ảnh hưởng
    SELECT ROW_COUNT() AS affected_rows;
END //

-- ============================================
-- 5. Thủ tục xóa thông tin trên bảng dựa trên ID
-- ============================================
CREATE PROCEDURE sp_DeleteEmployee(
    IN p_id INT
)
BEGIN
    DELETE FROM employees
    WHERE id = p_id;
    
    -- Trả về số dòng bị xóa
    SELECT ROW_COUNT() AS deleted_rows;
END //

DELIMITER ;
