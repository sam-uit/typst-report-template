#import "../template/lib.typ": *

= PHẦN C. KIỂM TRA VÙNG NHỚ ỨNG DỤNG VỚI PROCESS EXPLORER
<phan-c-kiem-tra-vung-nho-ung-dung-voi-process-explorer>


== C1 -- Tải và chạy Process Explorer
<c1-tai-va-chay-process-explorer>

+ Truy cập: https:/\/learn.microsoft.com/sysinternals/downloads/process-explorer
+ Giải nén file ZIP.
+ Chạy procexp.exe (Run as Administrator).

== C2 -- Quan sát cây tiến trình
<c2-quan-sat-cay-tien-trinh>

+ Mở Process Explorer.
+ Nhận diện tiến trình bị tô màu tím, xanh lá, xanh dương (theo chuẩn Sysinternals).
+ Giải thích:
  - Màu xanh lá: tiến trình mới tạo
  - Màu xanh dương: tiến trình đang chạy
  - Màu đỏ: tiến trình mới đóng

== C3 -- Phân tích Memory của Notepad (mô phỏng dữ liệu nhạy cảm)
<c3-phan-tich-memory-cua-notepad-mo-phong-du-lieu-nhay-cam>

+ Mở Notepad.
+ Gõ 1 đoạn text ví dụ: “password=12345678” (dùng dữ liệu giả).
+ KHÔNG lưu file.
+ Trở lại Process Explorer → chuột phải vào notepad.exe → Properties.
+ Chọn tab “Memory”.
+ Quan sát các vùng Private Bytes, Working Set, Heap…
+ Chụp màn hình.

Ghi nhận:

→ Dữ liệu “password=12345678” tồn tại trong RAM dù không lưu file.

== C4 -- Kiểm tra chuỗi ký tự trong bộ nhớ Notepad (mức cơ bản)
<c4-kiem-tra-chuoi-ky-tu-trong-bo-nho-notepad-muc-co-ban>

Trong Process Explorer → Properties → tab “Strings”.

- Tìm các đoạn text ứng dụng đang xử lý.
- Ghi nhận: có thể tìm thấy nội dung vừa gõ.
