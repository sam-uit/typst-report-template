#import "../template/lib.typ": *

= Bước 2. Cấu Hình Chính Sách Khóa Tài Khoản (Account Lockout Policy)
<buoc-2-cau-hinh-chinh-sach-khoa-tai-khoan-account-lockout-policy>


== Mục Tiêu
<muc-tieu>

- Khi có quá nhiều lần đoán sai mật khẩu, tài khoản sẽ tự động bị khóa.

== Hướng Dẫn
<huong-dan>

- Mở #strong[Local Security Policy]: nhấn Windows + R → gõ `secpol.msc` → Enter.
- Trong khung bên trái, chọn: #strong[Account Policies → Account Lockout Policy].
- Double-click vào #strong[Account lockout threshold] → đặt giá trị là #emph[3 invalid logon attempts] → OK.
- Khi được hỏi thiết lập #emph[Reset account lockout counter after] và #emph[Account lockout duration], đặt cả hai giá trị là #emph[15 minutes].
- Kiểm tra lại các tham số:
  - Account lockout duration = 15 minutes;
  - Account lockout threshold = 3;
  - Reset account lockout counter after = 15 minutes.

== Thực Hiện
<thuc-hien>

- Các tham số đã cấu hình:
  - Account lockout duration = 15 minutes;
  - Account lockout threshold = 3;
  - Reset account lockout counter after = 15 minutes.

#figure(image("assets/b2-02.png"),
  caption: [
    Bước 2. Thiết Lập Account Lockout Policy
  ]
)
