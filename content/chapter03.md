# Câu 3. An Ninh Thông Tin

Dựa vào CSDL đã thiết kế ở BTTH số 2 (QLĐT), hãy thực hiện các yêu cầu sau:

1. Tạo ra 3 users: `GIANGVIEN`, `GIAOVU` và `SINHVIEN`, đặt *mật khẩu tuỳ ý*.
2. Phân quyền cho các users trên database như sau:
    - `GIAOVU` có quyền xem và chỉnh sửa (cập nhật) trên tất cả các bảng
    - `GIANGVIEN`:
        - Có quyền xem trên các bảng có liên quan đến thông tin GV, các đề tài mà GV hướng dẫn, phản biện hay làm uỷ viên, xem thông tin hội đồng và danh sách các đề tài hiện có.
        - Có quyền cập nhật thông tin của mình.
    - `SINHVIEN` có quyền xem thông tin của sinh viên, thông tin của hội đồng và danh sách các đề tài hiện có.
    - Tất cả người dùng trên đều không có quyền xoá thông tin.

## Tạo Ra 3 Users

Yêu cầu:

- Tạo ra 3 users: `GIANGVIEN`, `GIAOVU` và `SINHVIEN`, đặt *mật khẩu tuỳ ý*.

Thực hiện:

- Trước khi tạo 3 user ta tạo 3 login đăng nhập trên SERVER.

```sql
CREATE LOGIN GIANGVIEN WITH PASSWORD = 'gvi123';
CREATE LOGIN GIAOVU WITH PASSWORD = 'gvu123';
CREATE LOGIN SINHVIEN WITH PASSWORD = 'SV123';
GO
```

- Tạo 3 user trên DATABASE.

```sql
CREATE USER GIANGVIEN FOR LOGIN GIANGVIEN;
CREATE USER GIAOVU FOR LOGIN GIAOVU;
CREATE USER SINHVIEN FOR LOGIN SINHVIEN;
GO
```

- Kiểm tra 3 login đã tạo trên SERVER chưa.

```sql
SELECT name 
FROM sys.server_principals
WHERE name IN ('GIANGVIEN', 'GIAOVU', 'SINHVIEN');
```

- Kiểm tra 3 user đã tạo trên DATABASE chưa.

```sql
SELECT name 
FROM sys.database_principals
WHERE name IN ('GIANGVIEN', 'GIAOVU', 'SINHVIEN');
```

## Phân Quyền Cho Các Users Trên Database

### GIAOVU

```sql
-- 3.2.1 GIAOVU có quyền xem và chỉnh sửa (cập nhật) trên tất cả các bảng
GRANT SELECT, UPDATE ON SV_DETAI TO GIAOVU;
GRANT SELECT, UPDATE ON SINHVIEN TO GIAOVU;
GRANT SELECT, UPDATE ON HOIDONG_GV TO GIAOVU;
GRANT SELECT, UPDATE ON HOIDONG_DT TO GIAOVU;
GRANT SELECT, UPDATE ON HOIDONG TO GIAOVU;
GRANT SELECT, UPDATE ON HOCVI TO GIAOVU;
GRANT SELECT, UPDATE ON HOCHAM TO GIAOVU;
GRANT SELECT, UPDATE ON GV_UVDT TO GIAOVU;
GRANT SELECT, UPDATE ON GV_PBDT TO GIAOVU;
GRANT SELECT, UPDATE ON GV_HV_CN TO GIAOVU;
GRANT SELECT, UPDATE ON GV_HDDT TO GIAOVU;
GRANT SELECT, UPDATE ON GIAOVIEN TO GIAOVU;
GRANT SELECT, UPDATE ON DETAI_DIEM TO GIAOVU;
GRANT SELECT, UPDATE ON DETAI TO GIAOVU;
GRANT SELECT, UPDATE ON CHUYENNGANH TO GIAOVU;
```

```sql
----test GIAOVU XEM ĐƯỢC Bảng
EXECUTE AS USER = 'GIAOVU';
SELECT * FROM GIAOVIEN;
REVERT;
```

```sql
----test GIAOVU Cập Nhập được
EXECUTE AS USER = 'GIAOVU';
UPDATE GIAOVIEN 
SET TENGV = TENGV 
WHERE MSGV = '001';
REVERT;
```

### GIANGVIEN

1. Có quyền xem trên các bảng có liên quan đến thông tin GV, các đề tài mà GV hướng dẫn, phản biện hay làm uỷ viên, xem thông tin hội đồng và danh sách các đề tài hiện có.

```sql
-- 1.1) Thông tin giảng viên (và các bảng mô tả thông tin GV nếu cần)
GRANT SELECT ON GIAOVIEN TO GIANGVIEN;
GRANT SELECT ON HOCHAM TO GIANGVIEN;
GRANT SELECT ON CHUYENNGANH TO GIANGVIEN;
GRANT SELECT ON GV_HV_CN TO GIANGVIEN; 
```

```sql
--1.2) Danh sách đề tài hiện có + thông tin chi tiết đề tài
GRANT SELECT ON DETAI TO GIANGVIEN;
GRANT SELECT ON DETAI_DIEM  TO GIANGVIEN; 
GRANT SELECT ON SV_DETAI TO GIANGVIEN; 
```

```sql
--1.3) Các đề tài GV hướng dẫn / phản biện / uỷ viên
GRANT SELECT ON GV_HDDT  TO GIANGVIEN; 
GRANT SELECT ON GV_PBDT  TO GIANGVIEN;  
GRANT SELECT ON GV_UVDT  TO GIANGVIEN; 
```

```sql
--1.44) Thông tin hội đồng + danh sách đề tài trong hội đồng + GV trong hội đồng
GRANT SELECT ON HOIDONG TO GIANGVIEN;
GRANT SELECT ON HOIDONG_DT TO GIANGVIEN;
GRANT SELECT ON HOIDONG_GV  TO GIANGVIEN;
```

2. Có quyền cập nhật thông tin của mình/tránh trường hợp được sửa hết nguyên bản giáo viên

Ý tưởng: Thêm cột đăng nhập vào bảng GIAOVIEN, gán tài khoản đăng nhập cho từng giáo viên, tạo bảng view thông tin của tôi.

2.1: thêm cột đăng nhập vào bảng GIAOVIEN

```sql
ALTER TABLE GIAOVIEN
ADD TenDangNhap VARCHAR(50);
```

2.2: Giả sử gán TenDangNhap = GIANGVIEN với MSGV là 201.

```sql
UPDATE GIAOVIEN
SET TenDangNhap = 'GIANGVIEN'
WHERE MSGV = '201'; 
```

2.3: tạo bảng View Thông tin của tôi

```sql
CREATE VIEW GV_ThongTinCuaToi
AS
SELECT MSGV, TENGV, DIACHI, SODT, NAMHH
FROM dbo.GIAOVIEN
WHERE TenDangNhap ='GIANGVIEN';
GO
```

2.4: Up thông tin GIAOVIEN theo tên đăng nhập trên view

```sql
GRANT SELECT, UPDATE ON GV_ThongTinCuaToi TO GIANGVIEN;
DENY UPDATE ON GIAOVIEN TO GIANGVIEN;
GO
```

2.5 Dùng tigger để up thông tin từ view xuống bảng giáo viên.

```sql
CREATE TRIGGER trg_Update_GV
ON GV_ThongTinCuaToi
INSTEAD OF UPDATE
AS
BEGIN
    UPDATE GIAOVIEN
    SET
        TENGV  = i.TENGV,
        DIACHI = i.DIACHI,
        SODT   = i.SODT,
        NAMHH  = i.NAMHH
    FROM inserted i
    WHERE GIAOVIEN.MSGV = i.MSGV
      AND GIAOVIEN.TenDangNhap = 'GIANGVIEN';
END;
GO
```

### SINHVIEN

```sql
GRANT SELECT ON SINHVIEN TO SINHVIEN;
GRANT SELECT ON HOIDONG TO SINHVIEN;
GRANT SELECT ON HOIDONG_DT TO SINHVIEN;
GRANT SELECT ON DETAI TO SINHVIEN;
```

### Tất Cả Người Dùng

- Tất cả người dùng trên đều không có quyền xoá thông tin.

#### GIAOVU

```sql
DENY DELETE ON CHUYENNGANH TO GIAOVU;
DENY DELETE ON DETAI TO GIAOVU;
DENY DELETE ON DETAI_DIEM TO GIAOVU;
DENY DELETE ON GIAOVIEN TO GIAOVU;
DENY DELETE ON GV_HDDT TO GIAOVU;
DENY DELETE ON GV_HV_CN TO GIAOVU;
DENY DELETE ON GV_PBDT TO GIAOVU;
DENY DELETE ON GV_UVDT TO GIAOVU;
DENY DELETE ON HOCHAM TO GIAOVU;
DENY DELETE ON HOCVI TO GIAOVU;
DENY DELETE ON HOIDONG TO GIAOVU;
DENY DELETE ON HOIDONG_DT TO GIAOVU;
DENY DELETE ON HOIDONG_GV TO GIAOVU;
DENY DELETE ON SINHVIEN TO GIAOVU;
DENY DELETE ON SV_DETAI TO GIAOVU;
GO
```

#### GIANGVIEN

```sql
DENY DELETE ON GIAOVIEN TO GIANGVIEN;
DENY DELETE ON DETAI TO GIANGVIEN;
DENY DELETE ON HOIDONG TO GIANGVIEN;
DENY DELETE ON HOIDONG_DT TO GIANGVIEN;
DENY DELETE ON HOIDONG_GV TO GIANGVIEN;
DENY DELETE ON GV_HDDT TO GIANGVIEN;
DENY DELETE ON GV_PBDT TO GIANGVIEN;
DENY DELETE ON GV_UVDT TO GIANGVIEN;
DENY DELETE ON DETAI_DIEM TO GIANGVIEN;
DENY DELETE ON SV_DETAI TO GIANGVIEN;
GO
```

#### SINHVIEN

```sql
DENY DELETE ON SINHVIEN TO SINHVIEN;
DENY DELETE ON HOIDONG TO SINHVIEN;
DENY DELETE ON HOIDONG_DT TO SINHVIEN;
DENY DELETE ON DETAI TO SINHVIEN;
GO
```
