# Phần 1
<phan-1>

## CREATE - Tạo Các Quan Hệ

(Đây là các ví dụ, không phải bài làm hoàn thiện).

### `SINHVIEN`

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

### `DETAI`

```sql
-- 2. DETAI
CREATE TABLE DETAI (
    -- Khóa chính
    MSDT char(6) PRIMARY KEY,
    -- Tên đề tài
    TENDT nvarchar(30) NOT NULL
```

### `SV_DETAI`

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

### `HOCHAM`

```sql
-- 4. HOCHAM
-- GIAOVIEN tham chiếu đến HOCHAM
CREATE TABLE HOCHAM (
    MSHH int PRIMARY KEY,
    TENHH nvarchar(20) NOT NULL
);
```

## INSERT - Thêm Dữ Liệu

### Table `SINHVIEN`

### Table `DETAI`

### Table `SV_DETAI`

### Table `HOCHAM`

### Table `GIAOVIEN`

### Table `HOCVI`

### Table `CHUYENNGANH`

### Table `GV_HV_CN`

### Table `GV_HDDT`

### Table `GV_PBDT`

### Table `GV_UVDT`

### Table `HOIDONG`

### Table `HOIDONG_GV`

### Table `HOIDONG_DT`
