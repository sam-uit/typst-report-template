#import "../template/lib.typ": *

= Bước 1. Kiểm Tra / Tạo Tài Khoản Mục Tiêu UserTest
<buoc-1-kiem-tra-tao-tai-khoan-muc-tieu-usertest>


== Mục Tiêu
<muc-tieu>

- Tạo hoặc xác nhận tài khoản nạn nhân `UserTest`.
- Login thử vào tài khoản nạn nhân `UserTest`.

== Hướng Dẫn
<huong-dan>


=== Bước 1. Kiểm tra / tạo tài khoản mục tiêu UserTest
<buoc-1-kiem-tra-tao-tai-khoan-muc-tieu-usertest>

- Đăng nhập Windows bằng tài khoản có quyền Administrator.
- Mở #strong[Computer Management]: Windows + X → chọn Computer Management, hoặc `compmgmt.msc` → Enter.
- Trong khung bên trái, chọn: #strong[System Tools → Local Users and Groups → Users].
- Kiểm tra xem đã có tài khoản `UserTest` hay chưa trong danh sách #strong[Users].

Nếu CHƯA có tài khoản UserTest:

- Chuột phải vào #strong[Users → New User…]
- User name: `UserTest`\; Full name: #emph[User Test] (tùy ý);
- Password: `P@ssw0rd123` (hoặc tùy ý);
- Bỏ chọn "#emph[User must change password at next logon]" nếu không muốn thay đổi ở lần đăng nhập đầu tiên;
- Nhấn #strong[Create].

== Thực Hiện
<thuc-hien>


=== Tạo Tài Khoản Nạn Nhân
<tao-tai-khoan-nan-nhan>

#figure(
  table(
    columns: (40%, 60%),
    align: (left, left),
    [Thành Phần], [Giá Trị],
    [Tài Khoản], [`UserTest`],
    [Mật Khẩu], [`P@ssw0rd123`]
  ),
  kind: table,
  caption: [Bước 1. Thông Tin Tài Khoản Nạn Nhân]
)
- Sử dụng #strong[Computer Management] để tạo tài khoản mới `UserTest`:

#figure(image("assets/b1-01.png"),
  caption: [
    Bước 1. Tạo Tài Khoản UserTest
  ]
)

=== Login Thử Vào Tài Khoản Nạn Nhân
<login-thu-vao-tai-khoan-nan-nhan>

- Login thử vào tài khoản nạn nhân với:
  - Tài Khoản: `UserTest`
  - Mật Khẩu: `P@ssw0rd123`

#figure(image("assets/b1-06.png"),
  caption: [
    Bước 1. Tài Khoản Nạn Nhân Đăng Nhập Thành Công
  ]
)
