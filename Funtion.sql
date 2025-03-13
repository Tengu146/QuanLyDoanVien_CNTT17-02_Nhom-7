--1. Hàm này sẽ trả về tuổi của một đoàn viên dựa trên NgaySinh và ngày hiện tại.
CREATE FUNCTION FN_TinhTuoiDoanVien (@MaDoanVien INT)
RETURNS INT
AS
BEGIN
    DECLARE @Tuoi INT;
    SELECT @Tuoi = DATEDIFF(YEAR, NgaySinh, GETDATE())
    FROM DoanVien
    WHERE MaDoanVien = @MaDoanVien;
    RETURN @Tuoi;
END;
GO

-- Cách sử dụng:
SELECT HoTen, dbo.FN_TinhTuoiDoanVien(MaDoanVien) AS Tuoi
FROM DoanVien;

--2. Hàm này trả về số lượng đoàn viên dựa trên trạng thái (TrangThai).
CREATE FUNCTION FN_DemDoanVienTheoTrangThai (@TrangThai NVARCHAR(50))
RETURNS INT
AS
BEGIN
    DECLARE @SoLuong INT;
    SELECT @SoLuong = COUNT(*)
    FROM DoanVien
    WHERE TrangThai = @TrangThai;
    RETURN @SoLuong;
END;
GO

-- Cách sử dụng:
SELECT dbo.FN_DemDoanVienTheoTrangThai(N'Đang hoạt động') AS SoLuongDangHoatDong;
SELECT dbo.FN_DemDoanVienTheoTrangThai(N'Đã rút') AS SoLuongDaRut;


--3. Hàm này trả về danh sách tên đoàn viên tham gia một chương trình cụ thể dựa trên MaCT.
CREATE FUNCTION FN_DanhSachThamGiaChuongTrinh (@MaCT INT)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @DanhSach NVARCHAR(MAX) = '';
    
    -- Ghép danh sách tên đoàn viên
    SELECT @DanhSach = @DanhSach + HoTen + ', '
    FROM DoanVien dv
    INNER JOIN ThamGiaCT tg ON dv.MaDoanVien = tg.MaDoanVien
    WHERE tg.MaCT = @MaCT;
    
    -- Kiểm tra nếu danh sách không rỗng thì xóa dấu phẩy cuối
    IF LEN(@DanhSach) > 0
        SET @DanhSach = LEFT(@DanhSach, LEN(@DanhSach) - 2); -- Xóa ', '
    ELSE
        SET @DanhSach = N'Chưa có đoàn viên tham gia';
    
    RETURN @DanhSach;
END;
GO

-- Cách sử dụng:
SELECT TenCT, dbo.FN_DanhSachThamGiaChuongTrinh(MaCT) AS DanhSachThamGia
FROM ChuongTrinh;

--4. Hàm này trả về số lượng chương trình mà một đoàn viên đã tham gia.
CREATE FUNCTION FN_TongChuongTrinhThamGia (@MaDoanVien INT)
RETURNS INT
AS
BEGIN
    DECLARE @Tong INT;
    SELECT @Tong = COUNT(*)
    FROM ThamGiaCT
    WHERE MaDoanVien = @MaDoanVien;
    RETURN @Tong;
END;
GO

-- Cách sử dụng:
SELECT HoTen, dbo.FN_TongChuongTrinhThamGia(MaDoanVien) AS SoChuongTrinh
FROM DoanVien;

--5. Hàm này trả về trạng thái của chương trình dựa trên ThoiGian so với ngày hiện tại.
CREATE FUNCTION FN_KiemTraTrangThaiChuongTrinh (@MaCT INT)
RETURNS NVARCHAR(50)
AS
BEGIN
    DECLARE @TrangThai NVARCHAR(50);
    DECLARE @ThoiGian DATETIME;
    SELECT @ThoiGian = ThoiGian
    FROM ChuongTrinh
    WHERE MaCT = @MaCT;

    SET @TrangThai = CASE
        WHEN @ThoiGian < GETDATE() THEN N'Đã hoàn thành'
        WHEN CONVERT(DATE, @ThoiGian) = CONVERT(DATE, GETDATE()) THEN N'Đang diễn ra'
        ELSE N'Sắp diễn ra'
    END;
    RETURN @TrangThai;
END;
GO

-- Cách sử dụng:
SELECT TenCT, dbo.FN_KiemTraTrangThaiChuongTrinh(MaCT) AS TrangThai
FROM ChuongTrinh;

--6. Hàm này trả về thông tin chi tiết của đoàn viên dưới dạng chuỗi (họ tên, ngày sinh, quê quán).
CREATE FUNCTION FN_ThongTinDoanVien (@MaDoanVien INT)
RETURNS NVARCHAR(255)
AS
BEGIN
    DECLARE @ThongTin NVARCHAR(255);
    SELECT @ThongTin = HoTen + ' - ' + CONVERT(NVARCHAR(10), NgaySinh, 103) + ' - ' + QueQuan
    FROM DoanVien
    WHERE MaDoanVien = @MaDoanVien;
    RETURN @ThongTin;
END;
GO

-- Cách sử dụng:
SELECT dbo.FN_ThongTinDoanVien(6) AS ThongTin;


