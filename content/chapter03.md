# PHẦN 3. XÁC ĐỊNH LỖ HỔNG (VULNERABILITY IDENTIFICATION)

Phân tích **lỗ hổng hiện có** khiến mối đe dọa dễ xảy ra.

Ví dụ:

- Không khóa màn hình
- Mật khẩu yếu
- Không cập nhật hệ điều hành
- Dùng Wi-Fi công cộng

## Bước 4. Phân Tích Lỗ Hổng Theo Mối Đe Dọa

Với mỗi mối đe dọa đã xác định ở Phần 2, dưới đây phân tích lỗ hổng hiện có trong thói quen sử dụng điện thoại thông minh khiến mối đe dọa đó dễ xảy ra hơn.

<!-- | Mã | Mối Đe Dọa | Lỗ Hổng Liên Quan |
| ---- | ----------- | ------------------- |
| T1 | Account Hijacking (TS1) | Không bật xác thực 2 bước (2FA); mật khẩu ngắn, đơn giản hoặc tái sử dụng trên nhiều dịch vụ |
| T2 | Lộ thông tin qua privacy sai (TS1) | Cài đặt mặc định của ứng dụng mạng xã hội thường là "công khai"; người dùng không kiểm tra lại sau khi cập nhật ứng dụng |
| T3 | Fake App (TS1) | Thói quen tải APK từ nguồn ngoài kho chính thức (sideloading); thiếu kiểm tra nhà phát triển và đánh giá ứng dụng |
| T4 | Phishing / Smishing (TS2) | Nhấp vào đường link trong SMS/email mà không kiểm tra URL; thiếu nhận thức về dấu hiệu trang web giả mạo |
| T5 | SIM Swapping (TS2) | Thông tin cá nhân (tên, ngày sinh, CMND) bị lộ trên mạng xã hội giúp kẻ tấn công thuyết phục nhà mạng; phụ thuộc hoàn toàn vào SMS OTP |
| T6 | Trojan trên điện thoại (TS2) | Cài ứng dụng từ kho bên thứ ba hoặc file APK chia sẻ qua Zalo/Telegram; không bật tính năng Play Protect |
| T7 | Credential Stuffing (TS3) | Tái sử dụng cùng một mật khẩu cho nhiều dịch vụ; không bật cảnh báo đăng nhập từ thiết bị lạ |
| T8 | Truy cập thiết bị bị mất (TS3) | Không đặt mã PIN/mật khẩu màn hình; thời gian tự khóa màn hình quá dài (>5 phút) hoặc tắt hoàn toàn |
| T9 | App quyền danh bạ (TS4) | Cấp quyền tùy tiện khi ứng dụng yêu cầu mà không đọc mục đích; không rà soát lại danh sách quyền đã cấp |
| T10 | Đồng bộ cloud không bảo mật (TS4) | Mật khẩu tài khoản Google/iCloud yếu; không bật 2FA cho tài khoản cloud |
| T11 | Rò rỉ qua cloud backup (TS5) | Sao lưu tự động bật mặc định mà người dùng không kiểm tra; ảnh nhạy cảm lưu chung với ảnh thông thường không phân loại |
| T12 | App chỉnh sửa ảnh độc hại (TS5) | Cấp quyền đọc/ghi thư viện ảnh cho ứng dụng không đáng tin cậy; tải ứng dụng chỉnh sửa ảnh miễn phí từ nguồn không chính thống |
| T13 | SMS Interception (TS6) | Phụ thuộc hoàn toàn vào SMS để nhận OTP thay vì dùng ứng dụng xác thực (Authenticator App) |
| T14 | Spyware (TS6) | Cho phép người khác mượn điện thoại không có giám sát; không bật App Lock cho ứng dụng nhạy cảm | -->

```{=typst}
#figure(
    table(
    columns: (5%, 25%, 70%),
    align: (left, left, left),
    [Mã], [Mối Đe Dọa], [Lỗ Hổng Liên Quan],
    [T1], [Chiếm đoạt tài khoản (TS1)], [
      - Không bật xác thực 2 bước (2FA).
      - Mật khẩu ngắn, đơn giản hoặc tái sử dụng trên nhiều dịch vụ.],
    [T2], [Rò rỉ thông tin qua cài đặt quyền riêng tư (TS1)], [
      - Cài đặt mặc định của ứng dụng mạng xã hội thường là "công khai".
      - Người dùng không kiểm tra lại sau khi cập nhật ứng dụng],
    [T3], [Ứng dụng giả mạo (TS1)], [
      - Thói quen tải APK từ nguồn ngoài kho chính thức (sideloading).
      - Thiếu kiểm tra nhà phát triển và đánh giá ứng dụng],
    [T4], [Tấn công lừa đảo (TS2)], [
      - Nhấp vào đường link trong SMS/email mà không kiểm tra URL.
      - Thiếu nhận thức về dấu hiệu trang web giả mạo],
    [T5], [SIM Swapping (TS2)], [
      - Thông tin cá nhân (tên, ngày sinh, CMND) bị lộ trên mạng xã hội.
      - Phụ thuộc hoàn toàn vào SMS OTP.],
    [T6], [Trojan trên điện thoại (TS2)], [
      - Cài ứng dụng từ kho bên thứ ba hoặc file APK chia sẻ qua Zalo/Telegram.
      - Không bật tính năng Play Protect],
    [T7], [Tấn công Credential Stuffing (TS3)], [
      - Tái sử dụng cùng một mật khẩu cho nhiều dịch vụ.
      - Không bật cảnh báo đăng nhập từ thiết bị lạ],
    [T8], [Truy cập thiết bị bị mất (TS3)], [
      - Không đặt mã PIN/mật khẩu màn hình.
      - Thời gian tự khóa màn hình quá dài (> 5 phút) hoặc tắt hoàn toàn],
    [T9], [Ứng dụng yêu cầu quyền truy cập danh bạ (TS4)], [
      - Cấp quyền tùy tiện khi ứng dụng yêu cầu mà không đọc mục đích.
      - Không rà soát lại danh sách quyền đã cấp.],
    [T10], [Đồng bộ đám mây không an toàn (TS4)], [
      - Mật khẩu tài khoản Google/iCloud yếu.
      - Không bật 2FA cho tài khoản cloud.],
    [T11], [Rò rỉ thông tin qua sao lưu đám mây (TS5)], [
      - Sao lưu tự động bật mặc định mà người dùng không kiểm tra.
      - Ảnh quan trọng như là thiết kế sản phẩm độc quyền, lưu chung với ảnh thông thường không phân loại.],
    [T12], [Ứng dụng chỉnh sửa ảnh độc hại (TS5)], [
      - Cấp quyền đọc/ghi thư viện ảnh cho ứng dụng không đáng tin cậy.
      - Tải ứng dụng chỉnh sửa ảnh miễn phí từ nguồn không chính thống.],
    [T13], [Đánh cắp tin nhắn (TS6)], [
      - Phụ thuộc hoàn toàn vào SMS để nhận OTP thay vì dùng ứng dụng xác thực (Authenticator App).],
    [T14], [Phần mềm gián điệp (TS6)], [
      - Cho phép người khác mượn điện thoại không có giám sát.
      - Không bật App Lock cho ứng dụng nhạy cảm.]
  ),
  caption: "Lỗ Hổng", 
)
```
