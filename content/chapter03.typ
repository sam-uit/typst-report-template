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
+ Gõ 1 đoạn text ví dụ: "password=12345678" (dùng dữ liệu giả).
+ KHÔNG lưu file.
+ Trở lại Process Explorer → chuột phải vào #emph[notepad.exe] → Properties.
+ Chọn tab #strong[Memory].
+ Quan sát các vùng #strong[Private Bytes], #strong[Working Set], #strong[Heap].
+ Chụp màn hình.

Ghi nhận:

→ Dữ liệu "password=12345678" tồn tại trong RAM dù không lưu file.

Notepad:

- Tab #strong[Performance] (tùy phiên bản của Process Explorer).
- Các giá trị liên quan đến bộ nhớ thay đổi tương ứng khi Notepad làm việc với file.

Khi Notepad làm việc với file trống chưa có nội dung:

- Private Bytes: 1,196 KB
- Working Set: 4,060 KB
- Đây là lượng bộ nhớ khởi đầu của Notepad.

#figure(image("assets/c3-1.png"),
  caption: [
    C3. Process Explorer - Memory Của Notepad
  ]
)

Khi Notepad làm việc với file có nội dung:

- Private Bytes: 1,244 KB
- Working Set: 4,508 KB
- Có sự tăng nhẹ tương ứng với lượng nội dung của file.

#figure(image("assets/c3-2.png"),
  caption: [
    C3. Process Explorer - Memory Của Notepad (tiếp)
  ]
)

== C4 -- Kiểm Tra Chuỗi Ký Tự Trong Bộ Nhớ Notepad
<c4-kiem-tra-chuoi-ky-tu-trong-bo-nho-notepad>

Trong Process Explorer → Properties → tab #strong[Strings].

- Tìm các đoạn text ứng dụng đang xử lý.
- Ghi nhận: có thể tìm thấy nội dung vừa gõ.

Notepad \> Properties \> Strings:

- Các ký tự được nhập vào file và được "giải mã" bởi Process Explorer thành dạng xem được (printable).
- Có thể tìm thấy hoặc không các ký tự đang gõ vào file (và được lưu trong RAM).

#figure(image("assets/c4-1.png"),
  caption: [
    C3. Process Explorer - Notepad - String
  ]
)
