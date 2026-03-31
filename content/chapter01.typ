#import "../template/lib.typ": *

= Bước 1. Kiểm Tra / Tạo Tài Khoản Mục Tiêu UserTest
<buoc-1-kiem-tra-tao-tai-khoan-muc-tieu-usertest>


== Bước 1. Kiểm tra phiên bản Windows
<buoc-1-kiem-tra-phien-ban-windows>

+ Nhấn Windows + R.
+ Gõ: `winver` → Enter.
+ Ghi lại thông tin phiên bản Windows.

Thông tin phiên bản Windows:

- Windows 7 Ultimate
- Version: 6.1 (Build 7601: Server Pack 1)

#figure(image("assets/p1-b1-01.png"),
  caption: [
    Phần 1. Bước 1. Kiểm tra phiên bản Windows
  ]
)

== Bước 2. Kiểm tra quyền người dùng hiện tại
<buoc-2-kiem-tra-quyen-nguoi-dung-hien-tai>

+ Mở Command Prompt:
  - Start → gõ cmd → Enter.
+ Gõ: `whoami`
+ Ghi lại tên tài khoản.
  - `uit`

#figure(image("assets/p1-b2-01.png"),
  caption: [
    Phần 1. Bước 2. Kiểm tra quyền người dùng hiện tại
  ]
)

== Bước 3. Liệt kê các tài khoản trong máy
<buoc-3-liet-ke-cac-tai-khoan-trong-may>

+ Gõ lệnh: `net user`
+ Ghi chú:
  - Nếu có account lạ → đánh dấu rủi ro.
  - Nếu tài khoản Guest bật → rủi ro cao.

Kết quả:

- Account:
  - Administrator
  - Guest
  - `uit`
- Đánh giá rủi ro:
  - Không có account lạ.
  - Guest được bật: rủi ro cao.

#figure(image("assets/p1-b3-01.png"),
  caption: [
    Phần 1. Bước 3. Liệt kê các tài khoản trong máy
  ]
)

== Bước 4. Tắt Guest Account
<buoc-4-tat-guest-account>

- Chạy cmd với Administrator.
- Chạy lệnh `net user guest /active:no`
  - Nếu chạy với user thường, gặp lỗi như ở 1.
  - Nếu chạy với Administrator, có thể hoàn thành, như ở 2.
- Hoàn thành.
- Kiểm tra lại, sử dụng Local Users and Groups
- Xem thuộc tính của Guest
  - #strong[Account is disabled] ở 3.

#figure(image("assets/p1-b4-01.png"),
  caption: [
    Phần 1. Tắt Guest Account
  ]
)
