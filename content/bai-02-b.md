## B. XÁC THỰC NGƯỜI DÙNG

### Mô tả yêu cầu

- Tạo 6 user từ `u1` đến `u6`
- Tạo 3 role từ `r1` đến `r3`
- Tạo nhóm:
  - `u1` thuộc `r1`;
  - `u2`, `u3` thuộc `r2`;
  - `u4`, `u5`, `u6` thuộc `r3`
- Thực hiện:
  - r1 thành viên của `SysAdmin`
  - r2 thành viên của `db_owner`, `db_accessadmin`
  - r3 thành viên của `SysAdmin`, `db_owner`, `db_accessadmin`

### B.1 Tạo Login L1 → L6

```sql
CREATE LOGIN L1 WITH PASSWORD = 'L1@12345678';
CREATE LOGIN L2 WITH PASSWORD = 'L2@12345678';
CREATE LOGIN L3 WITH PASSWORD = 'L3@12345678';
CREATE LOGIN L4 WITH PASSWORD = 'L4@12345678';
CREATE LOGIN L5 WITH PASSWORD = 'L5@12345678';
CREATE LOGIN L6 WITH PASSWORD = 'L6@12345678';
```



### B.2 Tạo User U1 → U6 tương ứng với Login

```sql
CREATE USER U1 FOR LOGIN L1;
CREATE USER U2 FOR LOGIN L2;
CREATE USER U3 FOR LOGIN L3;
CREATE USER U4 FOR LOGIN L4;
CREATE USER U5 FOR LOGIN L5;
CREATE USER U6 FOR LOGIN L6;
```





### B.3 Tạo Role r1, r2, r3

```sql
CREATE ROLE r1;
CREATE ROLE r2;
CREATE ROLE r3;
```



### B.4 Gán User vào Role

```sql
ALTER ROLE r1 ADD MEMBER U1;

ALTER ROLE r2 ADD MEMBER U2;
ALTER ROLE r2 ADD MEMBER U3;

ALTER ROLE r3 ADD MEMBER U4;
ALTER ROLE r3 ADD MEMBER U5;
ALTER ROLE r3 ADD MEMBER U6;
```



### B.5 Gán quyền hệ thống cho Role

#### r1 là thành viên của SysAdmin

```sql
ALTER SERVER ROLE sysadmin ADD MEMBER L1;
```



#### r2 là thành viên của db_owner, db_accessadmin

```sql
ALTER ROLE db_owner ADD MEMBER U2;
ALTER ROLE db_accessadmin ADD MEMBER U2;

ALTER ROLE db_owner ADD MEMBER U3;
ALTER ROLE db_accessadmin ADD MEMBER U3;
```



#### r3 là thành viên của SysAdmin, db_owner, db_accessadmin

```sql
ALTER SERVER ROLE sysadmin ADD MEMBER L4;
ALTER ROLE db_owner ADD MEMBER U4;
ALTER ROLE db_accessadmin ADD MEMBER U4;

ALTER SERVER ROLE sysadmin ADD MEMBER L5;
ALTER ROLE db_owner ADD MEMBER U5;
ALTER ROLE db_accessadmin ADD MEMBER U5;

ALTER SERVER ROLE sysadmin ADD MEMBER L6;
ALTER ROLE db_owner ADD MEMBER U6;
ALTER ROLE db_accessadmin ADD MEMBER U6;
```

