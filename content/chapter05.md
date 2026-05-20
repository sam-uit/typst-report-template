# PHẦN 5 — XỬ LÝ RỦI RO (RISK TREATMENT)

## Bước 8 & 9 — Kế Hoạch Xử Lý Rủi Ro

Với tất cả 14 rủi ro đều ở mức Trung Bình hoặc Cao, mỗi rủi ro được gán một chiến lược
xử lý và biện pháp cụ thể. Chiến lược sử dụng:

- **Avoid** (Tránh): Loại bỏ hoàn toàn hành vi dẫn đến rủi ro.
- **Mitigate** (Giảm): Giảm khả năng xảy ra hoặc mức độ ảnh hưởng.
- **Transfer** (Chuyển): Chuyển giao rủi ro cho bên thứ ba (bảo hiểm, dịch vụ bảo mật).
- **Accept** (Chấp nhận): Chấp nhận rủi ro vì chi phí xử lý không tương xứng.

<!-- Bảng 5 -->

| Mã | Rủi Ro | Mức | Chiến Lược | Biện Pháp Đề Xuất |
|----|--------|-----|-----------|-------------------|
| T1 | Account Hijacking | Cao | Mitigate | Bật 2FA trên tất cả tài khoản MXH; dùng password manager để tạo và lưu mật khẩu mạnh, riêng biệt. |
| T2 | Lộ thông tin privacy | Cao | Mitigate | Rà soát cài đặt quyền riêng tư định kỳ (mỗi 3 tháng); chuyển hồ sơ về chế độ "Chỉ bạn bè". |
| T3 | Fake App | Cao | Avoid | Chỉ tải ứng dụng từ App Store / Google Play; không cài APK từ nguồn ngoài. |
| T4 | Phishing / Smishing | Cao | Mitigate | Không nhấp link trong SMS/email; luôn truy cập trực tiếp trang web ngân hàng; kiểm tra URL trước khi nhập thông tin. |
| T5 | SIM Swapping | TB | Mitigate | Đăng ký bảo vệ SIM với nhà mạng; dùng Authenticator App thay SMS OTP; hạn chế đăng thông tin cá nhân lên MXH. |
| T6 | Trojan | Cao | Avoid | Không cài APK ngoài kho; bật Google Play Protect; không tải file từ Zalo/Telegram chưa xác thực nguồn gốc. |
| T7 | Credential Stuffing | Cao | Mitigate | Dùng mật khẩu riêng biệt cho mỗi dịch vụ (password manager); bật cảnh báo đăng nhập bất thường trên Gmail. |
| T8 | Truy cập thiết bị bị mất | Cao | Mitigate | Bật màn hình khóa PIN/Face ID; cài thời gian tự khóa ≤ 1 phút; bật Find My Device / Find My iPhone. |
| T9 | App quyền danh bạ | Cao | Mitigate | Từ chối quyền danh bạ với ứng dụng không cần thiết; rà soát lại quyền đã cấp trong Cài đặt hệ thống. |
| T10 | Đồng bộ cloud không bảo mật | TB | Mitigate | Bật 2FA cho tài khoản Google / iCloud; đổi mật khẩu thành chuỗi mạnh dài ≥ 12 ký tự. |
| T11 | Rò rỉ cloud backup | TB | Mitigate | Kiểm tra và giới hạn nội dung được sao lưu; lưu ảnh nhạy cảm trong album ẩn có mã khóa riêng. |
| T12 | App chỉnh sửa ảnh độc hại | TB | Avoid | Chỉ dùng ứng dụng chỉnh sửa ảnh uy tín từ kho chính thức; cấp quyền ảnh ở mức "Chọn ảnh" thay vì "Toàn bộ thư viện". |
| T13 | SMS Interception | TB | Mitigate | Chuyển sang dùng Authenticator App (Google Authenticator, Authy) cho tất cả dịch vụ hỗ trợ TOTP. |
| T14 | Spyware | TB | Mitigate | Không cho mượn điện thoại không có giám sát; bật App Lock cho ứng dụng nhạy cảm; kiểm tra ứng dụng lạ định kỳ. |

---

# PHẦN 6 — NHẬN XÉT & TỰ ĐÁNH GIÁ

## Bước 10 — Trả Lời Câu Hỏi Phản Chiếu

### Câu 1: Rủi Ro Nào Nghiêm Trọng Nhất? Vì Sao?

Rủi ro nghiêm trọng nhất là **T4 — Phishing / Smishing** nhắm vào tài khoản ngân hàng và
ví điện tử, với Risk Level = 9/9 (Likelihood 3, Impact 3). Đây là mức tối đa trong thang
đánh giá. Likelihood ở mức cao nhất vì lừa đảo qua SMS giả mạo ngân hàng đang xảy ra
hằng ngày ở Việt Nam, rất dễ gặp và không đòi hỏi kỹ năng kỹ thuật cao từ phía kẻ tấn
công. Impact cũng ở mức tối đa vì nạn nhân tự cung cấp thông tin đăng nhập và OTP — kẻ
tấn công có thể chuyển tiền ngay lập tức và gần như không thể thu hồi. Đây là kịch bản
gây thiệt hại tài chính trực tiếp, nhanh chóng và phổ biến nhất trong thực tế hiện nay.

### Câu 2: Nếu Không Áp Dụng Biện Pháp, Hậu Quả Có Thể Là Gì?

Nếu không áp dụng bất kỳ biện pháp xử lý rủi ro nào, hậu quả sẽ leo thang theo chuỗi.
Trước tiên, tài khoản ngân hàng bị xâm phạm dẫn đến mất tiền trực tiếp và không thể
hoàn lại. Tiếp theo, email bị chiếm mang theo quyền khôi phục mật khẩu của hầu hết dịch
vụ khác — kẻ tấn công từ đó chiếm quyền kiểm soát toàn bộ danh tính số. Tài khoản mạng
xã hội bị lợi dụng để phát tán lừa đảo đến người thân, gây thiệt hại cho cả cộng đồng
xung quanh. Dài hạn, thông tin cá nhân bị rao bán trên dark web, làm nguyên liệu cho các
cuộc tấn công tinh vi hơn trong tương lai. Một lỗ hổng không được vá có thể kéo theo
hàng loạt rủi ro mới mà nạn nhân không hay biết.

### Câu 3: Vai Trò Của Người Dùng Trong Quản Lý Rủi Ro Là Gì?

Người dùng vừa là **tuyến phòng thủ đầu tiên** vừa là **mắt xích yếu nhất** trong hệ
thống an ninh thông tin. Trong bài thực hành này, hầu hết các lỗ hổng đều bắt nguồn từ
thói quen hằng ngày: mật khẩu yếu, cấp quyền ứng dụng thiếu cẩn thận, không bật 2FA,
hay nhấp vào link không xác thực. Công nghệ bảo mật — dù tinh vi đến đâu — chỉ phát huy
hiệu quả khi người dùng sử dụng đúng cách và duy trì thói quen bảo mật nhất quán. Vì
vậy, vai trò của người dùng không chỉ là nạn nhân thụ động mà phải là người chủ động:
thường xuyên cập nhật kiến thức về mối đe dọa mới, rà soát cài đặt bảo mật định kỳ, và
xem an ninh thông tin là trách nhiệm cá nhân, không phải việc của riêng bộ phận IT.
