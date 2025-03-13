
USE QuanLyDoanVien;
GO

-- Bảng lưu thông tin tỉnh
CREATE TABLE Tinh (
    MaTinh INT PRIMARY KEY IDENTITY(1,1),
    TenTinh NVARCHAR(50) NOT NULL -- Sử dụng NVARCHAR để hỗ trợ tiếng Việt
);

-- Bảng lưu thông tin dân tộc
CREATE TABLE DanToc (
    MaDanToc INT PRIMARY KEY IDENTITY(1,1),
    TenDanToc NVARCHAR(50) NOT NULL
);

-- Bảng lưu thông tin tôn giáo
CREATE TABLE TonGiao (
    MaTonGiao INT PRIMARY KEY IDENTITY(1,1),
    TenTonGiao NVARCHAR(50) NOT NULL
);

-- Bảng lưu thông tin đoàn viên
CREATE TABLE DoanVien (
    MaDoanVien INT PRIMARY KEY IDENTITY(1,1),
    HoTen NVARCHAR(100) NOT NULL,
    NgaySinh DATE NOT NULL,
    QueQuan NVARCHAR(255) DEFAULT NULL,
    MaTinh INT DEFAULT NULL,
    MaDanToc INT DEFAULT NULL,
    MaTonGiao INT DEFAULT NULL,
    CONSTRAINT FK_DoanVien_Tinh FOREIGN KEY (MaTinh) REFERENCES Tinh(MaTinh) ON DELETE SET NULL,
    CONSTRAINT FK_DoanVien_DanToc FOREIGN KEY (MaDanToc) REFERENCES DanToc(MaDanToc) ON DELETE SET NULL,
    CONSTRAINT FK_DoanVien_TonGiao FOREIGN KEY (MaTonGiao) REFERENCES TonGiao(MaTonGiao) ON DELETE SET NULL
);

-- Bảng lưu thông tin các chương trình hoạt động
CREATE TABLE ChuongTrinh (
    MaCT INT PRIMARY KEY IDENTITY(1,1),
    TenCT NVARCHAR(255) NOT NULL,
    ThoiGian DATETIME NOT NULL,
    DiaDiem NVARCHAR(255) NOT NULL
);

-- Bảng trung gian quản lý đoàn viên tổ chức chương trình
CREATE TABLE ToChucCT (
    MaDoanVien INT,
    MaCT INT,
    PRIMARY KEY (MaDoanVien, MaCT),
    CONSTRAINT FK_ToChucCT_DoanVien FOREIGN KEY (MaDoanVien) REFERENCES DoanVien(MaDoanVien) ON DELETE CASCADE,
    CONSTRAINT FK_ToChucCT_ChuongTrinh FOREIGN KEY (MaCT) REFERENCES ChuongTrinh(MaCT) ON DELETE CASCADE
);

-- Bảng trung gian quản lý đoàn viên tham gia chương trình
CREATE TABLE ThamGiaCT (
    MaDoanVien INT,
    MaCT INT,
    DanhGia NVARCHAR(MAX), -- TEXT trong MySQL tương ứng với NVARCHAR(MAX) trong MS SQL
    PRIMARY KEY (MaDoanVien, MaCT),
    CONSTRAINT FK_ThamGiaCT_DoanVien FOREIGN KEY (MaDoanVien) REFERENCES DoanVien(MaDoanVien) ON DELETE CASCADE,
    CONSTRAINT FK_ThamGiaCT_ChuongTrinh FOREIGN KEY (MaCT) REFERENCES ChuongTrinh(MaCT) ON DELETE CASCADE
);

-- Tạo chỉ mục để tối ưu hóa tìm kiếm
CREATE INDEX idx_hoten ON DoanVien(HoTen);
GO

