= Phần 2
<phan-2>


== A. STORED PROCEDURES VỚI THAM SỐ VÀO
<a-stored-procedures-voi-tham-so-vao>


=== Kiểm Tra `MSHH` Trong Table `HOCHAM`
<kiem-tra-mshh-trong-table-hocham>

- Tham số vào là `MSGV`, `TENGV`, `SODT`, `DIACHI`, `MSHH`, `NAMHH`.
- Trước khi insert dữ liệu cần kiểm tra MSHH đã tồn tại trong table `HOCHAM` chưa
  - Nếu chưa thì trả về giá trị `0`.

```sql
CREATE PROC SP_INS_GV_KT_MSHH
    @MSGV INT,
    @TENGV NVARCHAR(30),
    @SODT VARCHAR(10),
    @DIACHI NVARCHAR(50),
    @MSHH INT,
    @NAMHH SMALLDATETIME
AS
BEGIN
    IF NOT EXISTS (SELECT MSHH FROM HOCHAM WHERE MSHH = @MSHH)
        RETURN 0
    INSERT INTO GIAOVIEN VALUES (@MSGV, @TENGV, @DIACHI, @SODT, @MSHH, @NAMHH)
    RETURN 1
END;
```

=== Kiểm Tra `MSGV` Trong Table `GIAOVIEN`
<kiem-tra-msgv-trong-table-giaovien>

- Tham số vào là `MSGV`, `TENGV`, `SODT`, `DIACHI`, `MSHH`, `NAMHH`.
- Trước khi insert dữ liệu cần kiểm tra `MSGV` trong table `GIAOVIEN` có trùng không
  - Nếu trùng thì trả về giá trị `0`.

```sql
CREATE PROC SP_INS_GV_KT_MSGV
    @MSGV INT,
    @TENGV NVARCHAR(30),
    @SODT VARCHAR(10),
    @DIACHI NVARCHAR(50),
    @MSHH INT,
    @NAMHH SMALLDATETIME
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM GIAOVIEN
        WHERE MSGV = @MSGV
    )
    BEGIN
        RETURN 0; -- MSGV đã tồn tại
    END
    INSERT INTO GIAOVIEN VALUES (@MSGV, @TENGV, @DIACHI, @SODT, @MSHH, @NAMHH)
    RETURN 1
END;
```

== B. STORED PROCEDURES VỚI THAM SỐ VÀO VÀ RA
<b-stored-procedures-voi-tham-so-vao-va-ra>


== C. TRIGGER
<c-trigger>


== D. FUNCTION
<d-function>


== E. CURSOR
<e-cursor>
