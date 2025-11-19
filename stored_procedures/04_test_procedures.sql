-- File kiểm tra các thủ tục lưu trữ
USE sampledatabase;

-- ============================================
-- Test 1: Truy vấn tất cả nhân viên
-- ============================================
CALL sp_GetAllEmployees();

-- ============================================
-- Test 2: Truy vấn nhân viên theo ID
-- ============================================
CALL sp_GetEmployeeById(1);
CALL sp_GetEmployeeById(3);

-- ============================================
-- Test 3: Thêm nhân viên mới
-- ============================================
CALL sp_InsertEmployee(
    'Vũ Thị F',
    'vuthif@example.com',
    'Sales',
    13000000,
    '2024-01-10'
);

-- Kiểm tra kết quả sau khi thêm
CALL sp_GetAllEmployees();

-- ============================================
-- Test 4: Sửa thông tin nhân viên
-- ============================================
CALL sp_UpdateEmployee(
    1,
    'Nguyễn Văn A - Updated',
    'nguyenvana.updated@example.com',
    'IT',
    20000000,
    '2023-01-15'
);

-- Kiểm tra kết quả sau khi sửa
CALL sp_GetEmployeeById(1);

-- ============================================
-- Test 5: Xóa nhân viên theo ID
-- ============================================
CALL sp_DeleteEmployee(5);

-- Kiểm tra kết quả sau khi xóa
CALL sp_GetAllEmployees();
