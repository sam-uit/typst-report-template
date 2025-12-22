== B. STORED PROCEDURES VỚI THAM SỐ VÀO VÀ RA
<b-stored-procedures-voi-tham-so-vao-va-ra>


=== Đưa vào `TENHV` trả ra GV
<dua-vao-tenhv-tra-ra-gv>

Trả ra:

- Số GV thỏa học vị
- Nếu không tìm thấy trả về 0

```sql
-- Tạo Stored Procedure
Create procedure sp_CountGVTheoHocVi
    @TenHV NVARCHAR(20),
    @SOGV INT OUTPUT
AS
    BEGIN
        SET @SOGV = 0;

        DECLARE @MSHV_HOCVI INT;
        SELECT @MSHV_HOCVI = MSHV
        FROM HOCVI
        WHERE TENHV = @TenHV;

        IF @MSHV_HOCVI IS NOT NULL
        BEGIN
            SELECT @SOGV = COUNT(DISTINCT MSGV)
            FROM GV_HV_CN
            WHERE MSHV = @MSHV_HOCVI;
        end;
    end;
GO
```

==== Ví dụ 1: Học Vị Thạc Sĩ
<vi-du-1-hoc-vi-thac-si>

- Học Vị = Thạc Sĩ

```sql
DECLARE @KETQUA INT;
EXEC sp_CountGVTheoHocVi N'Thạc sĩ', @KETQUA output ;
SELECT N'Số GV Thạc sĩ: ' AS KetQua, @KETQUA AS SoLuong;
```

#table(
  columns: (1fr,) * 2,
  align: (left, left),
  [KetQua], [SoLuong], [Số GV Thạc sĩ:], [2]
)

==== Ví dụ 2: Học Vị Tiến Sĩ
<vi-du-2-hoc-vi-tien-si>

- Học vị = Tiến Sĩ (Không tồn tại)

```sql
DECLARE @KETQUA INT;
EXEC sp_CountGVTheoHocVi N'Tiến sĩ', @KETQUA output ;
SELECT N'Số GV Tiến sĩ: ' AS KetQua, @KETQUA AS SoLuong;
```

#table(
  columns: (1fr,) * 2,
  align: (left, left),
  [KetQua], [SoLuong], [Số GV Tiến sĩ:], [0]
)

=== Điểm Trung Bình của Đề Tài
<diem-trung-binh-cua-de-tai>

Đưa vào:

- `MSDT`

Cho biết:

- Điểm trung bình của đề tài.
  - Nếu không tìm thấy trả về `0`.

```sql
CREATE PROCEDURE SP_DiemTBDeTai
    @MSDT CHAR(6),
    @DIEMTRUNGBINH FLOAT OUTPUT
AS
BEGIN
    SET @DIEMTRUNGBINH = 0;

    SELECT @DIEMTRUNGBINH = AVG(DIEM)
    FROM (
        SELECT DIEM FROM GV_HDDT WHERE MSDT = @MSDT
        UNION ALL
        SELECT DIEM FROM GV_PBDT WHERE MSDT = @MSDT
        UNION ALL
        SELECT DIEM FROM GV_UVDT WHERE MSDT = @MSDT
    ) AS ALLDIEM;

    IF @DIEMTRUNGBINH IS NULL
    BEGIN
        SET @DIEMTRUNGBINH = 0;
    END
END
GO
```

==== Ví dụ 1: Đề tài `97001`
<vi-du-1-de-tai-97001>

```sql
DECLARE @KETQUA FLOAT;
EXEC SP_DiemTBDeTai '97001', @KETQUA output ;
SELECT 'Diem TB De Tai 97001 ' AS KETQUA, @KETQUA AS DiemTB;
```

#table(
  columns: (1fr,) * 2,
  align: (left, left),
  [KETQUA], [DiemTB], [Diem TB De Tai 97001], [8]
)

==== Ví dụ 2: 97007
<vi-du-2-97007>

- Đề tài không có điểm: `97007`

```sql
DECLARE @KETQUA FLOAT;
EXEC sp_DiemTBDeTai '97007', @KETQUA OUTPUT;
SELECT 'Diem TB De Tai 97007 ' AS KetQua, @KETQUA AS DiemTB;
```

#table(
  columns: (1fr,) * 2,
  align: (left, left),
  [KETQUA], [DiemTB], [Diem TB De Tai 97007], [0]
)

=== Đưa vào `TENGV` trả ra SDT của GV
<dua-vao-tengv-tra-ra-sdt-cua-gv>

Đưa vào TENGV trả ra:

- `SDT` của giáo viên đó.
- Nếu không tìm thấy trả về `0`.
- Nếu trùng tên thì có báo lỗi không?
  - Tại sao?
- Làm sao để hiện thông báo có bao nhiêu giáo viên trùng tên và trả về các SDT?

Giải đáp:

- Nếu trùng tên thì sẽ không báo lỗi.
  - Nguyên nhân là nếu trùng tên thì đồng nghĩa với việc đang có nhiều records (bản ghi) có column là `TENGV` đang giống nhau.
  - Về mặt câu lệnh SQL, có thể như sau: `sql SELECT * FROM GIAOVIEN WHERE TENGV = %NAME`.
  - Kết quả trả về của câu lệnh SQL này có khả năng sẽ là `0`, `1` hoặc nhiều records.
  - Nếu đề cập tới việc xảy ra lỗi ở đây thì có khả năng liên quan tới việc dữ liệu có khả năng bị sai lệch do sẽ không biết được sẽ lấy số điện thoại của record nào để trả về.
- Đáp ứng yêu cầu hiện thông báo có bao nhiêu giáo viên trùng tên và trả về các SDT, ta có thể làm như sau:

```sql
CREATE PROCEDURE sp_TimGVTheoTen @TENGV NVARCHAR(30),
                                 @SOLUONGGV INT OUTPUT,
                                 @DS_SDT VARCHAR(100) OUTPUT
AS
BEGIN
    SET @DS_SDT = '';
    -- DEM SO LUONG GIAO VIEN TRUNG TEN
    SELECT @SOLUONGGV = COUNT(MSGV)
    FROM GIAOVIEN
    WHERE TENGV = @TENGV;
end
    -- KIEM TRA SO LUONG GIAO VIEN VA TRA VE THONG TIN TUONG UNG
    IF @SOLUONGGV > 0
        BEGIN
            SELECT @DS_SDT = STRING_AGG(SODT, ', ')
            FROM GIAOVIEN
            WHERE TENGV = @TENGV;
        end
    ELSE
        BEGIN
            SET @SOLUONGGV = 0;
            SET @DS_SDT = '';
        end;
GO
```

Dữ liệu bảng `GIAOVIEN` (Đã thêm một record Nguyễn Văn An, `MSGV`: `206`, `SODT`: `12434343`):

```sql
INSERT INTO GIAOVIEN (MSGV, TENGV, DIACHI, SODT, MSHH, NAMHH)
VALUES (206, N'Nguyễn Văn An', N'Cần Thơ', '12434343', 1, '2025');
```

Giá trị của bảng:

#table(
  columns: (1fr,) * 6,
  align: (left, left, left, left, left, left),
  [MSGV], [TENGV], [DIACHI], [SODT], [MSHH], [NAMHH], [201], [Trần Trung], [Bến Tre], [35353535], [1], [1996-01-01 00:00:00], [202], [Nguyễn Văn An], [Tiền Giang], [67868688], [1], [1996-01-01 00:00:00], [203], [Trần Thu Trang], [Cần Thơ], [74758687], [1], [1996-01-01 00:00:00], [204], [Nguyễn Thị Loan], [TP. HCM], [56575868], [2], [2005-01-01 00:00:00], [205], [Chu Tiến], [Hà Nội], [46466646], [2], [2005-01-01 00:00:00], [206], [Nguyễn Văn An], [Cần Thơ], [12434343], [1], [2025-01-01 00:00:00]
)

==== Ví dụ 1: Có trùng tên
<vi-du-1-co-trung-ten>

- Trường hợp trùng tên: Nguyễn Văn An

```sql
DECLARE @SoLuong INT, @DS_SDT NVARCHAR(100);
EXEC sp_TimGVTheoTen N'Nguyễn Văn An', @SoLuong OUTPUT, @DS_SDT OUTPUT;
SELECT N'Tong so giao vien trung ten: ' AS ThongBao, @SoLuong AS SoLuong, @DS_SDT AS 'Danh sach so dien thoai';
```

- Kết quả: trả về 2 bản ghi có sự trùng lặp ở trường `TENGV`

#table(
  columns: (1fr,) * 3,
  align: (left, left, left),
  [ThongBao], [SoLuong], [Danh sach so dien thoai], [Tong so giao vien trung ten:], [2], [67868688, 12434343]
)

==== Ví dụ 2: Không trùng tên
<vi-du-2-khong-trung-ten>

- Trường hợp không trùng tên: Trần Trung

```sql
DECLARE @SoLuong INT, @DS_SDT NVARCHAR(100);
EXEC sp_TimGVTheoTen N'Trần Trung', @SoLuong OUTPUT, @DS_SDT OUTPUT;
SELECT N'Tong so giao vien trung ten: ' AS ThongBao, @SoLuong AS SoLuong, @DS_SDT AS 'Danh sach so dien thoai';
```

- Kết quả: trả về duy nhất 1 bản ghi do không tìm thấy sự trùng lặp ở trường `TENGV`

#table(
  columns: (1fr,) * 3,
  align: (left, left, left),
  [ThongBao], [SoLuong], [Danh sach so dien thoai], [Tong so giao vien trung ten:], [1], [35353535]
)

==== Ví dụ 3: Tên không tồn tại
<vi-du-3-ten-khong-ton-tai>

- Trường hợp không tìm thấy: Lê Kim Long

```sql
DECLARE @SoLuong INT, @DS_SDT NVARCHAR(100);
EXEC sp_TimGVTheoTen N'Lê Kim Long', @SoLuong OUTPUT, @DS_SDT OUTPUT;
SELECT N'Tong so giao vien trung ten: ' AS ThongBao, @SoLuong AS SoLuong, @DS_SDT AS 'Danh sach so dien thoai';
```

- Kết quả: `0`, vì không tìm thấy `TENGV` phù hợp.

#table(
  columns: (1fr,) * 3,
  align: (left, left, left),
  [ThongBao], [SoLuong], [Danh sach so dien thoai], [Tong so giao vien trung ten:], [0], []
)

=== Đưa vào `MSHD` cho biết Điểm Trung Bình
<dua-vao-mshd-cho-biet-diem-trung-binh>

Cho biết:

- Điểm trung bình các đề tài của hội đồng đó.

```sql
CREATE PROCEDURE sp_DiemTBTheoHD @MSHD INT,
                                 @DIEM_TB FLOAT OUTPUT
AS
BEGIN
    SET @DIEM_TB = 0;
    SELECT @DIEM_TB = AVG(T2.DIEM) FROM HOIDONG_DT T1
    JOIN (
        SELECT MSDT, DIEM FROM GV_HDDT
        UNION ALL
        SELECT MSDT, DIEM FROM GV_PBDT
        UNION ALL
        SELECT MSDT, DIEM FROM GV_UVDT
    ) AS T2 ON T1.MSDT = T2.MSDT
    WHERE T1.MSHD = @MSHD
    GROUP BY T1.MSDT;
end;
GO
```

==== Ví dụ: Hội đồng 1
<vi-du-hoi-dong-1>

```sql
DECLARE @MSHD INT = 1, @DiemTB FLOAT;
EXEC sp_DiemTBTheoHD @MSHD, @DiemTB output;
SELECT @MSHD as 'Ma So Hoi Dong', @DiemTB as 'Diem Trung Binh'
```

#table(
  columns: (1fr,) * 2,
  align: (left, left),
  [Ma So Hoi Dong], [Diem Trung Binh], [1], [8.2]
)

==== Ví dụ: Hội đồng 2
<vi-du-hoi-dong-2>

```sql
DECLARE @MSHD INT = 2, @DiemTB FLOAT;
EXEC sp_DiemTBTheoHD @MSHD, @DiemTB output;
SELECT @MSHD as 'Ma So Hoi Dong', @DiemTB as 'Diem Trung Binh'
```

#table(
  columns: (1fr,) * 2,
  align: (left, left),
  [Ma So Hoi Dong], [Diem Trung Binh], [2], [8]
)
