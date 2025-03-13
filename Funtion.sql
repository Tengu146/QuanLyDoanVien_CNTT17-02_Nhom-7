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