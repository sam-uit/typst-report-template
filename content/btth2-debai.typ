#import "../template/lib.typ": *

#unheading[Đề Bài - Cơ Sở Dữ Liệu về Quản Lý Đề Tài]
<de-bai-co-so-du-lieu-ve-quan-ly-de-tai>

Cho lược đồ quan hệ sau, hãy hoàn thành các yêu cầu ở @phan-1[ Mục] (Phần 1) và @phan-2[ Mục] (Phần 2).

+ SINHVIEN(#underline[MSSV], TENSV, SODT, LOP, DIACHI)
+ DETAI(#underline[MSDT], TENDT)
+ SV\_DETAI(#underline[MSSV, MSDT])
+ GIAOVIEN(#underline[MSGV], TENGV, DIACHI, SODT, MSHH, NAMHH)
+ HOCVI(#underline[MSHV], TENHV)
+ CHUYENNGANH(#underline[MSCN], TENCN)
+ GV\_HV\_CN(#underline[MSGV], MSHV, MSCN, NAM)
+ HOCHAM(#underline[MSHH], TENHH)
+ GV\_HDDT(#underline[MSGV, MSDT], DIEM)
+ GV\_PBDT(#underline[MSGV, MSDT], DIEM)
+ GV\_UVDT(#underline[MSGV, MSDT], DIEM)
+ HOIDONG(#underline[MSHD], PHONG, TGBD, NGAYHD, TINHTRANG, MSGV)
+ HOIDONG\_GV(#underline[MSHD, MSGV])
+ HOIDONG\_DT(#underline[MSHD, MSDT], QUYETDINH)

#unheading[Môi Trường Triển Khai]
<moi-truong-trien-khai>

- RDBMS: Microsoft SQL Server 2019 (Azure SQL Edge).
- Editor/IDE: Azure Database Studio (ADS).
- Extensions: SQL Database Projects (`microsoft.sql-database-projects`).

#unheading[Các Tài Nguyên]
<cac-tai-nguyen>

Các tài nguyên (tài liệu, code, vv…) của lab này được lưu tại:

- #link("https://github.com/lt20252cnttalpha/LT.K2025.2-CNTT/tree/main/uit/courses/IE103/assignments/BTTH2")[LT.K2025.2-CNTT \> IE103 \> assignments \> BTTH2]
  - `content`: Thư mục chứa các file nội dung của báo cáo.
  - `content/code`: Thư mục chứa các script `.sql` để thực thi.
  - `IE103-BTTH2`: Thư mục chứa file dự án `.sqlproj` cho SQL Projects.
  - `IE103-BTTH2.ipynb`: Notebook nội dung của lab này.

#todo[Hoàn Thành Notebook cho lab này, lưu tại `IE103-BTTH2.ipynb`.]
