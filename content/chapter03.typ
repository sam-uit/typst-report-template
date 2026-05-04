#import "../template/lib.typ": *

= PHẦN C. KIỂM TRA VÙNG NHỚ ỨNG DỤNG VỚI PROCESS EXPLORER
<phan-c-kiem-tra-vung-nho-ung-dung-voi-process-explorer>


== C1 -- Tải Và Chạy Process Explorer
<c1-tai-va-chay-process-explorer>

+ Truy cập: #link("https://learn.microsoft.com/sysinternals/downloads/process-explorer")[learn.microsoft.com/sysinternals/downloads/process-explorer]
+ Giải nén file ZIP.
+ Chạy #strong[procexp.exe] (#emph[Run as Administrator]).

#figure(image("assets/c1-1.png"),
  caption: [
    C1. Chạy Process Explorer với Quyền Quản Trị
  ]
)

== C2 -- Quan Sát Cây Tiến Trình
<c2-quan-sat-cay-tien-trinh>

+ Mở Process Explorer.
+ Nhận diện tiến trình bị tô màu tím, xanh lá, xanh dương (theo chuẩn Sysinternals).
+ Giải thích:
  - Màu xanh lá: tiến trình mới tạo
  - Màu xanh dương: tiến trình đang chạy
  - Màu đỏ: tiến trình mới đóng

Cây Tiến Trình:

- Vòng đời Tiến trình bắt đầu với màu Xanh Lá, sau đó chuyển sang màu Xanh Dương, và cuối cùng kết thúc là màu Đỏ.
- Một tiến trình có thể gọi/chạy một tiến trình khác, tạo thành Cây Tiến Trình.
  - Ví dụ: #emph[explorer.exe] gọi/chạy #emph[iexplore.exe] được biểu diễn bằng sự thụt lề của #emph[iexplore.exe] so với #emph[explorer.exe].

#figure(image("assets/c2-1.png"),
  caption: [
    C2. Process Explore - Quan Sát Cây Tiến Trình
  ]
)

== C3 -- Phân Tích Memory Của Notepad
<c3-phan-tich-memory-cua-notepad>

+ Mở Notepad.
+ Gõ 1 đoạn text ví dụ: “password=12345678” (dùng dữ liệu giả).
+ KHÔNG lưu file.
+ Trở lại Process Explorer → chuột phải vào notepad.exe → Properties.
+ Chọn tab “Memory”.
+ Quan sát các vùng Private Bytes, Working Set, Heap…
+ Chụp màn hình.

Ghi nhận:

→ Dữ liệu “password=12345678” tồn tại trong RAM dù không lưu file.

== C4 -- Kiểm Tra Chuỗi Ký Tự Trong Bộ Nhớ Notepad
<c4-kiem-tra-chuoi-ky-tu-trong-bo-nho-notepad>

Trong Process Explorer → Properties → tab “Strings”.

- Tìm các đoạn text ứng dụng đang xử lý.
- Ghi nhận: có thể tìm thấy nội dung vừa gõ.
