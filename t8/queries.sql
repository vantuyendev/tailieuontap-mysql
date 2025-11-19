-- 1. In ra danh sách các sản phẩm (MASP,TENSP) do "Trung Quoc" sản xuất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc';

-- 2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là "cay", "quyen".
SELECT MASP, TENSP
FROM SANPHAM
WHERE DVT IN ('cay', 'quyen');

-- 3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là "B" và kết thúc là "01".
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP LIKE 'B%01';

-- 4. In ra danh sách các sản phẩm (MASP,TENSP) do "Trung Quốc" sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc' 
  AND GIA BETWEEN 30000 AND 40000;

-- 5. In ra danh sách các sản phẩm (MASP,TENSP) do "Trung Quoc" hoặc "Thai Lan" sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX IN ('Trung Quoc', 'Thai Lan')
  AND GIA BETWEEN 30000 AND 40000;

-- 6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD, TRIGIA
FROM HOADON
WHERE NGHD IN ('2007-01-01', '2007-01-02');

-- 7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT SOHD, TRIGIA
FROM HOADON
WHERE YEAR(NGHD) = 2007 AND MONTH(NGHD) = 1
ORDER BY NGHD ASC, TRIGIA DESC;

-- 8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT DISTINCT KH.MAKH, KH.HOTEN
FROM KHACHHANG KH
INNER JOIN HOADON HD ON KH.MAKH = HD.MAKH
WHERE HD.NGHD = '2007-01-01';

-- 9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên "Nguyen Van B" lập trong ngày 28/10/2006.
SELECT HD.SOHD, HD.TRIGIA
FROM HOADON HD
INNER JOIN NHANVIEN NV ON HD.MANV = NV.MANV
WHERE NV.HOTEN = 'Nguyen Van B' 
  AND HD.NGHD = '2006-10-28';

-- 10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên "Nguyen Van A" mua trong tháng 10/2006.
SELECT DISTINCT SP.MASP, SP.TENSP
FROM SANPHAM SP
INNER JOIN CTHD CT ON SP.MASP = CT.MASP
INNER JOIN HOADON HD ON CT.SOHD = HD.SOHD
INNER JOIN KHACHHANG KH ON HD.MAKH = KH.MAKH
WHERE KH.HOTEN = 'Nguyen Van A'
  AND YEAR(HD.NGHD) = 2006 
  AND MONTH(HD.NGHD) = 10;

-- 11. Tìm các số hóa đơn đã mua sản phẩm có mã số "BB01" hoặc "BB02".
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02');

-- 12. Tìm các số hóa đơn đã mua sản phẩm có mã số "BB01" hoặc "BB02", mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP IN ('BB01', 'BB02')
  AND SL BETWEEN 10 AND 20;

-- 13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số "BB01" và "BB02", mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT CT1.SOHD
FROM CTHD CT1
INNER JOIN CTHD CT2 ON CT1.SOHD = CT2.SOHD
WHERE CT1.MASP = 'BB01' 
  AND CT2.MASP = 'BB02'
  AND CT1.SL BETWEEN 10 AND 20
  AND CT2.SL BETWEEN 10 AND 20;

-- 14. In ra danh sách các sản phẩm (MASP,TENSP) do "Trung Quoc" sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
SELECT DISTINCT SP.MASP, SP.TENSP
FROM SANPHAM SP
LEFT JOIN CTHD CT ON SP.MASP = CT.MASP
LEFT JOIN HOADON HD ON CT.SOHD = HD.SOHD
WHERE SP.NUOCSX = 'Trung Quoc' 
   OR HD.NGHD = '2007-01-01';

-- 15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
SELECT SP.MASP, SP.TENSP
FROM SANPHAM SP
WHERE NOT EXISTS (
    SELECT 1
    FROM CTHD CT
    WHERE CT.MASP = SP.MASP
);

-- 16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
SELECT SP.MASP, SP.TENSP
FROM SANPHAM SP
WHERE NOT EXISTS (
    SELECT 1
    FROM CTHD CT
    INNER JOIN HOADON HD ON CT.SOHD = HD.SOHD
    WHERE CT.MASP = SP.MASP 
      AND YEAR(HD.NGHD) = 2006
);

-- 17. In ra danh sách các sản phẩm (MASP,TENSP) do "Trung Quoc" sản xuất không bán được trong năm 2006.
SELECT SP.MASP, SP.TENSP
FROM SANPHAM SP
WHERE SP.NUOCSX = 'Trung Quoc'
  AND NOT EXISTS (
    SELECT 1
    FROM CTHD CT
    INNER JOIN HOADON HD ON CT.SOHD = HD.SOHD
    WHERE CT.MASP = SP.MASP 
      AND YEAR(HD.NGHD) = 2006
);

-- 18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
SELECT HD.SOHD
FROM HOADON HD
WHERE NOT EXISTS (
    SELECT 1
    FROM SANPHAM SP
    WHERE SP.NUOCSX = 'Singapore'
      AND NOT EXISTS (
        SELECT 1
        FROM CTHD CT
        WHERE CT.SOHD = HD.SOHD 
          AND CT.MASP = SP.MASP
    )
);

-- 19. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(*) AS SoLuongHoaDon
FROM HOADON
WHERE MAKH IS NULL;

-- 20. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(DISTINCT CT.MASP) AS SoSanPham
FROM CTHD CT
INNER JOIN HOADON HD ON CT.SOHD = HD.SOHD
WHERE YEAR(HD.NGHD) = 2006;

-- 21. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu?
SELECT MAX(TRIGIA) AS TriGiaCaoNhat, 
       MIN(TRIGIA) AS TriGiaThapNhat
FROM HOADON;

-- 22. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(TRIGIA) AS TriGiaTrungBinh
FROM HOADON
WHERE YEAR(NGHD) = 2006;

-- 23. Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(TRIGIA) AS DoanhThu2006
FROM HOADON
WHERE YEAR(NGHD) = 2006;

-- 24. Tìm số hóa đơn có trị giá cao nhất trong năm 2006.
SELECT SOHD
FROM HOADON
WHERE YEAR(NGHD) = 2006
  AND TRIGIA = (
    SELECT MAX(TRIGIA)
    FROM HOADON
    WHERE YEAR(NGHD) = 2006
);

-- 25. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.
SELECT KH.HOTEN
FROM KHACHHANG KH
INNER JOIN HOADON HD ON KH.MAKH = HD.MAKH
WHERE YEAR(HD.NGHD) = 2006
  AND HD.TRIGIA = (
    SELECT MAX(TRIGIA)
    FROM HOADON
    WHERE YEAR(NGHD) = 2006
);

-- 26. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
SELECT MAKH, HOTEN
FROM KHACHHANG
ORDER BY DOANHSO DESC
LIMIT 3;

-- 27. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA >= (
    SELECT DISTINCT GIA
    FROM SANPHAM
    ORDER BY GIA DESC
    LIMIT 2, 1
);

-- 28. In ra danh sách các sản phẩm (MASP, TENSP) do "Thai Lan" sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Thai Lan'
  AND GIA >= (
    SELECT DISTINCT GIA
    FROM SANPHAM
    ORDER BY GIA DESC
    LIMIT 2, 1
);

-- 29. In ra danh sách các sản phẩm (MASP, TENSP) do "Trung Quoc" sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do "Trung Quoc" sản xuất).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
  AND GIA >= (
    SELECT DISTINCT GIA
    FROM SANPHAM
    WHERE NUOCSX = 'Trung Quoc'
    ORDER BY GIA DESC
    LIMIT 2, 1
);

-- 30. In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
SELECT 
    MAKH, 
    HOTEN, 
    DOANHSO,
    RANK() OVER (ORDER BY DOANHSO DESC) AS XepHang
FROM KHACHHANG
ORDER BY DOANHSO DESC
LIMIT 3;

-- 31. Tính tổng số sản phẩm do "Trung Quoc" sản xuất.
SELECT COUNT(*) AS TongSoSanPham
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc';

-- 32. Tính tổng số sản phẩm của từng nước sản xuất.
SELECT NUOCSX, COUNT(*) AS TongSoSanPham
FROM SANPHAM
GROUP BY NUOCSX;

-- 33. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT 
    NUOCSX,
    MAX(GIA) AS GiaCaoNhat,
    MIN(GIA) AS GiaThapNhat,
    AVG(GIA) AS GiaTrungBinh
FROM SANPHAM
GROUP BY NUOCSX;

-- 34. Tính doanh thu bán hàng mỗi ngày.
SELECT 
    NGHD,
    SUM(TRIGIA) AS DoanhThu
FROM HOADON
GROUP BY NGHD
ORDER BY NGHD;

-- 35. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT 
    CT.MASP,
    SUM(CT.SL) AS TongSoLuong
FROM CTHD CT
INNER JOIN HOADON HD ON CT.SOHD = HD.SOHD
WHERE YEAR(HD.NGHD) = 2006 
  AND MONTH(HD.NGHD) = 10
GROUP BY CT.MASP;

-- 36. Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT 
    MONTH(NGHD) AS Thang,
    SUM(TRIGIA) AS DoanhThu
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
ORDER BY MONTH(NGHD);

-- 37. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT SOHD
FROM CTHD
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP) >= 4;

-- 38. Tìm hóa đơn có mua 3 sản phẩm do "Viet Nam" sản xuất (3 sản phẩm khác nhau).
SELECT CT.SOHD
FROM CTHD CT
INNER JOIN SANPHAM SP ON CT.MASP = SP.MASP
WHERE SP.NUOCSX = 'Viet Nam'
GROUP BY CT.SOHD
HAVING COUNT(DISTINCT CT.MASP) = 3;

-- 39. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
SELECT 
    KH.MAKH, 
    KH.HOTEN,
    COUNT(HD.SOHD) AS SoLanMua
FROM KHACHHANG KH
INNER JOIN HOADON HD ON KH.MAKH = HD.MAKH
GROUP BY KH.MAKH, KH.HOTEN
ORDER BY COUNT(HD.SOHD) DESC
LIMIT 1;

-- 40. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất?
SELECT
    MONTH(NGHD) AS Thang,
    SUM(TRIGIA) AS DoanhThu
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD)
ORDER BY SUM(TRIGIA) DESC
LIMIT 1;
