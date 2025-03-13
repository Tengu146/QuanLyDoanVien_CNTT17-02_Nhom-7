--Hiện tại, các bảng không có ràng buộc kiểm tra để đảm bảo dữ liệu hợp lệ. Ví dụ:
--Trong bảng DoanVien, cột NgaySinh nên có ràng buộc để đảm bảo ngày sinh không lớn hơn ngày hiện tại 
--và đoàn viên phải đủ tuổi tối thiểu (thường là 15 tuổi cho đoàn viên).

ALTER TABLE DoanVien
ADD CONSTRAINT CHK_NgaySinh CHECK (NgaySinh <= GETDATE() AND DATEDIFF(YEAR, NgaySinh, GETDATE()) >= 15);

--Thêm cột TrangThai vào bảng DoanVien để theo dõi trạng thái đoàn viên 
--(ví dụ: "Đang hoạt động", "Đã rút", "Tạm nghỉ") sẽ giúp quản lý tốt hơn.
--Tương tự, bảng ChuongTrinh có thể thêm cột TrangThai 
--(ví dụ: "Sắp diễn ra", "Đang diễn ra", "Đã hoàn thành").
ALTER TABLE DoanVien
ADD TrangThai NVARCHAR(50) DEFAULT N'Đang hoạt động';
ALTER TABLE ChuongTrinh
ADD TrangThai NVARCHAR(50) DEFAULT N'Sắp diễn ra';

--Trigger: kiểm ra hoạt động của đoạt viên mỗi khi thêm vào 
CREATE TRIGGER TR_UpdateTrangThaiDoanVien
ON DoanVien
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE DoanVien
    SET TrangThai = CASE
        WHEN DATEDIFF(YEAR, i.NgaySinh, GETDATE()) > 30 THEN N'Đã rút'
        ELSE N'Đang hoạt động'
    END
    FROM DoanVien d
    INNER JOIN inserted i ON d.MaDoanVien = i.MaDoanVien;
END;
GO

--Trigger: tự động cập nhật trạng thái của chương trình theo thời gian mà không cần cập nhật thủ công
CREATE TRIGGER TR_UpdateTrangThaiChuongTrinh
ON ChuongTrinh
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE ChuongTrinh
    SET TrangThai = CASE
        WHEN i.ThoiGian < GETDATE() THEN N'Đã hoàn thành'
        WHEN CONVERT(DATE, i.ThoiGian) = CONVERT(DATE, GETDATE()) THEN N'Đang diễn ra'
        ELSE N'Sắp diễn ra'
    END
    FROM ChuongTrinh c
    INNER JOIN inserted i ON c.MaCT = i.MaCT;
END;
GO


select * from Doanvien  
select * from ChuongTrinh