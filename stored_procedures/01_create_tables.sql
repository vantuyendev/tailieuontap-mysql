-- Tạo cơ sở dữ liệu sampledatabase
CREATE DATABASE IF NOT EXISTS sampledatabase;
USE sampledatabase;

-- Tạo bảng employees
CREATE TABLE IF NOT EXISTS employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    department VARCHAR(50),
    salary DECIMAL(10, 2),
    hire_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
