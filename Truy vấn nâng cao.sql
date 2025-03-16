--INNER JOIN - Danh sách đoàn viên tham gia chương trình
SELECT dv.HoTen, ct.TenCT, ct.ThoiGian, ct.TrangThai
FROM DoanVien dv
INNER JOIN ThamGiaCT tg ON dv.MaDoanVien = tg.MaDoanVien
INNER JOIN ChuongTrinh ct ON tg.MaCT = ct.MaCT;

--GROUP BY - Đếm số đoàn viên theo tỉnh
SELECT t.TenTinh, COUNT(dv.MaDoanVien) AS SoLuongDoanVien
FROM Tinh t
INNER JOIN DoanVien dv ON t.MaTinh = dv.MaTinh
GROUP BY t.TenTinh;

--HAVING - Lọc tỉnh có trên 5 đoàn viên
SELECT t.TenTinh, COUNT(dv.MaDoanVien) AS SoLuongDoanVien
FROM Tinh t
INNER JOIN DoanVien dv ON t.MaTinh = dv.MaTinh
GROUP BY t.TenTinh
HAVING COUNT(dv.MaDoanVien) > 5;

--SUBQUERY - Lấy đoàn viên tham gia chương trình gần nhất
SELECT dv.HoTen, dv.NgaySinh, ct.TenCT
FROM DoanVien dv
INNER JOIN ThamGiaCT tg ON dv.MaDoanVien = tg.MaDoanVien
INNER JOIN ChuongTrinh ct ON tg.MaCT = ct.MaCT
WHERE ct.ThoiGian = (
    SELECT MAX(ThoiGian)
    FROM ChuongTrinh
);

