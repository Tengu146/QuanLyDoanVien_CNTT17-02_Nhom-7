-- Sao lưu toàn bộ cơ sở dữ liệu QuanLyDoanVien vào file
BACKUP DATABASE QuanLyDoanVien
TO DISK = 'C:\VJET_Y2\Ky_2\hệ quản trị dữ liệu\BTL\QuanLyDoanVien_FullBackup.bak'
WITH FORMAT, 
     NAME = 'Full Backup of QuanLyDoanVien',
     STATS = 10; -- Hiển thị tiến trình mỗi 10%
GO

-- Sao lưu các thay đổi kể từ lần sao lưu toàn phần cuối cùng
BACKUP DATABASE QuanLyDoanVien
TO DISK = 'C:\VJET_Y2\Ky_2\hệ quản trị dữ liệu\BTL\QuanLyDoanVien_DiffBackup.bak'
WITH DIFFERENTIAL, 
     NAME = 'Differential Backup of QuanLyDoanVien',
     STATS = 10;
GO

--Phục hồi từ bản sao lưu toàn phần + khác biệt
USE master;
GO
-- Đảm bảo cơ sở dữ liệu ở trạng thái đơn người dùng
ALTER DATABASE QuanLyDoanVien 
SET SINGLE_USER 
WITH ROLLBACK IMMEDIATE;
GO

-- Phục hồi bản sao lưu toàn phần (chưa hoàn tất)
RESTORE DATABASE QuanLyDoanVien
FROM DISK = 'C:\VJET_Y2\Ky_2\hệ quản trị dữ liệu\BTL\QuanLyDoanVien_FullBackup.bak'
WITH REPLACE,  -- Ghi đè nếu cần, tránh lỗi tail log
     NORECOVERY; -- Chưa hoàn tất để áp dụng bản khác biệt
GO

-- Phục hồi bản sao lưu khác biệt (hoàn tất)
RESTORE DATABASE QuanLyDoanVien
FROM DISK = 'C:\VJET_Y2\Ky_2\hệ quản trị dữ liệu\BTL\QuanLyDoanVien_DiffBackup.bak'
WITH RECOVERY; -- Hoàn tất phục hồi
GO

-- Đưa cơ sở dữ liệu về chế độ đa người dùng
ALTER DATABASE QuanLyDoanVien 
SET MULTI_USER;
GO