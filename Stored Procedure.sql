--SP 1: Lấy danh sách đoàn viên (không tham số)
CREATE PROCEDURE SP_DanhSachDoanVien
AS
BEGIN
    SELECT * FROM DoanVien;
END;
GO

EXEC SP_DanhSachDoanVien;
--SP 2: Thêm đoàn viên mới (có tham số)
CREATE PROCEDURE SP_ThemDoanVien
    @HoTen NVARCHAR(100),
    @NgaySinh DATE,
    @QueQuan NVARCHAR(255),
    @MaTinh INT,
    @MaDanToc INT,
    @MaTonGiao INT
AS
BEGIN
    INSERT INTO DoanVien (HoTen, NgaySinh, QueQuan, MaTinh, MaDanToc, MaTonGiao)
    VALUES (@HoTen, @NgaySinh, @QueQuan, @MaTinh, @MaDanToc, @MaTonGiao);
END;
GO

EXEC SP_ThemDoanVien N'Nguyễn Văn Test', '2000-01-01', N'Hà Nội', 1, 1, 1;
--SP 3: Cập nhật trạng thái chương trình (không tham số)
CREATE PROCEDURE SP_CapNhatTrangThaiChuongTrinh
AS
BEGIN
    UPDATE ChuongTrinh
    SET TrangThai = CASE
        WHEN ThoiGian < GETDATE() THEN N'Đã hoàn thành'
        WHEN CONVERT(DATE, ThoiGian) = CONVERT(DATE, GETDATE()) THEN N'Đang diễn ra'
        ELSE N'Sắp diễn ra'
    END;
END;
GO

EXEC SP_CapNhatTrangThaiChuongTrinh;
--SP 4: Xóa đoàn viên (có tham số)
CREATE PROCEDURE SP_XoaDoanVien
    @MaDoanVien INT
AS
BEGIN
    DELETE FROM DoanVien WHERE MaDoanVien = @MaDoanVien;
END;
GO

EXEC SP_XoaDoanVien 1;
--SP 5: Đếm đoàn viên theo trạng thái (có OUTPUT)
CREATE PROCEDURE SP_DemDoanVienTheoTrangThai
    @TrangThai NVARCHAR(50),
    @SoLuong INT OUTPUT
AS
BEGIN
    SELECT @SoLuong = COUNT(*)
    FROM DoanVien
    WHERE TrangThai = @TrangThai;
END;
GO

DECLARE @SoLuong INT;
EXEC SP_DemDoanVienTheoTrangThai N'Đang hoạt động', @SoLuong OUTPUT;
PRINT N'Số lượng đoàn viên đang hoạt động là: ' + CAST(@SoLuong AS NVARCHAR(10));
--SP 6: Lấy danh sách chương trình theo tỉnh (có tham số)
CREATE PROCEDURE SP_ChuongTrinhTheoTinh
    @MaTinh INT
AS
BEGIN
    SELECT c.TenCT, c.ThoiGian, c.DiaDiem
    FROM ChuongTrinh c
    WHERE c.DiaDiem IN (SELECT TenTinh FROM Tinh WHERE MaTinh = @MaTinh);
END;
GO

EXEC SP_ChuongTrinhTheoTinh 1;
--SP 7: Thêm tham gia chương trình (có tham số)
CREATE PROCEDURE SP_ThemThamGiaChuongTrinh
    @MaDoanVien INT,
    @MaCT INT,
    @DanhGia NVARCHAR(MAX)
AS
BEGIN
    INSERT INTO ThamGiaCT (MaDoanVien, MaCT, DanhGia)
    VALUES (@MaDoanVien, @MaCT, @DanhGia);
END;
GO

EXEC SP_ThemThamGiaChuongTrinh 1, 1, N'Rất tốt';
--SP 8: Tính tuổi trung bình đoàn viên (có OUTPUT)
CREATE PROCEDURE SP_TinhTuoiTrungBinh
    @TuoiTB FLOAT OUTPUT
AS
BEGIN
    SELECT @TuoiTB = AVG(DATEDIFF(YEAR, NgaySinh, GETDATE()))
    FROM DoanVien;
END;
GO

DECLARE @TuoiTB FLOAT;
EXEC SP_TinhTuoiTrungBinh @TuoiTB OUTPUT;
PRINT N'Tuổi trung bình là: ' + CONVERT(NVARCHAR(10), @TuoiTB);
--SP 9: Lấy đoàn viên tham gia nhiều chương trình nhất (không tham số)
CREATE PROCEDURE SP_DoanVienThamGiaNhieuNhat
AS
BEGIN
    SELECT TOP 1 dv.HoTen, COUNT(tg.MaCT) AS SoChuongTrinh
    FROM DoanVien dv
    INNER JOIN ThamGiaCT tg ON dv.MaDoanVien = tg.MaDoanVien
    GROUP BY dv.HoTen
    ORDER BY SoChuongTrinh DESC;
END;
GO

EXEC SP_DoanVienThamGiaNhieuNhat;
--SP 10: Cập nhật trạng thái đoàn viên quá tuổi (có OUTPUT)
CREATE PROCEDURE SP_CapNhatDoanVienQuaTuoi
    @SoLuongCapNhat INT OUTPUT
AS
BEGIN
    UPDATE DoanVien
    SET TrangThai = N'Đã rút'
    WHERE DATEDIFF(YEAR, NgaySinh, GETDATE()) > 30;
    
    SET @SoLuongCapNhat = @@ROWCOUNT;
END;
GO

DECLARE @SoLuong INT;
EXEC SP_CapNhatDoanVienQuaTuoi @SoLuong OUTPUT;
PRINT N'Số lượng cập nhật: ' + CAST(@SoLuong AS NVARCHAR(10));