= Phần 1
<phan-1>

== CREATE - Tạo Các Quan Hệ
<create-tao-cac-quan-he>


=== `SINHVIEN`
<sinhvien>

```sql
-- 1. SINHVIEN
CREATE TABLE SINHVIEN (
    MSSV CHAR(8) PRIMARY KEY,
    TENSV NVARCHAR(30) NOT NULL,
    SODT VARCHAR(10) NOT NULL,
    LOP CHAR(10) NOT NULL,
    DIACHI NCHAR(50)
);
```

=== `DETAI`
<detai>

```sql
CREATE TABLE DETAI (
    MSDT CHAR(6) PRIMARY KEY,
    TENDT NVARCHAR(30) NOT NULL
);
```

=== `SV_DETAI`
<sv-detai>

```sql
CREATE TABLE SV_DETAI (
    MSSV CHAR(8),
    MSDT CHAR(6),
    PRIMARY KEY (MSSV, MSDT),
    CONSTRAINT FK_SV_DETAI_SV  FOREIGN KEY (MSSV) REFERENCES SINHVIEN(MSSV),
    CONSTRAINT FK_SV_DETAI_DT  FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);
```

=== `HOCHAM`
<hocham>

```sql
CREATE TABLE HOCHAM (
    MSHH INT PRIMARY KEY,
    TENHH NVARCHAR(20) NOT NULL
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
