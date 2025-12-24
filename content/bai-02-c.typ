#import "../template/lib.typ": *

== C. PHÂN QUYỀN NGƯỜI DÙNG
<c-phan-quyen-nguoi-dung>

=== Mô Tả Yêu Cầu
<mo-ta-yeu-cau>

Thực hiện các phát biểu `GRANT` / `DENY` / `REVOKE` trên CSDL #strong[Quản lý đề tài] gồm các bảng sau (Nhóm 2):

- T1: `DETAI`
- T2: `HOIDONG`
- T3: `GV_HDDT`

Tạo các user `U1`, `U2`, `U3` và phân quyền theo yêu cầu.

+ U1 có quyền select, delete trên T1, T3
+ U2 có quyền update, delete trên T2
+ U3 có quyền insert trên T1, T2, T3
+ U1 bị từ chối quyền insert trên T1, T2
+ U2 bị từ chối quyền delete trên T3
+ Thu hồi các quyền của U1 trên T1
+ Thu hồi các quyền của U3 trên T2

=== Tạo User - Chuẩn Bị Môi Trường
<tao-user-chuan-bi-moi-truong>

```sql
CREATE USER U1 WITHOUT LOGIN;
CREATE USER U2 WITHOUT LOGIN;
CREATE USER U3 WITHOUT LOGIN;
```

- Kiểm tra kết quả:

```sql
SELECT name, type_desc FROM sys.database_principals 
WHERE name IN ('U1', 'U2', 'U3');
```

#table(
  columns: (1fr,) * 2,
  align: (center, left),
  [name], [type\_desc], [U1], [SQL\_USER], [U2], [SQL\_USER], [U3], [SQL\_USER]
)

=== GRANT - U1 có quyền SELECT, DELETE trên T1, T3
<grant-u1-co-quyen-select-delete-tren-t1-t3>


==== GRANT
<grant>

```sql
GRANT SELECT, DELETE ON DETAI TO U1;
GRANT SELECT, DELETE ON GV_HDDT TO U1;
```

==== Kiểm tra
<kiem-tra>

```sql
EXECUTE AS USER = 'U1';
SELECT * FROM DETAI;
REVERT;
```

#table(
  columns: (1fr,) * 2,
  align: (center, left),
  [MSDT], [TENDT], [97001], [Quản lý thư viện], [97002], [Nhận dạng vân tay], [97003], [Bán đấu giá trên mạng], [97004], [Quản lý siêu thị], [97005], [Xử lý ảnh], [97006], [Hệ giải toán thông minh]
)

=== GRANT - U2 có quyền UPDATE, DELETE trên T2
<grant-u2-co-quyen-update-delete-tren-t2>


==== GRANT
<grant-1>

```sql
GRANT UPDATE, DELETE ON HOIDONG TO U2;
```

==== Kiểm tra
<kiem-tra>

- DELETE

```sql
EXECUTE AS USER = 'U2';
DELETE FROM HOIDONG WHERE 1 = '0';
REVERT;
GO
```

```sql
Commands completed successfully.
```

- UPDATE

```sql
EXECUTE AS USER = 'U2';
UPDATE HOIDONG SET PHONG = 6969;
REVERT;
```

#table(
  columns: (1fr,) * 4,
  align: (center, left, left, left),
  [MSHD], [PHONG], [TINHTRANG], [MSGV], [1], [6969], [Thật], [201], [2], [6969], [Thật], [202], [3], [6969], [Thật], [203]
)

=== GRANT - U3 có quyền INSERT trên T1, T2, T3
<grant-u3-co-quyen-insert-tren-t1-t2-t3>


==== GRANT
<grant-2>

```sql
GRANT INSERT ON DETAI TO U3;
GRANT INSERT ON HOIDONG TO U3;
GRANT INSERT ON GV_HDDT TO U3;
```

==== Kiểm tra
<kiem-tra>

- INSERT trên `HOIDONG`

```sql
EXECUTE AS USER = 'U3';
INSERT INTO HOIDONG (MSHD, PHONG, TGBD, NGAYHD, TINHTRANG, MSGV) VALUES
(4, 2, '07:00', '2014-11-29', N'Thật', 201);
REVERT;
```

#table(
  columns: (1fr,) * 4,
  align: (center, left, left, left),
  [MSHD], [PHONG], [TINHTRANG], [MSGV], [1], [6969], [Thật], [201], [2], [6969], [Thật], [202], [3], [6969], [Thật], [203], [4], [2], [Thật], [201]
)

=== DENY - U1 bị từ chối quyền INSERT trên T1, T2
<deny-u1-bi-tu-choi-quyen-insert-tren-t1-t2>


==== DENY
<deny>

```sql
DENY INSERT ON DETAI TO U1;
DENY INSERT ON HOIDONG TO U1;
```

==== Kiểm tra
<kiem-tra>

```sql
EXECUTE AS USER = 'U1';
INSERT INTO DETAI (MSDT, TENDT) VALUES
('970553', N'Quản lý thư viện2');
REVERT;
```

```sql
Msg 229, Level 14, State 5, Line 9
The INSERT permission was denied on the object 'DETAI', database 'IE103-BTTH2', schema 'dbo'.
```

=== DENY - U2 bị từ chối quyền DELETE trên T3
<deny-u2-bi-tu-choi-quyen-delete-tren-t3>


==== DENY
<deny-1>

```sql
DENY DELETE ON GV_HDDT TO U2;
```

==== Kiểm tra
<kiem-tra>

```sql
EXECUTE AS USER = 'U2';
DELETE FROM GV_HDDT WHERE 1 = 0;
REVERT;
```

```sql
The DELETE permission was denied on the object 'GV_HDDT', database 'IE103-BTTH2', schema 'dbo'.
```

=== REVOKE - Thu hồi các quyền của U1 trên T1
<revoke-thu-hoi-cac-quyen-cua-u1-tren-t1>


==== REVOKE
<revoke>

```sql
REVOKE SELECT, DELETE ON DETAI FROM U1;
```

==== Kiểm tra
<kiem-tra>

```sql
EXECUTE AS USER = 'U1';
SELECT * FROM DETAI;
REVERT;
```

```sql
The SELECT permission was denied on the object 'DETAI', database 'IE103-BTTH2', schema 'dbo'.
```

=== REVOKE - Thu hồi các quyền của U3 trên T2
<revoke-thu-hoi-cac-quyen-cua-u3-tren-t2>


==== REVOKE
<revoke-1>

```sql
REVOKE INSERT ON HOIDONG FROM U3;
```

==== Kiểm tra
<kiem-tra>

```sql
EXECUTE AS USER = 'U3';
INSERT INTO HOIDONG (MSHD, PHONG, TGBD, NGAYHD, TINHTRANG, MSGV) VALUES
(5, 3, '08:00', '2014-11-30', N'Thật', 202);
REVERT;
```

```sql
The INSERT permission was denied on the object 'HOIDONG', database 'IE103-BTTH2', schema 'dbo'.
```
