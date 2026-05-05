# Các Biện Pháp Phòng Chống

Để phòng chống Trojan, Virus và Worm một cách hiệu quả, hệ thống cần thiết lập các rào cản từ mức độ con người đến mức độ kỹ thuật. Dưới đây là các biện pháp được sắp xếp theo **thứ tự ưu tiên từ cao đến thấp**:

1. **Nâng Cao Nhận Thức Người Dùng (Phòng Ngừa Cấp Độ Người Dùng)**
    - Đây là ưu tiên số một vì phần lớn mã độc lây nhiễm qua kỹ thuật lừa đảo (social engineering). Không mở file đính kèm lạ (như `.docm`, `.exe`) hoặc click vào link không rõ nguồn gốc trong email. Tuyệt đối không cài phần mềm crack, keygen hay dùng USB lạ.
2. **Cập Nhật Hệ Điều Hành Và Phần Mềm (Patch Management)**
    - Thường xuyên cài đặt các bản vá lỗi bảo mật cho Windows và các ứng dụng. Worms thường lợi dụng lỗ hổng mạng của HĐH cũ để tự động lây lan mà không cần người dùng thao tác.
3. **Sử Dụng Giải Pháp Antivirus/EDR Mạnh Mẽ**
    - Cài đặt, kích hoạt và liên tục cập nhật cơ sở dữ liệu của phần mềm diệt virus (Windows Defender hoặc các giải pháp Endpoint Protection). Quét định kỳ toàn bộ hệ thống và thiết lập chế độ bảo vệ thời gian thực (Real-time protection).
4. **Phân Quyền Tối Thiểu Và Bảo Vệ Cấu Hình (Least Privilege & Hardening)**
    - Sử dụng tài khoản User thường thay vì Administrator cho các tác vụ hàng ngày. Vô hiệu hóa tính năng Macro của Office, tắt các dịch vụ Windows không dùng đến (như SMB, RDP nếu không cần) để thu hẹp bề mặt tấn công.
5. **Bảo Mật Cấp Độ Mạng (Tường Lửa & IDS/IPS)**
    - Kích hoạt tường lửa (Firewall) để đóng các cổng (ports) không cần thiết. Triển khai IDS/IPS và DNS Filtering để chặn truy cập đến các tên miền độc hại, ngăn chặn Trojan kết nối về máy chủ điều khiển (C2).
6. **Sao Lưu Dữ Liệu Định Kỳ (Data Backup)**
    - Thực hiện chiến lược sao lưu 3-2-1 (3 bản sao, 2 phương tiện, 1 bản offline). Đây là chốt chặn cuối cùng giúp khôi phục hệ thống an toàn nếu lỡ bị Virus phá hủy file hoặc bị Ransomware mã hóa tống tiền.
