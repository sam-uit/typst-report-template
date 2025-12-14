= Phần 1
<phan-1>

== CREATE - Tạo Các Quan Hệ
<create-tao-cac-quan-he>

(Đây là các ví dụ, không phải bài làm cuối cùng).

=== `SINHVIEN`
<sinhvien>

```sql
-- 1. SINHVIEN
CREATE TABLE SINHVIEN (
    -- Khóa chính
    MSSV char(8) PRIMARY KEY,
    -- Tên sinh viên
    TENSV nvarchar(30) NOT NULL,
    SODT varchar(10),
    LOP char(10) NOT NULL,
    DIACHI nchar(50) NOT NULL
);
```

=== `DETAI`
<detai>

```sql
-- 2. DETAI
CREATE TABLE DETAI (
    -- Khóa chính
    MSDT char(6) PRIMARY KEY,
    -- Tên đề tài
    TENDT nvarchar(30) NOT NULL
```

=== `SV_DETAI`
<sv-detai>

```sql
-- 3. SV_DETAI
CREATE TABLE SV_DETAI (
    MSSV char(8),
    MSDT char(6),
    -- Khóa chính là cặp (MSSV, MSDT)
    PRIMARY KEY (MSSV, MSDT),
    FOREIGN KEY (MSSV) REFERENCES SINHVIEN(MSSV),
    FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);
```

=== `HOCHAM`
<hocham>

```sql
-- 4. HOCHAM
-- GIAOVIEN tham chiếu đến HOCHAM
CREATE TABLE HOCHAM (
    MSHH int PRIMARY KEY,
    TENHH nvarchar(20) NOT NULL
);
```

== INSERT - Thêm Dữ Liệu
<insert-them-du-lieu>


=== Table `SINHVIEN`
<table-sinhvien>


=== Table `DETAI`
<table-detai>


=== Table `SV_DETAI`
<table-sv-detai>


=== Table `HOCHAM`
<table-hocham>


=== Table `GIAOVIEN`
<table-giaovien>


=== Table `HOCVI`
<table-hocvi>


=== Table `CHUYENNGANH`
<table-chuyennganh>


=== Table `GV_HV_CN`
<table-gv-hv-cn>


=== Table `GV_HDDT`
<table-gv-hddt>


=== Table `GV_PBDT`
<table-gv-pbdt>


=== Table `GV_UVDT`
<table-gv-uvdt>


=== Table `HOIDONG`
<table-hoidong>


=== Table `HOIDONG_GV`
<table-hoidong-gv>


=== Table `HOIDONG_DT`
<table-hoidong-dt>
