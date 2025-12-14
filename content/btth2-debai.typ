#import "../template/lib.typ": *

#unheading[Đề Bài - Cơ Sở Dữ Liệu về Quản Lý Đề Tài]
<de-bai-co-so-du-lieu-ve-quan-ly-de-tai>

Cho lược đồ quan hệ sau, hãy hoàn thành các yêu cầu ở @phan-1[Phần] và @phan-2[Phần].

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
