# ĐÁNH GIÁ RỦI RO VÀ ĐỀ XUẤT BIỆN PHÁP PHÒNG CHỐNG

Sinh viên phân tích và trả lời:

1. **Máy bạn có cổng nào mở không cần thiết không?**
    - Máy này có thể đóng tất cả các cổng, vì:
        - Không có nhu cầu chia sẻ file qua SMB.
        - Không có nhu cầu điều khiển từ xa qua PowerShell, vv...
        - Không có dịch vụ cần phục vụ trình khách nào.
2. **Có tài khoản nào không dùng nhưng còn bật?**
    - Hiện tại là không.
    - Guest đã được tắt vì không sử dụng.
3. **Tường lửa có bật không?**
    - Có.
    - Bật cho cả các môi trường từ Tổ Chức, Riêng Tư tới Công Cộng.
4. **Có chia sẻ file không an toàn không?**
    - Hiện tại là không.
    - File chia sẻ trực tiếp bằng cách sử dụng file .iso và gán vào virtual CD/DVD.
    - Đảm bảo rằng chỉ có dữ liệu được kiểm soát mới được tiếp cận.
    - Một mô hình cách ly (DMZ) vụng về.
5. **Bạn đề xuất 5 biện pháp tăng cường bảo mật:**
    - Đổi mật khẩu mạnh:
        - Trên 8 ký tự.
        - Bao gồm HOA, thường, số, và ký tự đặc biệt.
        - Có sự phối hợp đảm bảo dễ nhớ, có ý nghĩa nhưng không phải là thông tin cá nhân dễ thấy.
    - Xóa tài khoản không dùng:
        - Guest hoặc người dùng đã không còn sử dụng hệ thống, đặc biệt các hệ thống có tính chia sẻ, dùng chung.
    - Tắt chia sẻ không cần thiết:
        - Các chia sẻ và các dịch vụ không cần thiết, ví dụ SMB, nên được tắt.
        - Nếu máy không chạy dịch vụ để phục vụ các trình khách (client), thì không cần hoặc hạn chế mở cổng ít nhất có thể.
    - Bật tường lửa:
        - Luôn bật tường lửa.
    - Cập nhật Windows định kỳ:
        - Cho phép Windows tự động cập nhật.
        - Hoặc cho phép Windows kiểm tra và tải cập nhật, nhưng gửi thông báo để người dùng chủ động cài đặt cập nhật.
6. **Bổ sung:**
    - Luôn sử dụng phiên bản hệ điều hành còn được hỗ trợ.
    - Trừ các trường hợp đặc biệt, ví dụ vì lý do tương thích phần mềm.
        - Có phương án cách ly hoặc cô lập môi trường phù hợp nếu cần.
    - Quản lý truy cập và cách giao tiếp dữ liệu cẩn thận, không tùy tiện.
