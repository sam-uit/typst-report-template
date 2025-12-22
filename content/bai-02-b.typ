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

Ví dụ:

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
