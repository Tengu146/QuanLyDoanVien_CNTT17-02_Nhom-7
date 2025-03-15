-- Tạo login với tên 'Tengu' và mật khẩu 'Nguyenviet123'
CREATE LOGIN Tengu 
WITH PASSWORD = 'Nguyenviet123';
GO

-- Tạo user 'NguoiDung1' liên kết với login 'NguoiDung1'
CREATE USER Viet 
FOR LOGIN Tengu;
GO
-- Gán Viet quyền chỉ đọc
ALTER ROLE db_datareader ADD MEMBER Viet;
GO


-- Viet chỉ được đọc bảng DoanVien
GRANT SELECT ON DoanVien TO Viet;
GO

-- Tạo vai trò 'QuanLyDoanVienRole'
CREATE ROLE QuanLyDoanVienRole;
GO

-- Gán quyền cho vai trò
GRANT SELECT, INSERT, UPDATE ON DoanVien TO QuanLyDoanVienRole;
GRANT SELECT ON ChuongTrinh TO QuanLyDoanVienRole;
GO

-- Gán người dùng vào vai trò
ALTER ROLE QuanLyDoanVienRole ADD MEMBER Viet;
GO

-- Quyền của Viet
SELECT * 
FROM fn_my_permissions(NULL, 'DATABASE') 
WHERE principal_name = 'Viet';