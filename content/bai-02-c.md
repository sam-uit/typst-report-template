## C. TRIGGER

### Trigger khi Xóa Đề Tài

- Tạo Trigger thỏa mãn điều kiện khi xóa một đề tài (MSDT) sẽ xóa các thông tin liên quan.

Tham khảo: [INSTEAD OF](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-trigger-transact-sql?view=sql-server-ver17#instead-of).

#### Trigger

-- Xóa trigger đã tạo trước đó nếu đây là lần chạy thứ 2 trở lên. Đảm bảo luôn có duy nhất 1 trigger được tạo và mới nhất.

```sql
IF OBJECT_ID('BTTH2_TRG_XoaDeTai', 'TR') IS NOT NULL
    DROP TRIGGER BTTH2_TRG_XoaDeTai;
GO
```

- Tạo Trigger mới trên `DETAI`. DÙNG INSTEAD OF cho mục đích này.

```sql
CREATE TRIGGER BTTH2_TRG_XoaDeTai ON DETAI
INSTEAD OF DELETE
AS
BEGIN
    -- Xóa dữ liệu tham chiếu ở các bảng con dựa trên MSDT
    DELETE FROM SV_DETAI
    WHERE MSDT IN (SELECT MSDT FROM DELETED);

    DELETE FROM GV_HDDT
    WHERE MSDT IN (SELECT MSDT FROM DELETED);

    DELETE FROM GV_PBDT
    WHERE MSDT IN (SELECT MSDT FROM DELETED);

    DELETE FROM GV_UVDT
    WHERE MSDT IN (SELECT MSDT FROM DELETED);

    DELETE FROM HOIDONG_DT
    WHERE MSDT IN (SELECT MSDT FROM DELETED);

    -- Xóa chính đề tài đó trong bảng DETAI
    DELETE FROM DETAI
    WHERE MSDT IN (SELECT MSDT FROM DELETED);

    PRINT N'Thực thi BTTH2_TRG_XoaDeTai: Đã xóa đề tài và các dữ liệu liên quan.';
END;
GO
```

#### Ví dụ

```sql
-- Ví dụ: Xóa đề tài '97001' (Quản lý thư viện)
DELETE FROM DETAI WHERE MSDT = '97001';

-- Sau khi chạy, bạn có thể select lại để kiểm tra xem nó còn tồn tại không
SELECT * FROM DETAI;
SELECT * FROM SV_DETAI;
```

- MSDT 97001 không còn tồn tại trong DETAI:

```
MSDT    TENDT
97002   Nhận dạng vân tay
97003   Bán đấu giá trên mạng
97004   Quản lý siêu thị
97005   Xử lý ảnh
97006   Hệ giải toán thông minh
```

- MSDT 97001 không còn tồn tại trong SV_DETAI:

```
    MSSV    MSDT
13520001    97004
13520002    97005
13520004    97002
13520005    97003
13520006    97005
```

### Trigger thay đổi MSGV

- Tạo Trigger thỏa mãn ràng buộc là khi đổi 1 mã số giáo viên (`MSGV`) thì sẽ thay đổi các thông tin liên quan.

#### Trigger

```sql
CREATE TRIGGER trg_C2_CheckGVHVCN
ON GV_HV_CN
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @HasError int = 0;

    -- 1. Kiểm tra MSGV
    IF EXISTS (
        SELECT *
        FROM inserted AS i
        WHERE NOT EXISTS (SELECT 1 FROM GIAOVIEN WHERE MSGV = i.MSGV)
    )
    BEGIN
        RAISERROR(N'LỖI: Mã số giáo viên (MSGV) không tồn tại trong bảng GIAOVIEN.', 16, 1);
        SET @HasError = 1;
    END

    -- 2. Kiểm tra MSHV
    IF EXISTS (
        SELECT *
        FROM inserted AS i
        WHERE NOT EXISTS (SELECT 1 FROM HOCVI WHERE MSHV = i.MSHV)
    )
    BEGIN
        RAISERROR(N'LỖI: Mã số học vị (MSHV) không tồn tại trong bảng HOCVI.', 16, 1);
        SET @HasError = 1;
    END

    -- 3. Kiểm tra MSCN
    IF EXISTS (
        SELECT *
        FROM inserted AS i
        WHERE NOT EXISTS (SELECT 1 FROM CHUYENNGANH WHERE MSCN = i.MSCN)
    )
    BEGIN
        RAISERROR(N'LỖI: Mã số chuyên ngành (MSCN) không tồn tại trong bảng CHUYENNGANH.', 16, 1);
        SET @HasError = 1;
    END

    IF @HasError = 1
    BEGIN
        ROLLBACK TRANSACTION;
    END
END
GO
```

#### Ví dụ

### Trigger Hội Đồng và Số Lượng Đề Tài

- Tạo Trigger thỏa mãn ràng buộc là một hội đồng không quá 10 đề tài.
- Dùng "Group by" có được không? Giải thích.

#### Trigger

```sql
CREATE TRIGGER trg_C3_CheckGvInHoiDong
ON HOIDONG_GV
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        INNER JOIN HOIDONG AS h ON i.MSHD = h.MSHD
        WHERE i.MSGV = h.MSGV -- Nếu MSGV của thành viên hội đồng trùng với MSGV (Chủ tịch) của HOIDONG
    )
    BEGIN
        RAISERROR(N'LỖI: Giáo viên thành viên không được là Chủ tịch của cùng Hội đồng đó.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END
GO
```

#### Giải Thích

- CÓ/KHÔNG thể dùng `GROUP BY`.
- VÌ:

#### Ví Dụ

### Trigger Đề Tài và Số Lượng Sinh Viên

- Tạo Trigger thỏa mãn ràng buộc là một đề tài không quá 2 sinh viên.
- Dùng "Group by" có được không? Giải thích.

#### Trigger

```sql
CREATE TRIGGER trg_C4_CheckPhanBienVsHuongDan
ON GV_PBDT
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        INNER JOIN GV_HDDT AS hd ON i.MSGV = hd.MSGV AND i.MSDT = hd.MSDT
    )
    BEGIN
        RAISERROR(N'LỖI: Giáo viên phản biện (GV_PBDT) không được là Giáo viên hướng dẫn (GV_HDDT) cho cùng một đề tài.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END
GO
```

#### Giải Thích

- CÓ/KHÔNG thể dùng `GROUP BY`.
- VÌ:

#### Ví Dụ

### Trigger Giáo Viên và Học Hàm

- Tạo Trigger thỏa mãn ràng buộc là một giáo viên muốn có học hàm PGS phải là tiến sĩ.

```sql
CREATE TRIGGER trg_C5_CheckNamHocHam
ON GIAOVIEN
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @NamHienTai int = YEAR(GETDATE());

    IF EXISTS (
        SELECT 1
        FROM inserted AS i
        WHERE YEAR(i.NAMHH) > @NamHienTai
    )
    BEGIN
        RAISERROR(N'LỖI: Năm nhận học hàm (NAMHH) không được lớn hơn năm hiện tại.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END
GO
```
