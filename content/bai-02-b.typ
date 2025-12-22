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
