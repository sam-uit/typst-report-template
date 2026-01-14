# A. Chuẩn Bị

Mục tiêu:

- Chuẩn bị Cơ Sở Dữ Liệu

## Tạo Cơ Sở Dữ Liệu

```sql
CREATE DATABASE TEST_XML
GO
USE TEST_XML
GO
```

## Tạo Các Bảng

### `KhoaHoc`

```sql
CREATE TABLE KhoaHoc
(
    MaKhoaHoc INT IDENTITY(1,1) NOT NULL,
    TenKhoaHoc VARCHAR(200) NOT NULL,
    CONSTRAINT PK_KhoaHoc PRIMARY KEY(MaKhoaHoc)
)
GO
```

### `SinhVien`

```sql
CREATE TABLE SinhVien
(
    MSSV BIGINT IDENTITY(1,1)NOT NULL CONSTRAINT PK_SinhVien PRIMARY KEY(MSSV),
    TenSV VARCHAR(200) NOT NULL,
    MaKhoaHoc INT NOT NULL CONSTRAINT FK_SinhVien_MaKhoaHoc FOREIGN KEY
    REFERENCES KhoaHoc(MaKhoaHoc)
)
GO
```

### `MonHoc`

```sql
CREATE TABLE MonHoc
(
    MaMonHoc INT IDENTITY NOT NULL CONSTRAINT PK_MonHoc PRIMARY KEY(MaMonHoc),
    TenMonHoc VARCHAR(200)
)
GO
```

### `KhoaHocMonHoc`

```sql
CREATE TABLE KhoaHocMonHoc
(
    MaKhoaHoc INT CONSTRAINT FK_KhoaHocMonHoc_MaKhoaHoc FOREIGN KEY REFERENCES
    KhoaHoc(MaKhoaHoc),
    MaMonHoc INT CONSTRAINT FK_KhoaHocMonHoc_MaMonHoc FOREIGN KEY REFERENCES
    MonHoc(MaMonHoc)
)
GO
```

### `Diem`

```sql
-- Diem
CREATE TABLE Diem
(
    MSSV BIGINT CONSTRAINT FK_Diem_MSSV FOREIGN KEY REFERENCES SinhVien(MSSV),
    MaMonHoc INT CONSTRAINT FK_Diem_MaMonHoc FOREIGN KEY REFERENCES
    MonHoc(MaMonHoc),
    Diem INT
)
GO
```

### `QuanLySV`

```sql
CREATE TABLE QuanLySV
(
    MSDH INT NOT NULL,
    TenDH VARCHAR(20),
    ChiTietSV XML
)
GO
```

## Thêm Dữ Liệu

