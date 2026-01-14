-- BTTH5-Nhom2.sql
-- A. CHUẨN BỊ

-- Tao CSDL
CREATE DATABASE TEST_XML
GO

-- Su Dung CSDL
USE TEST_XML
GO

-- Tao Bang KhoaHoc
CREATE TABLE KhoaHoc
(
    MaKhoaHoc INT IDENTITY(1,1) NOT NULL,
    TenKhoaHoc VARCHAR(200) NOT NULL,
    CONSTRAINT PK_KhoaHoc PRIMARY KEY(MaKhoaHoc)
)
GO

-- SinhVien
CREATE TABLE SinhVien
(
    MSSV BIGINT IDENTITY(1,1)NOT NULL CONSTRAINT PK_SinhVien PRIMARY KEY(MSSV),
    TenSV VARCHAR(200) NOT NULL,
    MaKhoaHoc INT NOT NULL CONSTRAINT FK_SinhVien_MaKhoaHoc FOREIGN KEY
    REFERENCES KhoaHoc(MaKhoaHoc)
)
GO

-- MonHoc
CREATE TABLE MonHoc
(
    MaMonHoc INT IDENTITY NOT NULL CONSTRAINT PK_MonHoc PRIMARY KEY(MaMonHoc),
    TenMonHoc VARCHAR(200)
)
GO

-- KhoaHocMonHoc
CREATE TABLE KhoaHocMonHoc
(
    MaKhoaHoc INT CONSTRAINT FK_KhoaHocMonHoc_MaKhoaHoc FOREIGN KEY REFERENCES
    KhoaHoc(MaKhoaHoc),
    MaMonHoc INT CONSTRAINT FK_KhoaHocMonHoc_MaMonHoc FOREIGN KEY REFERENCES
    MonHoc(MaMonHoc)
)
GO

-- Diem
CREATE TABLE Diem
(
    MSSV BIGINT CONSTRAINT FK_Diem_MSSV FOREIGN KEY REFERENCES SinhVien(MSSV),
    MaMonHoc INT CONSTRAINT FK_Diem_MaMonHoc FOREIGN KEY REFERENCES
    MonHoc(MaMonHoc),
    Diem INT
)
GO

-- QuanLySV
CREATE TABLE QuanLySV
(
    MSDH INT NOT NULL,
    TenDH VARCHAR(20),
    ChiTietSV XML
)
GO



-- B. THỰC HÀNH
-- Câu 1.


-- Câu 2.


-- Câu 3.


-- Câu 4.


-- Câu 5.


-- Câu 6.


-- Câu 7.


-- Câu 8.


-- Câu 9.


-- Câu 10.


-- Câu 11.

