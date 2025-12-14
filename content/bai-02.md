# Phần 2

## A. STORED PROCEDURES VỚI THAM SỐ VÀO

### Kiểm Tra MSHH Trong Table HOCHAM

```sql
-- Kiểm tra MSHH trong table HOCHAM
CREATE PROCEDURE kiem_tra_mshh_trong_table_hocham(
    @mshh int
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM HOCHAM WHERE MSHH = @mshh)
        RETURN 1
    ELSE
        RETURN 0
END
```

### Kiểm Tra MSGV Trong Table GIAOVIEN

```sql
-- Kiểm tra MSGV trong table GIAOVIEN
CREATE PROCEDURE kiem_tra_msgv_trong_table_giaovien(
    @msgv int
)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM GIAOVIEN WHERE MSGV = @msgv)
        RETURN 1
    ELSE
        RETURN 0
END
```

## B. STORED PROCEDURES VỚI THAM SỐ VÀO VÀ RA

## C. TRIGGER

## D. FUNCTION

## E. CURSOR
