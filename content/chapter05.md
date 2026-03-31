# Bước 5. Thay Đổi Chính Sách Khóa Tài Khoản Và So Sánh

## Mục Tiêu

- Thấy được mối liên hệ giữa cấu hình chính sách và mức độ an toàn.

## Hướng Dẫn

- Mở lại **Local Security Policy** (`secpol.msc`).
- Vào **Account Policies → Account Lockout Policy**.
- Thay đổi **Account lockout threshold**, ví dụ từ 3 → 10 *invalid logon attempts*.
- Đăng xuất và lặp lại quá trình thử mật khẩu sai cho `UserTest` như ở Bước 3, đếm số lần nhập sai trước khi tài khoản bị khóa.
- Quan sát lại log trong **Event Viewer** để xem số lượng sự kiện `4625` và sự kiện `4740` thay đổi như thế nào so với cấu hình trước.

## Thực Hiện

## Thảo Luận

- Khi threshold = 3, hệ thống nhạy với tấn công dò mật khẩu hơn, kẻ tấn công chỉ cần 3 lần nhập/thử sai để bị khóa tài khoản và mất/giảm cơ hội đoán mật khẩu, nhưng người dùng hợp lệ cũng dễ bị khóa tài khoản hơn nếu nhập sai mật khẩu cùng số lần.
- Khi threshold = 10, hệ thống ít nhạy hơn, kẻ tấn công cần tới 10 lần nhập sai để khóa tài khoản, nhưng người dùng hợp lệ cũng ít bị khóa tài khoản hơn nếu nhập sai mật khẩu cùng số lần.

Điều này yêu cầu người Quản Trị phải cân nhắc kỹ lưỡng khi cấu hình chính sách khóa tài khoản, đảm bảo rằng hệ thống đủ nhạy để phát hiện tấn công dò mật khẩu, nhưng không quá nhạy để khóa tài khoản của người dùng hợp lệ.

Threshold = 3 là một con số hợp lý, hoặc thậm chí dư thừa cho các môi trường doanh nghiệp, nhạy cảm với bảo mật và các sai sót. Vì ở môi trường doanh nghiệp, mật khẩu thường không phải là hình thức đăng nhập duy nhất, mà có thể có thêm các hình thức khác, ví dụ: Sinh Trắc Học (Vân Tay, Mống Mắt, vv..); Thẻ Từ Định Danh, vv...

Threshold = 10 là quá nhiều, kể cả cho máy tính người dùng cá nhân, vì vậy đây là một con số không hợp lý, hoặc nhẹ hơn là không cần thiết.
