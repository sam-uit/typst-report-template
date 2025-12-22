== E. CURSOR
<e-cursor>


=== Tạo Bảng `DETAI_DIEM`
<tao-bang-detai-diem>

```sql
CREATE TABLE DETAI_DIEM (
    MSDT char(6) PRIMARY KEY,
    DIEMTB FLOAT,
    CONSTRAINT FK_DETAI_DIEM_DETAI FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);
```

`DETAI_DIEM` đã được tạo:

#table(
  columns: (1fr,) * 4,
  align: (left, left, left, left),
  [database], [schema], [name], [type], [IE103-BTTH2], [dbo], [CHUYENNGANH], [BASE TABLE], [IE103-BTTH2], [dbo], [DETAI], [BASE TABLE], [IE103-BTTH2], [dbo], [GIAOVIEN], [BASE TABLE], [IE103-BTTH2], [dbo], [GV\_HDDT], [BASE TABLE], [IE103-BTTH2], [dbo], [GV\_HV\_CN], [BASE TABLE], [IE103-BTTH2], [dbo], [GV\_PBDT], [BASE TABLE], [IE103-BTTH2], [dbo], [GV\_UVDT], [BASE TABLE], [IE103-BTTH2], [dbo], [HOCHAM], [BASE TABLE], [IE103-BTTH2], [dbo], [HOCVI], [BASE TABLE], [IE103-BTTH2], [dbo], [HOIDONG], [BASE TABLE], [IE103-BTTH2], [dbo], [HOIDONG\_DT], [BASE TABLE], [IE103-BTTH2], [dbo], [HOIDONG\_GV], [BASE TABLE], [IE103-BTTH2], [dbo], [SINHVIEN], [BASE TABLE], [IE103-BTTH2], [dbo], [SV\_DETAI], [BASE TABLE], [IE103-BTTH2], [dbo], [DETAI\_DIEM], [BASE TABLE]
)

=== Cursor Tính Điểm Trung Bình
<cursor-tinh-diem-trung-binh>

- Viết Cursor tính điểm trung bình cho từng đề tài.
- Sau đó lưu kết quả vào bảng `DETAI_DIEM`.

Khởi tạo Cursor:

- Khai báo biến

```sql
DECLARE @MSDT CHAR(6);
DECLARE @DIEMTB FLOAT;
```

- Xóa dữ liệu cũ trong bảng kết quả (nếu có)

```sql
DELETE FROM DETAI_DIEM;
```

- Khai báo Cursor

```sql
DECLARE CUR_TINH_DIEM CURSOR FOR
    SELECT MSDT
    FROM DETAI;

-- Mở Cursor
OPEN CUR_TINH_DIEM;

-- Lấy dòng đầu tiên
FETCH NEXT FROM CUR_TINH_DIEM INTO @MSDT;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Tính điểm trung bình cho đề tài
    SELECT @DIEMTB = ROUND(AVG(DIEM), 2)
    FROM (
        SELECT DIEM FROM GV_HDDT WHERE MSDT = @MSDT
        UNION ALL
        SELECT DIEM FROM GV_PBDT WHERE MSDT = @MSDT
        UNION ALL
        SELECT DIEM FROM GV_UVDT WHERE MSDT = @MSDT
    ) AS T;

    -- Lưu kết quả vào DETAI_DIEM
    INSERT INTO DETAI_DIEM(MSDT, DIEMTB)
    VALUES (@MSDT, @DIEMTB);

    -- Lấy dòng tiếp theo
    FETCH NEXT FROM CUR_TINH_DIEM INTO @MSDT;
END

-- Ðóng và hủy Cursor
CLOSE CUR_TINH_DIEM;
DEALLOCATE CUR_TINH_DIEM;
```

- Kiểm tra bảng `DETAI_DIEM` đã nhập được chưa.

```sql
SELECT * FROM DETAI_DIEM;
```

#table(
  columns: (1fr,) * 2,
  align: (center, left),
  [MSDT], [DIEMTB], [97001], [8], [97002], [8.2], [97003], [7.5], [97004], [8], [97005], [8.2], [97006], [8.33]
)

=== Tạo Stored Procedure cho Tính Điểm Trung Bình
<tao-stored-procedure-cho-tinh-diem-trung-binh>

- Gom các bước xử lý của Cursor ở @cursor-tinh-diem-trung-binh[ Mục Tính Điểm Trung Bình] vào một Stored Procedure.

```sql
CREATE OR ALTER PROCEDURE SP_TINH_DIEMTB_DETAI
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MSDT CHAR(6);
    DECLARE @DIEMTB FLOAT;

    -- Làm sạch: Xóa dữ liệu cũ (tránh trùng khi chạy lại)
    DELETE FROM DETAI_DIEM;

    -- Cursor duyệt từng đề tài
    DECLARE CUR_DETAI CURSOR FOR
    SELECT MSDT
    FROM DETAI;

    OPEN CUR_DETAI;
    FETCH NEXT FROM CUR_DETAI INTO @MSDT;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Tính điểm trung bình của đề tài
        SELECT @DIEMTB = AVG(DIEM)
        FROM (
            SELECT DIEM FROM GV_HDDT WHERE MSDT = @MSDT
            UNION ALL
            SELECT DIEM FROM GV_PBDT WHERE MSDT = @MSDT
            UNION ALL
            SELECT DIEM FROM GV_UVDT WHERE MSDT = @MSDT
        ) AS T;

        -- Lưu vào bảng DETAI_DIEM
        INSERT INTO DETAI_DIEM(MSDT, DIEMTB)
        VALUES (@MSDT, @DIEMTB);

        FETCH NEXT FROM CUR_DETAI INTO @MSDT;
    END

    CLOSE CUR_DETAI;
    DEALLOCATE CUR_DETAI;
END;
```

- Chạy Stored Procedure vừa tạo:

```sql
EXEC SP_TINH_DIEMTB_DETAI;
```
