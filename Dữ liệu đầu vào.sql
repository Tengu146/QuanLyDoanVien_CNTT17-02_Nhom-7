USE QuanLyDoanVien;
GO

-- Nhập dữ liệu vào bảng Tinh
INSERT INTO Tinh (TenTinh)
VALUES 
    (N'Hà Nội'), 
    (N'Hồ Chí Minh'), 
    (N'Đà Nẵng'), 
    (N'Hải Phòng'), 
    (N'Cần Thơ');
GO

-- Nhập dữ liệu vào bảng DanToc
INSERT INTO DanToc (TenDanToc)
VALUES 
    (N'Kinh'), 
    (N'Tày'), 
    (N'Thái'), 
    (N'H''Mông'), 
    (N'Ê Đê');
GO

-- Nhập dữ liệu vào bảng TonGiao
INSERT INTO TonGiao (TenTonGiao)
VALUES 
    (N'Không'), 
    (N'Phật giáo'), 
    (N'Công giáo'), 
    (N'Tin Lành'), 
    (N'Hòa Hảo');
GO

-- Nhập dữ liệu vào bảng DoanVien
INSERT INTO DoanVien (HoTen, NgaySinh, QueQuan, MaTinh, MaDanToc, MaTonGiao)
VALUES 
    (N'Nguyễn Văn An', '2000-05-15', N'Ba Đình', 1, 1, 1),
    (N'Trần Thị Bình', '1999-08-20', N'Quận 1', 2, 1, 2),
    (N'Lê Văn Cường', '2001-03-10', N'Hòa Khánh', 3, 2, 3),
    (N'Phạm Thị Dung', '2002-11-25', N'Hồng Bàng', 4, 1, 1),
    (N'Huỳnh Văn Em', '2000-07-30', N'Ninh Kiều', 5, 3, 4),
    (N'Ngô Thị Fleur', '1998-12-12', N'Thanh Xuân', 1, 1, 2),
    (N'Vũ Văn Giang', '2003-01-05', N'Quận 3', 2, 4, 1),
    (N'Đỗ Thị Hà', '2001-09-18', N'Hải Châu', 3, 1, 5),
    (N'Bùi Văn Hùng', '1999-04-22', N'Lê Chân', 4, 5, 3),
    (N'Hoàng Thị In', '2000-06-14', N'Bình Thủy', 5, 1, 1),
    (N'Nguyễn Thị Kim', '2002-02-28', N'Hoàn Kiếm', 1, 2, 2),
    (N'Trần Văn Long', '2001-10-10', N'Quận 7', 2, 1, 4),
    (N'Lê Thị Mai', '1998-03-15', N'Sơn Trà', 3, 3, 1),
    (N'Phạm Văn Nam', '2000-08-08', N'Ngô Quyền', 4, 1, 3),
    (N'Huỳnh Thị Oanh', '1999-11-20', N'Cái Răng', 5, 4, 2),
    (N'Ngô Văn Phát', '2001-07-07', N'Đống Đa', 1, 1, 1),
    (N'Vũ Thị Quỳnh', '2003-05-25', N'Tân Bình', 2, 5, 5),
    (N'Đỗ Văn Sơn', '2000-09-30', N'Thanh Khê', 3, 1, 2),
    (N'Bùi Thị Thảo', '1999-12-01', N'Kiến An', 4, 2, 1),
    (N'Hoàng Văn Tùng', '2002-04-15', N'Ô Môn', 5, 1, 3);
GO
INSERT INTO DoanVien (HoTen, NgaySinh, QueQuan, MaTinh, MaDanToc, MaTonGiao)
VALUES 
    (N'Nguyễn Văn Bình', '1995-06-10', N'Cầu Giấy', 1, 1, 1),
    (N'Trần Thị Hoa', '1996-09-15', N'Quận 10', 2, 1, 2),
    (N'Lê Văn Đức', '1994-03-20', N'Liên Chiểu', 3, 2, 3),
    (N'Phạm Thị Lan', '1997-11-05', N'Dương Kinh', 4, 1, 1),
    (N'Huỳnh Văn Tài', '1993-08-25', N'Thốt Nốt', 5, 3, 4);
GO
INSERT INTO DoanVien (HoTen, NgaySinh, QueQuan, MaTinh, MaDanToc, MaTonGiao)
VALUES 
    (N'Nguyễn Thị Ánh', '1998-04-12', N'Long Biên', 1, 1, 1),
    (N'Trần Văn Cường', '1996-07-25', N'Phú Nhuận', 2, 1, 2),
    (N'Lê Thị Duyên', '1994-09-30', N'Cẩm Lệ', 3, 2, 3),
    (N'Phạm Văn Đông', '1992-11-15', N'Đồ Sơn', 4, 1, 1),
    (N'Huỳnh Thị Giang', '1990-03-08', N'Phong Điền', 5, 3, 4),
    (N'Ngô Văn Hòa', '2000-01-20', N'Hai Bà Trưng', 1, 1, 2),
    (N'Vũ Thị Hương', '1997-05-10', N'Bình Thạnh', 2, 4, 1),
    (N'Đỗ Văn Khánh', '1995-08-18', N'Ngũ Hành Sơn', 3, 1, 5),
    (N'Bùi Thị Linh', '1993-12-22', N'An Dương', 4, 5, 3),
    (N'Hoàng Văn Minh', '1991-06-05', N'Cờ Đỏ', 5, 1, 1),
    (N'Nguyễn Văn Nam', '1999-02-14', N'Tây Hồ', 1, 2, 2),
    (N'Trần Thị Ngọc', '2001-10-28', N'Gò Vấp', 2, 1, 4),
    (N'Lê Văn Phú', '1998-03-17', N'Thanh Khê', 3, 3, 1),
    (N'Phạm Thị Quyên', '1996-07-09', N'Thủy Nguyên', 4, 1, 3),
    (N'Huỳnh Văn Sơn', '1994-11-11', N'Vĩnh Nghiêm', 5, 4, 2),
    (N'Ngô Thị Thảo', '2002-05-23', N'Hoàng Mai', 1, 1, 1),
    (N'Vũ Văn Thành', '2000-09-01', N'Thủ Đức', 2, 5, 5),
    (N'Đỗ Thị Thu', '1997-12-15', N'Hải Châu', 3, 1, 2),
    (N'Bùi Văn Tiến', '1995-04-27', N'Hồng Bàng', 4, 2, 1),
    (N'Hoàng Thị Uyên', '1993-08-19', N'Bình Thủy', 5, 1, 3);
GO

-- Nhập dữ liệu vào bảng ChuongTrinh
INSERT INTO ChuongTrinh (TenCT, ThoiGian, DiaDiem)
VALUES 
    (N'Trại hè thanh niên 2025', '2025-07-15 08:00:00', N'Hà Nội'),
    (N'Ngày hội tình nguyện', '2025-03-20 09:00:00', N'Hồ Chí Minh'),
    (N'Hội thảo kỹ năng', '2025-05-10 14:00:00', N'Đà Nẵng'),
    (N'Chiến dịch mùa hè xanh', '2025-08-01 07:00:00', N'Hải Phòng'),
    (N'Giao lưu văn hóa', '2025-06-25 18:00:00', N'Cần Thơ');
GO

-- Nhập dữ liệu vào bảng ToChucCT
INSERT INTO ToChucCT (MaDoanVien, MaCT)
VALUES 
    (1, 1),  -- Nguyễn Văn An tổ chức Trại hè
    (2, 2),  -- Trần Thị Bình tổ chức Ngày hội
    (3, 3),  -- Lê Văn Cường tổ chức Hội thảo
    (4, 4),  -- Phạm Thị Dung tổ chức Mùa hè xanh
    (5, 5),  -- Huỳnh Văn Em tổ chức Giao lưu
    (6, 1),  -- Ngô Thị Fleur tổ chức Trại hè
    (7, 2),  -- Vũ Văn Giang tổ chức Ngày hội
    (8, 3),  -- Đỗ Thị Hà tổ chức Hội thảo
    (9, 4),  -- Bùi Văn Hùng tổ chức Mùa hè xanh
    (10, 5); -- Hoàng Thị In tổ chức Giao lưu
GO

-- Nhập dữ liệu vào bảng ThamGiaCT
INSERT INTO ThamGiaCT (MaDoanVien, MaCT, DanhGia)
VALUES 
    (11, 1, N'Hoạt động rất bổ ích'),
    (12, 2, N'Tổ chức tốt, vui vẻ'),
    (13, 3, N'Học được nhiều kỹ năng'),
    (14, 4, N'Ý nghĩa, cần nhân rộng'),
    (15, 5, NULL),
    (16, 1, N'Rất hài lòng'),
    (17, 2, N'Không gian thân thiện'),
    (18, 3, N'Chương trình hay'),
    (19, 4, NULL),
    (20, 5, N'Tốt, cần cải thiện thời gian'),
    (1, 2, N'Ấn tượng'),
    (2, 3, N'Rất thú vị'),
    (3, 4, N'Có ý nghĩa cộng đồng'),
    (4, 5, NULL),
    (5, 1, N'Tuyệt vời');
GO
