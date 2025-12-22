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

Ví dụ 1:

- Học Vị = Thạc Sĩ

```sql
DECLARE @KETQUA INT;
EXEC sp_CountGVTheoHocVi N'Thạc sĩ', @KETQUA output ;
SELECT N'Số GV Thạc sĩ: ' AS KetQua, @KETQUA AS SoLuong;
```

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([KetQua], [SoLuong],),
    table.hline(),
    [Số GV Thạc sĩ:], [2],
  )]
  , kind: table
  )

Ví dụ 2:

- Học vị = Tiến Sĩ (Không tồn tại)

```sql
DECLARE @KETQUA INT;
EXEC sp_CountGVTheoHocVi N'Tiến sĩ', @KETQUA output ;
SELECT N'Số GV Tiến sĩ: ' AS KetQua, @KETQUA AS SoLuong;
```

#figure(
  align(center)[#table(
    columns: 2,
    align: (auto,auto,),
    table.header([KetQua], [SoLuong],),
    table.hline(),
    [Số GV Tiến sĩ:], [0],
  )]
  , kind: table
  )

=== Đưa vào `MSDT` cho biết Điểm trung bình
<dua-vao-msdt-cho-biet-diem-trung-binh>

Cho biết:

- Điểm trung bình của đề tài.
- Nếu không tìm thấy trả về `0`.

```sql
-- NOT AVAILABLE YET
```

Ví dụ 1:

- Đề tài `97001`

```sql
DECLARE @KETQUA FLOAT;
EXEC SP_DiemTBDeTai '97001', @KETQUA output ;
SELECT 'Diem TB De Tai 97001 ' AS KETQUA, @KETQUA AS DiemTB;
```

Ví dụ 2:

- Đề tài không có điểm: `97007`

```sql
DECLARE @KETQUA FLOAT;
EXEC sp_DiemTBDeTai '97007', @KETQUA OUTPUT;
SELECT 'Diem TB De Tai 97007 ' AS KetQua, @KETQUA AS DiemTB;
```

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

#figure(image("assets/2b-3-1.png"),
  caption: [
    2b-3-1
  ]
)

Ví dụ 1:

- Trường hợp trùng tên: Nguyễn Văn An

```sql
DECLARE @SoLuong INT, @DS_SDT NVARCHAR(100);
EXEC sp_TimGVTheoTen N'Nguyễn Văn An', @SoLuong OUTPUT, @DS_SDT OUTPUT;
SELECT N'Tong so giao vien trung ten: ' AS ThongBao, @SoLuong AS SoLuong, @DS_SDT AS 'Danh sach so dien thoai';
```

- Kết quả: trả về 2 bản ghi có sự trùng lặp ở trường `TENGV`

#figure(image("assets/2b-3-2.png"),
  caption: [
    2b-3-2
  ]
)

Ví dụ 2:

- Trường hợp không trùng tên: Trần Trung

```sql
DECLARE @SoLuong INT, @DS_SDT NVARCHAR(100);
EXEC sp_TimGVTheoTen N'Trần Trung', @SoLuong OUTPUT, @DS_SDT OUTPUT;
SELECT N'Tong so giao vien trung ten: ' AS ThongBao, @SoLuong AS SoLuong, @DS_SDT AS 'Danh sach so dien thoai';
```

- Kết quả: trả về duy nhất 1 bản ghi do không tìm thấy sự trùng lặp ở trường `TENGV`

#figure(image("assets/2b-3-3.png"),
  caption: [
    2b-3-3
  ]
)

Ví dụ 3:

- Trường hợp không tìm thấy: Lê Kim Long

```sql
DECLARE @SoLuong INT, @DS_SDT NVARCHAR(100);
EXEC sp_TimGVTheoTen N'Lê Kim Long', @SoLuong OUTPUT, @DS_SDT OUTPUT;
SELECT N'Tong so giao vien trung ten: ' AS ThongBao, @SoLuong AS SoLuong, @DS_SDT AS 'Danh sach so dien thoai';
```

- Kết quả: `0`, vì không tìm thấy `TENGV` phù hợp.

#figure(image("assets/2b-3-4.png"),
  caption: [
    2b-3-4
  ]
)
