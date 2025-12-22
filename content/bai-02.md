# Phần 2

## A. STORED PROCEDURES VỚI THAM SỐ VÀO

### Kiểm Tra `MSHH` Trong Table `HOCHAM`

- Tham số vào là `MSGV`, `TENGV`, `SODT`, `DIACHI`, `MSHH`, `NAMHH`.
- Trước khi insert dữ liệu cần kiểm tra `MSHH` đã tồn tại trong table `HOCHAM` chưa
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

### Kiểm Tra `MSGV` Trong Table `GIAOVIEN`
<SP_INS_GV_KT_MSGV>

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

### Kiểm Tra `MSGV` và `MSHH`

- Giống (1) và (2) kiểm tra xem `MSGV` có trùng không? `MSHH` có tồn tại chưa?
    - Nếu `MSGV` trùng thì trả về `0`.
    - Nếu `MSHH` chưa tồn tại trả về `1`.
    - Ngược lại cho insert dữ liệu

```sql
CREATE PROC SP_INS_GV_KT_MSHH_MSGV
    @MSGV INT,
    @TENGV NVARCHAR(30),
    @SODT VARCHAR(10),
    @DIACHI NVARCHAR(50),
    @MSHH INT,
    @NAMHH SMALLDATETIME
AS
BEGIN
    IF NOT EXISTS (SELECT MSHH FROM HOCHAM WHERE MSHH = @MSHH)
    BEGIN
        RETURN 1; -- Nếu MSHH chưa tồn tại trả về 1
    END
    IF EXISTS (SELECT 1 FROM GIAOVIEN WHERE MSGV = @MSGV)
    BEGIN
        RETURN 0; -- Nếu MSGV trùng thì trả về 0
    END
    INSERT INTO GIAOVIEN VALUES (@MSGV, @TENGV, @DIACHI, @SODT, @MSHH, @NAMHH)
END;
```


## B. STORED PROCEDURES VỚI THAM SỐ VÀO VÀ RA

## C. TRIGGER

## D. FUNCTION

## E. CURSOR
