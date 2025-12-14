#import "../template/lib.typ": *

= Phần 2
<phan-2>


== A. STORED PROCEDURES VỚI THAM SỐ VÀO
<a-stored-procedures-voi-tham-so-vao>

#todo[Phần 2.A]

=== Kiểm Tra MSHH Trong Table HOCHAM
<kiem-tra-mshh-trong-table-hocham>

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

=== Kiểm Tra MSGV Trong Table GIAOVIEN
<kiem-tra-msgv-trong-table-giaovien>

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

== B. STORED PROCEDURES VỚI THAM SỐ VÀO VÀ RA
<b-stored-procedures-voi-tham-so-vao-va-ra>

#todo[Phần 2.B]

== C. TRIGGER
<c-trigger>

#todo[Phần 2.C]

== D. FUNCTION
<d-function>

#todo[Phần 2.D]

== E. CURSOR
<e-cursor>

#todo[Phần 2.E]
