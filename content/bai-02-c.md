## C. PHÂN QUYỀN NGƯỜI DÙNG

### Mô Tả Yêu Cầu

Thực hiện các phát biểu `GRANT` / `DENY` / `REVOKE` trên CSDL **Quản lý đề tài** gồm các bảng sau (Nhóm 2):

* T1: `DETAI`
* T2: `HOIDONG`
* T3: `GV_HDDT`

Tạo các user `U1`, `U2`, `U3` và phân quyền theo yêu cầu.

- U1 có quyền select, delete trên T1, T3
- U2 có quyền update, delete trên T2
- U3 có quyền insert trên T1, T2, T3
- U1 bị từ chối quyền insert trên T1, T2
- U2 bị từ chối quyền delete trên T3
- Thu hồi các quyền của U1 trên T1
- Thu hồi các quyền của U3 trên T2

### C.1 Tạo User

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

| name | type_desc |
| :--: | --------- |
|  U1  | SQL_USER  |
|  U2  | SQL_USER  |
|  U3  | SQL_USER  |

### C.2 Cấp quyền (GRANT)

#### U1 có quyền SELECT, DELETE trên T1, T3

```sql
GRANT SELECT, DELETE ON DETAI TO U1;
GRANT SELECT, DELETE ON GV_HDDT TO U1;
```

#### Kiểm tra

```sql
EXECUTE AS USER = 'U1';
SELECT * FROM DETAI;
REVERT;
```

| MSDT  | TENDT                   |
| :---: | :---------------------- |
| 97001 | Quản lý thư viện        |
| 97002 | Nhận dạng vân tay       |
| 97003 | Bán đấu giá trên mạng   |
| 97004 | Quản lý siêu thị        |
| 97005 | Xử lý ảnh               |
| 97006 | Hệ giải toán thông minh |

### U2 có quyền UPDATE, DELETE trên T2

#### GRANT

```sql
GRANT UPDATE, DELETE ON HOIDONG TO U2;
```

#### Kiểm tra

- DELETE

```sql
EXECUTE AS USER = 'U2';
DELETE FROM HOIDONG WHERE MAHD = 'HD001';
REVERT;
```

