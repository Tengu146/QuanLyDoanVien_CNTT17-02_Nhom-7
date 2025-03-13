--View 1: Danh sách đoàn viên cơ bản
CREATE VIEW VW_DanhSachDoanVien AS
SELECT MaDoanVien, HoTen, NgaySinh, QueQuan, TrangThai
FROM DoanVien;
GO 

SELECT * FROM VW_DanhSachDoanVien;
--View 2: Thông tin chương trình sắp diễn ra
CREATE VIEW VW_ChuongTrinhSapDienRa AS
SELECT TenCT, ThoiGian, DiaDiem
FROM ChuongTrinh
WHERE TrangThai = N'Sắp diễn ra';
GO

SELECT * FROM VW_ChuongTrinhSapDienRa;
--View 3: Đoàn viên theo tỉnh
CREATE VIEW VW_DoanVienTheoTinh AS
SELECT t.TenTinh, COUNT(dv.MaDoanVien) AS SoLuongDoanVien
FROM Tinh t
LEFT JOIN DoanVien dv ON t.MaTinh = dv.MaTinh
GROUP BY t.TenTinh;
GO

SELECT * FROM VW_DoanVienTheoTinh;
--View 4: Thống kê tham gia chương trình
CREATE VIEW VW_ThongKeThamGia AS
SELECT c.TenCT, COUNT(tg.MaDoanVien) AS SoLuongThamGia
FROM ChuongTrinh c
LEFT JOIN ThamGiaCT tg ON c.MaCT = tg.MaCT
GROUP BY c.TenCT;
GO
 
SELECT * FROM VW_ThongKeThamGia;
--View 5: Đoàn viên tổ chức chương trình
CREATE VIEW VW_DoanVienToChuc AS
SELECT dv.HoTen, c.TenCT, c.ThoiGian
FROM DoanVien dv
INNER JOIN ToChucCT tc ON dv.MaDoanVien = tc.MaDoanVien
INNER JOIN ChuongTrinh c ON tc.MaCT = c.MaCT;
GO

SELECT * FROM VW_DoanVienToChuc;
--View 6: Đoàn viên quá tuổi
CREATE VIEW VW_DoanVienQuaTuoi AS
SELECT HoTen, NgaySinh, TrangThai
FROM DoanVien
WHERE DATEDIFF(YEAR, NgaySinh, GETDATE()) > 30;
GO

SELECT * FROM VW_DoanVienQuaTuoi;
--View 7: Thống kê đoàn viên theo dân tộc và tôn giáo
CREATE VIEW VW_ThongKeDanTocTonGiao AS
SELECT dt.TenDanToc, tg.TenTonGiao, COUNT(dv.MaDoanVien) AS SoLuong
FROM DoanVien dv
INNER JOIN DanToc dt ON dv.MaDanToc = dt.MaDanToc
INNER JOIN TonGiao tg ON dv.MaTonGiao = tg.MaTonGiao
GROUP BY dt.TenDanToc, tg.TenTonGiao;
GO

SELECT * FROM VW_ThongKeDanTocTonGiao;
--View 8: Chương trình và đánh giá chi tiết
CREATE VIEW VW_ChuongTrinhVaDanhGia AS
SELECT c.TenCT, c.ThoiGian, tg.DanhGia, dv.HoTen
FROM ChuongTrinh c
INNER JOIN ThamGiaCT tg ON c.MaCT = tg.MaCT
INNER JOIN DoanVien dv ON tg.MaDoanVien = dv.MaDoanVien;
GO

SELECT * FROM VW_ChuongTrinhVaDanhGia;