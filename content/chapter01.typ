#import "../template/lib.typ": *

= A. Chuẩn Bị
<a-chuan-bi>

Mục tiêu:

- Chuẩn bị Cơ Sở Dữ Liệu

== Tạo Cơ Sở Dữ Liệu
<tao-co-so-du-lieu>

```sql
CREATE DATABASE TEST_XML
GO
USE TEST_XML
GO
```

== Tạo Các Bảng
<tao-cac-bang>


=== `KhoaHoc`
<khoahoc>

```sql
CREATE TABLE KhoaHoc
(
    MaKhoaHoc INT IDENTITY(1,1) NOT NULL,
    TenKhoaHoc VARCHAR(200) NOT NULL,
    CONSTRAINT PK_KhoaHoc PRIMARY KEY(MaKhoaHoc)
)
GO
```

=== `SinhVien`
<sinhvien>

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

=== `MonHoc`
<monhoc>

```sql
CREATE TABLE MonHoc
(
    MaMonHoc INT IDENTITY NOT NULL CONSTRAINT PK_MonHoc PRIMARY KEY(MaMonHoc),
    TenMonHoc VARCHAR(200)
)
GO
```

=== `KhoaHocMonHoc`
<khoahocmonhoc>

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

=== `Diem`
<diem>

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

=== `QuanLySV`
<quanlysv>

```sql
CREATE TABLE QuanLySV
(
    MSDH INT NOT NULL,
    TenDH VARCHAR(20),
    ChiTietSV XML
)
GO
```

=== Kết Quả: Danh Sách Các Bảng
<ket-qua-danh-sach-cac-bang>

#figure(image("assets/01-database-tables.png"),
  caption: [
    Phần A - Danh Sách Các Bảng
  ]
)

== Thêm Dữ Liệu
<them-du-lieu>


=== `KhoaHoc`
<khoahoc-1>

```sql
INSERT INTO KhoaHoc (TenKhoaHoc) SELECT 'Mang May Tinh Truyen Thong'
INSERT INTO KhoaHoc (TenKhoaHoc) SELECT 'Khoa Hoc May Tinh'
INSERT INTO KhoaHoc (TenKhoaHoc) SELECT 'Ky Thuat May Tinh'
GO
```

=== `SinhVien`
<sinhvien-1>

```sql
INSERT INTO SinhVien SELECT 'Anh',1
INSERT INTO SinhVien SELECT 'Son',2
INSERT INTO SinhVien SELECT 'Thuy',3
GO
```

=== `MonHoc`
<monhoc-1>

```sql
INSERT INTO MonHoc (TenMonHoc) SELECT ('Co So Du Lieu')
INSERT INTO MonHoc (TenMonHoc) SELECT ('Cau Truc Du Lieu')
INSERT INTO MonHoc (TenMonHoc) SELECT ('Lap Trinh Di Dong')
INSERT INTO MonHoc (TenMonHoc) SELECT ('Toan Giai Tich')
INSERT INTO MonHoc (TenMonHoc) SELECT ('Lap Trinh Java')
INSERT INTO MonHoc (TenMonHoc) SELECT ('He Quan Tri CSDL')
INSERT INTO MonHoc (TenMonHoc) SELECT ('Anh Van')
INSERT INTO MonHoc (TenMonHoc) SELECT ('Thiet Ke Web ')
INSERT INTO MonHoc (TenMonHoc) SELECT ('An Toan Thong Tin')
GO
```

=== `KhoaHocMonHoc`
<khoahocmonhoc-1>

```sql
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 1,1
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 1,2
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 1,3
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 2,4
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 2,5
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 2,6
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 3,7
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 3,8
INSERT INTO KhoaHocMonHoc (MaKhoaHoc,MaMonHoc) SELECT 3,9
GO
```

=== `Diem`
<diem-1>

```sql
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 1,1,75
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 1,2,80
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 1,3,70
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 2,4,80
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 2,5,80
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 2,6,90
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 3,7,80
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 3,8,80
INSERT INTO Diem (MSSV,MaMonHoc,Diem) SELECT 3,9,90
GO
```

=== `QuanLySV`
<quanlysv-1>

```sql
INSERT INTO QuanLySV VALUES (
    1,
    'DH CNTT',
    '<THONGTINSV>
        <sinhvien ID="10" Ten="Nam">
            <monhoc ID="1" Ten="Co So Du Lieu" />
            <monhoc ID="2" Ten="Cau Truc Du Lieu" />
            <monhoc ID="3" Ten="Lap Trinh Mobile" />
        </sinhvien>
        <sinhvien ID="11" Ten="An">
            <monhoc ID="4" Ten="Toan Giai Tich" />
            <monhoc ID="5" Ten="Lap Trinh Java" />
            <monhoc ID="6" Ten="He Quan Tri CSDL" />
        </sinhvien>
        <sinhvien ID="12" Ten="Thanh">
            <monhoc ID="7" Ten="Anh Van" />
            <monhoc ID="8" Ten="Thiet Ke Web" />
            <monhoc ID="9" Ten="An Toan Thong Tin" />
        </sinhvien>
    </THONGTINSV>'
)
INSERT INTO QuanLySV VALUES (
    2,
    'DH KHTN',
    '<THONGTINSV>
        <sinhvien ID="10" Ten="Khang">
            <monhoc ID="1" Ten="Co So Du Lieu" />
            <monhoc ID="2" Ten="Cau Truc Du Lieu" />
            <monhoc ID="3" Ten="Lap Trinh Mobile" />
        </sinhvien>
        <sinhvien ID="11" Ten="Vinh">
            <monhoc ID="4" Ten="Toan Giai Tich" />
            <monhoc ID="5" Ten="Lap Trinh Java" />
            <monhoc ID="6" Ten="He Quan Tri CSDL" />
        </sinhvien>
        <sinhvien ID="12" Ten="Hoa">
            <monhoc ID="7" Ten="Anh Van" />
            <monhoc ID="8" Ten="Thiet Ke Web" />
            <monhoc ID="9" Ten="An Toan Thong Tin" />
        </sinhvien>
    </THONGTINSV>'
)
GO
```
