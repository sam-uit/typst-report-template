# PHẦN 5. XỬ LÝ RỦI RO (RISK TREATMENT)

Bước 8: Với mỗi rủi ro mức Trung bình hoặc Cao, chọn 1 chiến lược xử lý:

- Avoid (Tránh)
- Mitigate (Giảm)
- Transfer (Chuyển)
- Accept (Chấp nhận)

Bước 9: Đề xuất biện pháp cụ thể.

Bảng 5: Kế hoạch xử lý rủi ro

| Rủi ro | Mức | Chiến lược | Biện pháp đề xuất |
| --- | --- | --- | --- |
| | | | |

## Bước 8. Chiến Lược Xử Lý Rủi Ro

Với tất cả 14 rủi ro đều ở mức Trung Bình hoặc Cao, mỗi rủi ro được gán một chiến lược
xử lý và biện pháp cụ thể.

Chiến lược sử dụng:

- **Avoid** (Tránh):
  - Loại bỏ hoàn toàn hành vi dẫn đến rủi ro, không thể chấp nhận được.
- **Mitigate** (Giảm):
  - Giảm khả năng xảy ra hoặc mức độ ảnh hưởng vì khó lường, không thể loại bỏ hoàn toàn.
- **Transfer** (Chuyển):
  - Chuyển giao rủi ro cho bên thứ ba (bảo hiểm, dịch vụ bảo mật).
- **Accept** (Chấp nhận):
  - Chấp nhận rủi ro vì chi phí xử lý không tương xứng hoặc không có phương án hiệu quả.

## Bước 9. Đề Xuất Biện Pháp Cụ Thể

<!-- | Mã | Rủi Ro | Mức | Chiến Lược | Biện Pháp Đề Xuất |
|----|--------|-----|-----------|-------------------|
| T1 | Chiếm đoạt tài khoản | Cao | Mitigate | Bật 2FA trên tất cả tài khoản MXH; dùng password manager để tạo và lưu mật khẩu mạnh, riêng biệt. |
| T2 | Lộ thông tin qua privacy | Cao | Mitigate | Rà soát cài đặt quyền riêng tư định kỳ (mỗi 3 tháng); chuyển hồ sơ về chế độ "Chỉ bạn bè". |
| T3 | Ứng dụng giả mạo | Cao | Avoid | Chỉ tải ứng dụng từ App Store / Google Play; không cài APK từ nguồn ngoài. |
| T4 | Lừa đảo Phishing / Smishing | Cao | Mitigate | Không nhấp link trong SMS/email; luôn truy cập trực tiếp trang web ngân hàng; kiểm tra URL trước khi nhập thông tin. |
| T5 | SIM Swapping | TB | Mitigate | Đăng ký bảo vệ SIM với nhà mạng; dùng Authenticator App thay SMS OTP; hạn chế đăng thông tin cá nhân lên MXH. |
| T6 | Trojan | Cao | Avoid | Không cài APK ngoài kho; bật Google Play Protect; không tải file từ Zalo/Telegram chưa xác thực nguồn gốc. |
| T7 | Credential Stuffing | Cao | Mitigate | Dùng mật khẩu riêng biệt cho mỗi dịch vụ (password manager); bật cảnh báo đăng nhập bất thường trên Gmail. |
| T8 | Truy cập thiết bị bị mất | Cao | Mitigate | Bật màn hình khóa PIN/Face ID; cài thời gian tự khóa ≤ 1 phút; bật Find My Device / Find My iPhone. |
| T9 | App quyền danh bạ | Cao | Mitigate | Từ chối quyền danh bạ với ứng dụng không cần thiết; rà soát lại quyền đã cấp trong Cài đặt hệ thống. |
| T10 | Đồng bộ cloud không bảo mật | TB | Mitigate | Bật 2FA cho tài khoản Google / iCloud; đổi mật khẩu thành chuỗi mạnh dài ≥ 12 ký tự. |
| T11 | Rò rỉ cloud backup | TB | Mitigate | Kiểm tra và giới hạn nội dung được sao lưu; lưu ảnh nhạy cảm trong album ẩn có mã khóa riêng. |
| T12 | App chỉnh sửa ảnh độc hại | TB | Avoid | Chỉ dùng ứng dụng chỉnh sửa ảnh uy tín từ kho chính thức; cấp quyền ảnh ở mức "Chọn ảnh" thay vì "Toàn bộ thư viện". |
| T13 | Đánh cắp tin nhắn | TB | Mitigate | Chuyển sang dùng Authenticator App (Google Authenticator, Authy) cho tất cả dịch vụ hỗ trợ TOTP. |
| T14 | Phần mềm gián điệp | TB | Mitigate | Không cho mượn điện thoại không có giám sát; bật App Lock cho ứng dụng nhạy cảm; kiểm tra ứng dụng lạ định kỳ. | -->

```{=typst}
#figure(
  table(
  columns: (8%, 20%, 10%, 14%, 48%),
  align: (left, left, left, left, left),
  [Mã], [Rủi Ro], [Mức], [Chiến Lược], [Biện Pháp Đề Xuất],
  [T1], [Chiếm đoạt tài khoản], [Cao], [Mitigate], [
    - Bật 2FA trên tất cả tài khoản online.
    - Dùng password manager để tạo và lưu mật khẩu mạnh, riêng biệt.
  ],
  [T2], [Lộ thông tin qua privacy], [Cao], [Mitigate], [
    - Rà soát cài đặt quyền riêng tư định kỳ.
    - Chuyển hồ sơ về chế độ "Chỉ bạn bè" hoặc tương tự.
  ],
  [T3], [Ứng dụng giả mạo], [Cao], [Avoid], [
    - Chỉ tải ứng dụng từ App Store / Google Play chính thống.
    - Không cài APK từ nguồn ngoài/bẻ khóa.
  ],
  [T4], [Lừa đảo Phishing / Smishing], [Cao], [Mitigate], [
    - Không nhấp link trong SMS/email/Zalo/Telegram.
    - Luôn truy cập trực tiếp trang web/app chính thống.
    - Kiểm tra URL/địa chỉ người gửi trước khi tương tác.
  ],
  [T5], [SIM Swapping], [TB], [Mitigate], [
    - Đăng ký bảo vệ SIM với nhà mạng (nếu có thể).
    - Dùng Authenticator App thay SMS OTP.
    - Hạn chế đăng thông tin cá nhân lên MXH.
  ],
  [T6], [Trojan], [Cao], [Avoid], [
    - Không cài APK ngoài kho chính thống.
    - Bật Google Play Protect hoặc tính năng tương tự trên iOS.
    - Không tải file từ Zalo/Telegram/Mạng xã hội chưa xác thực nguồn gốc.
  ],
  [T7], [Credential Stuffing], [Cao], [Mitigate], [
    - Dùng mật khẩu riêng biệt cho mỗi dịch vụ (password manager).
    - Bật cảnh báo đăng nhập bất thường trên Gmail/Google Account và các dịch vụ khác.
  ],
  [T8], [Truy cập thiết bị bị mất], [Cao], [Mitigate], [
    - Bật màn hình khóa PIN/Face ID/Vân tay.
    - Cài thời gian tự khóa ≤ 1 phút.
    - Bật Find My Device / Find My iPhone.
  ],
  [T9], [App quyền danh bạ], [Cao], [Mitigate], [
    - Từ chối quyền danh bạ với ứng dụng không cần thiết.
    - Rà soát lại quyền đã cấp trong Cài đặt hệ thống.
  ],
  [T10], [Đồng bộ cloud không bảo mật], [TB], [Mitigate], [
    - Bật 2FA cho tài khoản Google / iCloud và các dịch vụ khác.
    - Đổi mật khẩu thành chuỗi mạnh dài ≥ 12 ký tự, có số, ký tự đặc biệt.
  ],
  [T11], [Rò rỉ cloud backup], [TB], [Mitigate], [
    - Kiểm tra và giới hạn nội dung được sao lưu (nếu không cần thiết).
    - Lưu ảnh quan trọng trong album ẩn hoặc thư mục có mã khóa riêng (nếu có thể).
  ],
  [T12], [App chỉnh sửa ảnh độc hại], [TB], [Avoid], [
    - Chỉ dùng ứng dụng chỉnh sửa ảnh uy tín từ kho chính thức.
    - Cấp quyền ảnh ở mức "Chọn ảnh" thay vì "Toàn bộ thư viện".
  ],
  [T13], [Đánh cắp tin nhắn], [TB], [Mitigate], [
    - Chuyển sang dùng Authenticator App (Google Authenticator, Microsoft Authenticator) cho tất cả dịch vụ hỗ trợ TOTP.
  ],
  [T14], [Phần mềm gián điệp], [TB], [Mitigate], [
    - Không cho mượn điện thoại không có giám sát, đặc biệt có chứa dữ liệu công việc.
    - Bật App Lock cho ứng dụng nhạy cảm.
    - Kiểm tra ứng dụng lạ định kỳ.
  ]
  ),
  caption: "Kế Hoạch Xử Lý Rủi Ro",
)
```
