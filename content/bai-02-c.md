## C. TRIGGER

### Trigger khi Xóa Đề Tài

- Tạo Trigger thỏa mãn điều kiện khi xóa một đề tài (MSDT) sẽ xóa các thông tin liên quan.

Tham khảo: [INSTEAD OF](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-trigger-transact-sql?view=sql-server-ver17#instead-of).

#### Trigger

- Xóa trigger đã tạo trước đó nếu đây là lần chạy thứ 2 trở lên. Đảm bảo luôn có duy nhất 1 trigger được tạo và mới nhất.

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

- Xóa trigger đã tạo trước đó nếu đây là lần chạy thứ 2 trở lên. Đảm bảo luôn có duy nhất 1 trigger được tạo và mới nhất.

```sql
IF OBJECT_ID('BTTH2_TRG_CapNhatMSGV', 'TR') IS NOT NULL
    DROP TRIGGER BTTH2_TRG_CapNhatMSGV;
GO
```

- Tạo Trigger mới trên `GIAOVIEN` sử dụng cả INSERTED và DELETED để lưu trữ dữ liệu mới/cũ tương ứng.

```sql
CREATE TRIGGER BTTH2_TRG_CapNhatMSGV ON GIAOVIEN
INSTEAD OF UPDATE
AS
BEGIN
    -- Khai báo biến để giữ giá trị cũ và mới
    DECLARE @OldMSGV INT;
    DECLARE @NewMSGV INT;

    -- Lấy MSGV cũ từ bảng DELETED (dữ liệu trước khi update)
    SELECT @OldMSGV = MSGV FROM DELETED;

    -- Lấy MSGV mới từ bảng INSERTED (dữ liệu người dùng muốn update)
    SELECT @NewMSGV = MSGV FROM INSERTED;

    -- Kiểm tra: Nếu người dùng có sửa MSGV (Khóa chính)
    IF (@OldMSGV <> @NewMSGV)
    BEGIN
        -- 1. Thêm dòng giáo viên mới với thông tin từ bảng INSERTED
        INSERT INTO GIAOVIEN (MSGV, TENGV, DIACHI, SODT, MSHH, NAMHH)
        SELECT MSGV, TENGV, DIACHI, SODT, MSHH, NAMHH
        FROM INSERTED;

        -- 2. Cập nhật các bảng con đang giữ MSGV cũ thành MSGV mới
        UPDATE GV_HV_CN SET MSGV = @NewMSGV WHERE MSGV = @OldMSGV;
        UPDATE GV_HDDT  SET MSGV = @NewMSGV WHERE MSGV = @OldMSGV;
        UPDATE GV_PBDT  SET MSGV = @NewMSGV WHERE MSGV = @OldMSGV;
        UPDATE GV_UVDT  SET MSGV = @NewMSGV WHERE MSGV = @OldMSGV;
        UPDATE HOIDONG  SET MSGV = @NewMSGV WHERE MSGV = @OldMSGV;
        UPDATE HOIDONG_GV SET MSGV = @NewMSGV WHERE MSGV = @OldMSGV;

        -- 3. Xóa dòng giáo viên cũ (dựa trên bảng DELETED)
        DELETE FROM GIAOVIEN WHERE MSGV = @OldMSGV;
    END
    ELSE
    -- Trường hợp: Người dùng chỉ sửa tên, địa chỉ... (không sửa Khóa chính)
    BEGIN
        UPDATE GIAOVIEN
        SET TENGV = I.TENGV,
            DIACHI = I.DIACHI,
            SODT = I.SODT,
            MSHH = I.MSHH,
            NAMHH = I.NAMHH
        FROM GIAOVIEN G
        JOIN INSERTED I ON G.MSGV = I.MSGV;
    END
END;
GO
```

#### Ví dụ

- Kiểm tra trước khi đổi (xem bảng GV_HDDT của 202)

```sql
SELECT * FROM GIAOVIEN WHERE MSGV = 202;
SELECT * FROM GV_HDDT WHERE MSGV = 202;
-- Quên không copy kết quả ở lần chạy đầu
```

- Thực hiện đổi ID

```sql
UPDATE GIAOVIEN 
SET MSGV = 2020 
WHERE MSGV = 202;
```

- Kiểm tra lại: 202 sẽ mất, thay bằng 2020, dữ liệu con cũng đổi theo.

```sql
SELECT * FROM GIAOVIEN WHERE MSGV = 202;
-- Trả về 0 kết quả
```

- Kiểm tra xem 2020 đã xuất hiện và thông tin liên quan đã chuyển qua.

```sql
SELECT * FROM GIAOVIEN WHERE MSGV = 2020;
```

```
MSGV    TENGV           MSHH
201     Trần Trung      1
203     Trần Thu Trang  1
204     Nguyễn Thị Loan 2
205     Chu Tiến        2
2020    Nguyễn Văn An   1
```

```sql
SELECT * FROM GV_HDDT WHERE MSGV = 2020;
```

```
MSGV    MSDT    DIEM
203     97005   9
204     97004   7
2020    97002   7
```

### Trigger Hội Đồng và Số Lượng Đề Tài

- Tạo Trigger thỏa mãn ràng buộc là một hội đồng không quá 10 đề tài.
- Dùng "Group by" có được không? Giải thích.

#### Trigger

- Xóa trigger đang tồn tại nếu có (ở các lần chạy thứ 2 trở đi).

```sql
IF OBJECT_ID('BTTH2_TRG_KiemTraSoLuongDeTai', 'TR') IS NOT NULL
    DROP TRIGGER BTTH2_TRG_KiemTraSoLuongDeTai;
GO
```

- Tạo Trigger kiểm tra ràng buộc số lượng Đề Tài
    - Sử dụng `FOR` (`AFTER`).
    - Kiểm tra xem có hội đồng nào vi phạm quy định (> 10 đề tài) hay không.
    - Logic: Chỉ cần kiểm tra các `MSHD` vừa bị tác động (có trong bảng `INSERTED`).
    - Nếu tìm thấy hội đồng nào có > 10 đề tài, hủy bỏ thao tác (`INSERT`/`UPDATE`) và báo lỗi.

```sql
CREATE TRIGGER BTTH2_TRG_KiemTraSoLuongDeTai
ON HOIDONG_DT
FOR INSERT, UPDATE
AS
BEGIN

    IF EXISTS (
        SELECT HOIDONG_DT.MSHD
        FROM HOIDONG_DT
        JOIN INSERTED ON HOIDONG_DT.MSHD = INSERTED.MSHD
        GROUP BY HOIDONG_DT.MSHD
        HAVING COUNT(HOIDONG_DT.MSHD) > 10
    )
    BEGIN
        RAISERROR(N'Lỗi: Quá 10 đề tài trên Hội Đồng.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
```

#### Giải Thích

- CÓ thể dùng `GROUP BY`. Rất cần thiết cho chức năng đếm số lượng/lần xuất hiện giá trị của một trường cụ thể.
- VÌ:
    - Thống kê: Ràng buộc yêu cầu đếm số lượng đề tài trên mỗi hội đồng.
        - Trong mô hình quan hệ, bảng `HOIDONG_DT` chứa các dòng riêng lẻ (`MSHD`, `MSDT`).
        - Để biết một `MSHD` xuất hiện bao nhiêu lần (tương ứng với số lượng đề tài), ta gom nhóm các dòng có cùng `MSHD` lại với mệnh đề `GROUP BY`.
    - Kết hợp với `HAVING`: Sau khi `GROUP BY MSHD`, ta dùng hàm gộp `COUNT(MSDT)` để đếm và mệnh đề `HAVING` để lọc ra những nhóm vi phạm điều kiện (`> 10`).

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
