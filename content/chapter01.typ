#import "../template/lib.typ": *

= Câu 1. Tổ Chức Và Biểu Diễn Thông Tin
<cau-1-to-chuc-va-bieu-dien-thong-tin>

Dựa vào CSDL đã thiết kế ở BTTH số 2 (QLĐT), hãy thực hiện các yêu cầu sau:

- Vẽ sơ đồ ERD cho các quan hệ trong CSDL QLDT.

== Sơ Đồ ERD (Chen Notation)
<so-do-erd-chen-notation>


=== Các Thực Thể
<cac-thuc-the>

- `DETAI`: Đề Tài.
- `GIAOVIEN`: Giáo Viên.
- `HOCHAM`: Học Hàm.
- `HOCVI`: Học Vị.
- `HOIDONG`: Hội Đồng.
- `SINHVIEN`: Sinh Viên.
- `CHUYENNGANH`: Chuyên Ngành.

=== Các Quan Hệ
<cac-quan-he>

- `SINHVIEN` m - n `DETAI`: `SV_DETAI`.
  - Một sinh viên được THỰC HIỆN nhiều đề tài (nhiều lần).
  - Một đề tài được THỰC HIỆN bởi nhiều sinh viên (tối đa 3).
- `GIAOVIEN` m - n `DETAI`: `GV_HDDT`.
  - Một giáo viên có thể HƯỚNG DẪN nhiều đề tài.
  - Một đề tài có thể được HƯỚNG DẪN bởi nhiều giáo viên (tối đa 2).
- `GIAOVIEN` m - n `DETAI`: `GV_PBDT`.
  - Một giáo viên có thể PHẢN BIỆN nhiều đề tài.
  - Một đề tài có thể được PHẢN BIỆN bởi nhiều giáo viên.
- `GIAOVIEN` m -n `DETAI`: `GV_UVDT`.
  - Một giáo viên có thể LÀM UỶ VIÊN nhiều đề tài.
  - Một đề tài có thể có nhiều giáo viên LÀM UỶ VIÊN.
- `GIAOVIEN` 1 - n `HOIDONG`:
  - Một giáo viên có thể làm CHỦ TỊCH nhiều hội đồng.
  - Một hội đồng chỉ có một CHỦ TỊCH.
- `GIAOVIEN` m - n `HOIDONG`: `HOIDONG_GV`.
  - Một giáo viên có thể tham gia THÀNH VIÊN nhiều hội đồng.
  - Một hội đồng có thể có nhiều giáo viên là THÀNH VIÊN.
- `DETAI` m - n `HOIDONG`: `HOIDONG_DT`.
  - Một đề tài có thể có QUYẾT ĐỊNH từ nhiều hội đồng.
  - Một hội đồng có thể có QUYẾT ĐỊNH nhiều đề tài.
- `HOCHAM` 1 - n `GIAOVIEN`:
  - Một học hàm có thể có được cấp cho nhiều Giáo Viên.
  - Một Giáo viên chỉ có một Học Hàm chính.
- `HOCVI` m - n `GIAOVIEN`: `GV_HV_CN`.
  - Một học Vị có thể được cấp cho nhiều Giáo Viên.
  - Một giáo viên chỉ có thể có nhiều Học Vị trong nhiều năm khác nhau.
- `CHUYENNGANH` m - n `GIAOVIEN`: `GV_HV_CN`.
  - Một chuyên ngành có thể có nhiều giáo viên.
  - Một giáo viên có thể dạy nhiều chuyên ngành.

=== Danh Sách Các Bảng
<danh-sach-cac-bang>

Bao gồm:

- Mỗi Thực Thể là một Bảng.
- Các Quan Hệ m - n được tách thành bảng riêng.

Danh sách:

- `DETAI`: Đề Tài.
- `GIAOVIEN`: Giáo Viên.
- `HOCHAM`: Học Hàm.
- `HOCVI`: Học Vị.
- `HOIDONG`: Hội Đồng.
- `SINHVIEN`: Sinh Viên.
- `CHUYENNGANH`: Chuyên Ngành.
- `SV_DETAI`: Sinh Viên - Đề Tài.
- `GV_HDDT`: Giáo Viên - Đề Tài (Hướng Dẫn).
- `GV_PBDT`: Giáo Viên - Đề Tài (Phản Biện).
- `GV_UVDT`: Giáo Viên - Đề Tài (Làm Uỷ Viên).
- `HOIDONG_GV`: Hội Đồng - Giáo Viên.
- `HOIDONG_DT`: Hội Đồng - Đề Tài.
- `GV_HV_CN`: Giáo Viên - Học Vị - Chuyên Ngành.

=== Sơ Đồ ER (Chen) Tổng Quan
<so-do-er-chen-tong-quan>

#figure(image("diagrams/BTTH6-ER.svg"),
  caption: [
    Câu 1 - Sơ Đồ ERD
  ]
)
