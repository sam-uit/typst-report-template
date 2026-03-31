#import "../template/lib.typ": *

= Bước 2. Cấu Hình Chính Sách Khóa Tài Khoản (Account Lockout Policy)
<buoc-2-cau-hinh-chinh-sach-khoa-tai-khoan-account-lockout-policy>

- #strong[Mục tiêu:] Khi có quá nhiều lần đoán sai mật khẩu, tài khoản sẽ tự động bị khóa.
- Kiểm tra lại các tham số:
  - Account lockout duration = 15 minutes;
  - Account lockout threshold = 3;
  - Reset account lockout counter after = 15 minutes.

#figure(image("assets/b2-02.png"),
  caption: [
    Bước 2. Thiết Lập Account Lockout Policy
  ]
)
