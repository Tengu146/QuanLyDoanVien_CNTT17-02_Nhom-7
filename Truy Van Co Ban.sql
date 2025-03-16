--SELECT - Đếm số thành viên theo tỉnh
SELECT t.TenTinh, COUNT(dv.MaDoanVien) AS SoLuongDoanVien  
FROM Tinh t  
INNER JOIN DoanVien dv ON t.MaTinh = dv.MaTinh  
GROUP BY t.TenTinh;  

-- INSERT
INSERT INTO Tinh (TenTinh) VALUES ('Bình Dương');
INSERT INTO DoanVien (HoTen, NgaySinh, QueQuan, MaTinh, MaDanToc, MaTonGiao) VALUES ('Nguyễn Văn Z', '2005-01-01', 'Thủ Dầu Một', (SELECT MaTinh FROM Tinh WHERE TenTinh = 'Bình Dương'), 1, 1);
INSERT INTO ChuongTrinh (TenCT, ThoiGian, DiaDiem) VALUES ('Hội thảo kỹ năng mới', '2025-12-31 10:00:00', 'Bình Dương');
INSERT INTO ToChucCT (MaDoanVien, MaCT) VALUES ((SELECT MaDoanVien FROM DoanVien WHERE HoTen = 'Nguyễn Văn Z'), (SELECT MaCT FROM ChuongTrinh WHERE TenCT = 'Hội thảo kỹ năng mới'));
INSERT INTO ThamGiaCT (MaDoanVien, MaCT, DanhGia) VALUES (1, (SELECT MaCT FROM ChuongTrinh WHERE TenCT = 'Hội thảo kỹ năng mới'), 'Rất tốt');

-- UPDATE
UPDATE Tinh SET TenTinh = 'Thành phố Hồ Chí Minh' WHERE TenTinh = 'Hồ Chí Minh';
UPDATE DoanVien SET NgaySinh = '1999-01-01' WHERE HoTen = 'Nguyễn Văn An';
UPDATE ThamGiaCT SET DanhGia = 'Không tốt' WHERE MaDoanVien = 11 AND MaCT = (SELECT MaCT FROM ChuongTrinh WHERE TenCT = 'Hội thảo kỹ năng mới');

-- DELETE (cần kiểm tra ràng buộc trước khi xóa)
-- Kiểm tra trước khi xóa tỉnh
SELECT * FROM DoanVien WHERE MaTinh = (SELECT MaTinh FROM Tinh WHERE TenTinh = 'Hải Phòng');
-- Xóa đoàn viên trước nếu cần thiết, hoặc sử dụng ON DELETE CASCADE
DELETE FROM DoanVien WHERE MaDoanVien = 16;
DELETE FROM ChuongTrinh WHERE MaCT = 1;
DELETE FROM Tinh WHERE MaTinh = 1;  