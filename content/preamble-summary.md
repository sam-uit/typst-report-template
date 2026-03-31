# TÓM TẮT

**Lưu ý an toàn & đạo đức:**

- Chỉ thực hiện bài thực hành này trên máy cá nhân, máy ảo hoặc môi trường lab được phép.
- Không áp dụng các kỹ thuật trong bài với hệ thống hay tài khoản không thuộc quyền quản lý của bạn.

## I. MỤC TIÊU

1. Hiểu khái niệm tấn công dò tìm mật khẩu chủ động (online password guessing / brute force).
2. Mô phỏng được quá trình thử mật khẩu nhiều lần đối với tài khoản Windows.
3. Cấu hình và đánh giá được Account Lockout Policy trên Windows để giảm rủi ro tấn công dò mật khẩu.
4. Sử dụng Event Viewer để phân tích log sự kiện đăng nhập: đăng nhập sai, khóa tài khoản.
5. Đề xuất được một số biện pháp phòng chống tấn công dò mật khẩu.

## II. MÔI TRƯỜNG & CHUẨN BỊ

1. Hệ điều hành: 01 máy Windows 10 hoặc Windows 11 (máy ảo hoặc máy thật đều được; khuyến khích dùng VM).
2. Tài khoản:
    - 01 tài khoản có quyền Administrator (ví dụ: AdminLab).
    - 01 tài khoản người dùng thường để làm “nạn nhân” (ví dụ: UserTest) với mật khẩu không quá khó nhớ (ví dụ: `P@ssw0rd123` – giảng viên chọn trước).
3. Công cụ tích hợp sẵn trên Windows:
    - Local Users and Groups (lusrmgr.msc).
    - Local Security Policy (secpol.msc).
    - Event Viewer (eventvwr.msc).

## III. KỊCH BẢN BÀI THỰC HÀNH

Sinh viên đóng vai kẻ tấn công có quyền truy cập vật lý tới máy Windows (hoặc đang ngồi trước máy của nạn nhân ở màn hình đăng nhập). Mục tiêu là dò tìm mật khẩu của tài khoản UserTest bằng cách thử nhiều mật khẩu (tấn công chủ động – online), kích hoạt cơ chế khóa tài khoản và quan sát log trên hệ thống.
