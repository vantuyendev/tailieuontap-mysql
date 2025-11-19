-- Dữ liệu mẫu cho cơ sở dữ liệu QLBANHANG
USE QLBANHANG;

-- Thêm dữ liệu vào bảng NHANVIEN (idempotent)
INSERT INTO NHANVIEN (MANV, HOTEN, SODT, NGVL) VALUES
('NV01', 'Nguyen Van B', '0123456789', '2005-01-15'),
('NV02', 'Tran Thi C', '0987654321', '2005-06-20'),
('NV03', 'Le Van D', '0912345678', '2006-03-10')
ON DUPLICATE KEY UPDATE
	HOTEN = VALUES(HOTEN), SODT = VALUES(SODT), NGVL = VALUES(NGVL);

-- Thêm dữ liệu vào bảng KHACHHANG (idempotent)
INSERT INTO KHACHHANG (MAKH, HOTEN, DCHI, SODT, NGSINH, NGDK, DOANHSO) VALUES
('KH01', 'Nguyen Van A', '123 Nguyen Trai, Q1, TpHCM', '0909123456', '1980-05-15', '2006-01-10', 500000),
('KH02', 'Tran Thi B', '456 Le Loi, Q3, TpHCM', '0909234567', '1985-08-20', '2006-02-15', 800000),
('KH03', 'Le Van C', '789 Hai Ba Trung, Q1, TpHCM', '0909345678', '1990-12-25', '2006-03-20', 1200000)
ON DUPLICATE KEY UPDATE
	HOTEN = VALUES(HOTEN), DCHI = VALUES(DCHI), SODT = VALUES(SODT), NGSINH = VALUES(NGSINH), NGDK = VALUES(NGDK), DOANHSO = VALUES(DOANHSO);

-- Thêm dữ liệu vào bảng SANPHAM (idempotent)
INSERT INTO SANPHAM (MASP, TENSP, DVT, NUOCSX, GIA) VALUES
('BC01', 'But chi', 'cay', 'Singapore', 5000),
('BC02', 'But chi', 'cay', 'Singapore', 8000),
('BC04', 'But chi', 'cay', 'Singapore', 6000),
('BB01', 'But bi', 'cay', 'Viet Nam', 10000),
('BB02', 'But bi', 'cay', 'Trung Quoc', 15000),
('BB03', 'But bi', 'cay', 'Thai Lan', 35000),
('TV01', 'Tap 100 giay', 'quyen', 'Trung Quoc', 25000),
('TV02', 'Tap 200 giay', 'quyen', 'Trung Quoc', 38000),
('TV03', 'Tap 100 giay', 'quyen', 'Viet Nam', 30000),
('TV04', 'Tap 200 giay', 'quyen', 'Viet Nam', 42000),
('TV05', 'Tap 100 giay', 'quyen', 'Thai Lan', 32000),
('TV06', 'Tap 200 giay', 'quyen', 'Thai Lan', 45000),
('TV07', 'Tap 100 giay', 'quyen', 'Trung Quoc', 27000),
('ST01', 'So tay 500 trang', 'quyen', 'Trung Quoc', 40000),
('ST02', 'So tay loai 1', 'quyen', 'Viet Nam', 55000),
('ST03', 'So tay loai 2', 'quyen', 'Viet Nam', 51000),
('ST04', 'So tay', 'quyen', 'Thai Lan', 55000),
('ST05', 'So tay mong', 'quyen', 'Thai Lan', 20000),
('ST06', 'Phan viet bang', 'hop', 'Viet Nam', 5000),
('ST07', 'Phan khong bui', 'hop', 'Viet Nam', 7000),
('ST08', 'Bong bang', 'cai', 'Viet Nam', 1000),
('ST09', 'But long', 'cay', 'Viet Nam', 5000),
('ST10', 'But long', 'cay', 'Trung Quoc', 7000)
ON DUPLICATE KEY UPDATE
	TENSP = VALUES(TENSP), DVT = VALUES(DVT), NUOCSX = VALUES(NUOCSX), GIA = VALUES(GIA);

-- Thêm dữ liệu vào bảng HOADON (idempotent)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES
(1001, '2006-07-23', 'KH01', 'NV01', 320000),
(1002, '2006-08-12', 'KH02', 'NV02', 840000),
(1003, '2006-08-23', 'KH01', 'NV01', 100000),
(1004, '2006-09-01', 'KH01', 'NV02', 180000),
(1005, '2006-10-20', 'KH01', 'NV01', 3800000),
(1006, '2006-10-28', 'KH03', 'NV01', 260000),
(1007, '2006-10-28', 'KH02', 'NV01', 180000),
(1008, '2006-10-28', 'KH03', 'NV03', 330000),
(1009, '2006-10-28', 'KH01', 'NV03', 400000),
(1010, '2006-11-01', 'KH01', 'NV01', 710000),
(1011, '2006-11-04', 'KH02', 'NV02', 1320000),
(1012, '2006-11-30', 'KH03', 'NV03', 660000),
(1013, '2006-12-12', 'KH01', 'NV01', 1000000),
(1014, '2006-12-31', 'KH02', 'NV02', 750000),
(1015, '2007-01-01', 'KH01', 'NV01', 350000),
(1016, '2007-01-01', 'KH03', 'NV02', 550000),
(1017, '2007-01-02', 'KH02', 'NV03', 450000),
(1018, '2007-01-13', 'KH01', 'NV01', 650000),
(1019, '2007-01-13', 'KH03', 'NV03', 550000),
(1020, '2007-01-14', 'KH02', 'NV02', 450000)
ON DUPLICATE KEY UPDATE
	NGHD = VALUES(NGHD), MAKH = VALUES(MAKH), MANV = VALUES(MANV), TRIGIA = VALUES(TRIGIA);

-- Thêm dữ liệu vào bảng CTHD (idempotent)
INSERT INTO CTHD (SOHD, MASP, SL) VALUES
(1001, 'TV02', 10),
(1001, 'ST01', 5),
(1001, 'BC01', 5),
(1001, 'BC02', 10),
(1001, 'ST08', 10),
(1002, 'BC04', 20),
(1002, 'BB01', 20),
(1002, 'BB02', 20),
(1003, 'BB03', 10),
(1004, 'TV01', 20),
(1004, 'TV02', 10),
(1004, 'TV03', 10),
(1004, 'TV04', 10),
(1005, 'TV05', 50),
(1005, 'TV06', 50),
(1006, 'TV07', 20),
(1006, 'ST01', 30),
(1006, 'ST02', 10),
(1007, 'ST03', 10),
(1008, 'ST04', 8),
(1009, 'ST05', 10),
(1010, 'TV07', 50),
(1010, 'ST07', 50),
(1010, 'ST08', 100),
(1010, 'ST04', 50),
(1010, 'TV03', 10),
(1011, 'ST06', 50),
(1012, 'ST07', 3),
(1013, 'ST08', 5),
(1014, 'BC02', 80),
(1015, 'BB02', 15),
(1015, 'BB01', 20),
(1016, 'TV01', 15),
(1017, 'TV02', 8),
(1017, 'TV03', 5),
(1018, 'TV06', 6),
(1019, 'TV05', 1),
(1020, 'TV07', 20)
ON DUPLICATE KEY UPDATE
	SL = VALUES(SL);

-- Cập nhật dữ liệu còn thiếu trong bảng HOADON để fix các truy vấn
UPDATE HOADON SET TRIGIA = 220000 WHERE SOHD = 1006;
UPDATE HOADON SET TRIGIA = 520000 WHERE SOHD = 1007;

-- Một số hóa đơn không có MAKH (khách hàng vãng lai)
INSERT INTO HOADON (SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES
(1021, '2006-10-15', NULL, 'NV01', 50000),
(1022, '2006-11-20', NULL, 'NV02', 75000);

INSERT INTO CTHD (SOHD, MASP, SL) VALUES
(1021, 'BC01', 10),
(1022, 'ST08', 50);
