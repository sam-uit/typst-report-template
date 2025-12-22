## E. CURSOR

### Tạo Bảng `DETAI_DIEM`

```sql
CREATE TABLE DETAI_DIEM (
    MSDT char(6) PRIMARY KEY,
    DIEMTB FLOAT,
    CONSTRAINT FK_DETAI_DIEM_DETAI FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);
```

`DETAI_DIEM` đã được tạo:

| database    | schema | name        | type       |
| ----------- | ------ | ----------- | ---------- |
| IE103-BTTH2 | dbo    | CHUYENNGANH | BASE TABLE |
| IE103-BTTH2 | dbo    | DETAI       | BASE TABLE |
| IE103-BTTH2 | dbo    | GIAOVIEN    | BASE TABLE |
| IE103-BTTH2 | dbo    | GV_HDDT     | BASE TABLE |
| IE103-BTTH2 | dbo    | GV_HV_CN    | BASE TABLE |
| IE103-BTTH2 | dbo    | GV_PBDT     | BASE TABLE |
| IE103-BTTH2 | dbo    | GV_UVDT     | BASE TABLE |
| IE103-BTTH2 | dbo    | HOCHAM      | BASE TABLE |
| IE103-BTTH2 | dbo    | HOCVI       | BASE TABLE |
| IE103-BTTH2 | dbo    | HOIDONG     | BASE TABLE |
| IE103-BTTH2 | dbo    | HOIDONG_DT  | BASE TABLE |
| IE103-BTTH2 | dbo    | HOIDONG_GV  | BASE TABLE |
| IE103-BTTH2 | dbo    | SINHVIEN    | BASE TABLE |
| IE103-BTTH2 | dbo    | SV_DETAI    | BASE TABLE |
| IE103-BTTH2 | dbo    | DETAI_DIEM  | BASE TABLE |
