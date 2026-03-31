# Bước 2. Cấu Hình Chính Sách Khóa Tài Khoản (Account Lockout Policy)

## Mục Tiêu

- Khi có quá nhiều lần đoán sai mật khẩu, tài khoản sẽ tự động bị khóa.

## Hướng Dẫn

- Mở **Local Security Policy**: nhấn Windows + R → gõ `secpol.msc` → Enter.
- Trong khung bên trái, chọn: **Account Policies → Account Lockout Policy**.
- Double-click vào **Account lockout threshold** → đặt giá trị là *3 invalid logon attempts* → OK.
- Khi được hỏi thiết lập *Reset account lockout counter after* và *Account lockout duration*, đặt cả hai giá trị là *15 minutes*.
- Kiểm tra lại các tham số:
    - Account lockout duration = 15 minutes;
    - Account lockout threshold = 3;
    - Reset account lockout counter after = 15 minutes.

## Thực Hiện

- Các tham số đã cấu hình:
    - Account lockout duration = 15 minutes;
    - Account lockout threshold = 3;
    - Reset account lockout counter after = 15 minutes.

![Bước 2. Thiết Lập Account Lockout Policy](assets/b2-02.png)
