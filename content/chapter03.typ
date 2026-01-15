#import "../template/lib.typ": *

= Câu 3. An Ninh Thông Tin
<cau-3-an-ninh-thong-tin>

Dựa vào CSDL đã thiết kế ở BTTH số 2 (QLĐT), hãy thực hiện các yêu cầu sau:

+ Tạo ra 3 users: `GIANGVIEN`, `GIAOVU` và `SINHVIEN`, đặt #emph[mật khẩu tuỳ ý].
+ Phân quyền cho các users trên database như sau:
  - `GIAOVU` có quyền xem và chỉnh sửa (cập nhật) trên tất cả các bảng
  - `GIANGVIEN`:
    - Có quyền xem trên các bảng có liên quan đến thông tin GV, các đề tài mà GV hướng dẫn, phản biện hay làm uỷ viên, xem thông tin hội đồng và danh sách các đề tài hiện có.
    - Có quyền cập nhật thông tin của mình.
  - `SINHVIEN` có quyền xem thông tin của sinh viên, thông tin của hội đồng và danh sách các đề tài hiện có.
  - Tất cả người dùng trên đều không có quyền xoá thông tin.

== Tạo Ra 3 Users
<tao-ra-3-users>

\(Trình bày ở đây)

== Phân Quyền Cho Các Users Trên Database
<phan-quyen-cho-cac-users-tren-database>


=== GIAOVU
<giaovu>

\(Trình bày ở đây)

=== GIANGVIEN
<giangvien>

\(Trình bày ở đây)

=== SINHVIEN
<sinhvien>

\(Trình bày ở đây)

=== Tất Cả Người Dùng
<tat-ca-nguoi-dung>

\(Trình bày ở đây)
