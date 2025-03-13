--Index 1: Tìm kiếm đoàn viên theo họ tên
CREATE INDEX IDX_DoanVien_HoTen ON DoanVien(HoTen);
--Index 2: Tìm kiếm đoàn viên theo ngày sinh
CREATE INDEX IDX_DoanVien_NgaySinh  ON DoanVien(NgaySinh);
--Index 3: Tối ưu hóa truy vấn theo tỉnh
CREATE INDEX IDX_DoanVien_MaTinh ON DoanVien(MaTinh);
--Index 4: Tối ưu hóa truy vấn chương trình theo thời gian
CREATE INDEX IDX_ChuongTrinh_ThoiGian ON ChuongTrinh(ThoiGian);
--Index 5: Tối ưu hóa truy vấn tham gia chương trình
CREATE INDEX IDX_ThamGiaCT_MaCT ON ThamGiaCT(MaCT);
--Index 6: Tối ưu hóa truy vấn tổ chức chương trình
CREATE INDEX IDX_ToChucCT_MaDoanVien ON ToChucCT(MaDoanVien);
--Index 7: Tìm kiếm chương trình theo tên
CREATE INDEX IDX_ChuongTrinh_TenCT ON ChuongTrinh(TenCT);
--Index 8: Tối ưu hóa truy vấn trạng thái đoàn viên
CREATE INDEX IDX_DoanVien_TrangThai ON DoanVien(TrangThai);


SELECT name AS IndexName, type_desc AS IndexType
FROM sys.indexes
WHERE object_id = OBJECT_ID('DoanVien');

SELECT HoTen, NgaySinh
FROM DoanVien
WHERE HoTen LIKE N'Nguyễn%';

