== E. CURSOR
<e-cursor>


=== Tạo Bảng `DETAI_DIEM`
<tao-bang-detai-diem>

```sql
CREATE TABLE DETAI_DIEM (
    MSDT char(6) PRIMARY KEY,
    DIEMTB FLOAT,
    CONSTRAINT FK_DETAI_DIEM_DETAI FOREIGN KEY (MSDT) REFERENCES DETAI(MSDT)
);
```

`DETAI_DIEM` đã được tạo:

#table(
  columns: (1fr,) * 4,
  align: (left, left, left, left),
  [database], [schema], [name], [type], [IE103-BTTH2], [dbo], [CHUYENNGANH], [BASE TABLE], [IE103-BTTH2], [dbo], [DETAI], [BASE TABLE], [IE103-BTTH2], [dbo], [GIAOVIEN], [BASE TABLE], [IE103-BTTH2], [dbo], [GV\_HDDT], [BASE TABLE], [IE103-BTTH2], [dbo], [GV\_HV\_CN], [BASE TABLE], [IE103-BTTH2], [dbo], [GV\_PBDT], [BASE TABLE], [IE103-BTTH2], [dbo], [GV\_UVDT], [BASE TABLE], [IE103-BTTH2], [dbo], [HOCHAM], [BASE TABLE], [IE103-BTTH2], [dbo], [HOCVI], [BASE TABLE], [IE103-BTTH2], [dbo], [HOIDONG], [BASE TABLE], [IE103-BTTH2], [dbo], [HOIDONG\_DT], [BASE TABLE], [IE103-BTTH2], [dbo], [HOIDONG\_GV], [BASE TABLE], [IE103-BTTH2], [dbo], [SINHVIEN], [BASE TABLE], [IE103-BTTH2], [dbo], [SV\_DETAI], [BASE TABLE], [IE103-BTTH2], [dbo], [DETAI\_DIEM], [BASE TABLE]
)
