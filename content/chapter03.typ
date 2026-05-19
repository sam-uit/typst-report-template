#import "../template/lib.typ": *

= PHẦN 3 — XÁC ĐỊNH LỖ HỔNG (VULNERABILITY IDENTIFICATION)
<phan-3-xac-dinh-lo-hong>


== Bước 4 — Phân Tích Lỗ Hổng Theo Mối Đe Dọa
<buoc-4-phan-tich-lo-hong>

Với mỗi mối đe dọa đã xác định ở Phần 2, dưới đây phân tích lỗ hổng hiện có
trong thói quen sử dụng điện thoại thông minh khiến mối đe dọa đó dễ xảy ra hơn.

#show table.cell: set text(size: 0.82em)
#figure(
  table(
    columns: (5%, 34%, 61%),
    align: (center, left, left),
    table.header(
      [*Mã*], [*Mối Đe Dọa*], [*Lỗ Hổng Liên Quan*],
    ),
    [T1],
    [Account Hijacking (TS1)],
    [Không bật xác thực 2 bước (2FA); mật khẩu ngắn, đơn giản hoặc tái sử dụng trên nhiều dịch vụ.],

    [T2],
    [Lộ thông tin qua privacy sai (TS1)],
    [Cài đặt mặc định của ứng dụng mạng xã hội thường là "công khai"; người dùng không kiểm tra lại sau khi ứng dụng cập nhật chính sách.],

    [T3],
    [Fake App (TS1)],
    [Thói quen tải APK từ nguồn ngoài kho chính thức (sideloading); thiếu kiểm tra danh tính nhà phát triển và đánh giá ứng dụng.],

    [T4],
    [Phishing / Smishing (TS2)],
    [Nhấp vào đường link trong SMS/email mà không kiểm tra URL; thiếu nhận thức về dấu hiệu nhận biết trang web giả mạo.],

    [T5],
    [SIM Swapping (TS2)],
    [Thông tin cá nhân (tên, ngày sinh, số CMND) bị lộ trên mạng xã hội; phụ thuộc hoàn toàn vào SMS OTP làm phương thức xác thực duy nhất.],

    [T6],
    [Trojan trên điện thoại (TS2)],
    [Cài ứng dụng từ kho bên thứ ba hoặc file APK chia sẻ qua Zalo/Telegram; không bật tính năng Play Protect (Android).],

    [T7],
    [Credential Stuffing (TS3)],
    [Tái sử dụng cùng một mật khẩu cho nhiều dịch vụ; không bật cảnh báo đăng nhập từ thiết bị hoặc địa điểm lạ.],

    [T8],
    [Truy cập thiết bị bị mất (TS3)],
    [Không đặt mã PIN / mật khẩu màn hình khóa; thời gian tự khóa màn hình quá dài (> 5 phút) hoặc bị tắt hoàn toàn.],

    [T9],
    [App quyền danh bạ (TS4)],
    [Cấp quyền tùy tiện khi ứng dụng yêu cầu mà không đọc mục đích sử dụng; không rà soát lại danh sách quyền đã cấp định kỳ.],

    [T10],
    [Đồng bộ cloud không bảo mật (TS4)],
    [Mật khẩu tài khoản Google / iCloud yếu hoặc tái sử dụng; không bật 2FA cho tài khoản cloud.],

    [T11],
    [Rò rỉ qua cloud backup (TS5)],
    [Sao lưu tự động được bật mặc định mà người dùng không kiểm tra nội dung được đồng bộ; ảnh nhạy cảm không được lưu riêng hoặc mã hóa cục bộ.],

    [T12],
    [App chỉnh sửa ảnh độc hại (TS5)],
    [Cấp quyền đọc/ghi toàn bộ thư viện ảnh cho ứng dụng không đáng tin cậy; tải ứng dụng chỉnh sửa ảnh miễn phí từ nguồn không chính thống.],

    [T13],
    [SMS Interception (TS6)],
    [Phụ thuộc hoàn toàn vào SMS để nhận OTP thay vì dùng ứng dụng xác thực (Authenticator App) độc lập với mạng di động.],

    [T14],
    [Spyware (TS6)],
    [Cho phép người khác mượn và sử dụng điện thoại không có giám sát; không bật App Lock cho các ứng dụng nhạy cảm.],
  ),
  caption: [Bảng 3 — Lỗ Hổng Liên Quan Đến Từng Mối Đe Dọa],
)

== Nhận Xét Tổng Hợp Về Lỗ Hổng
<nhan-xet-lo-hong>

Phân tích cho thấy hầu hết các lỗ hổng đều bắt nguồn từ *thói quen người dùng*
chứ không phải từ lỗi kỹ thuật của hệ thống. Ba nhóm lỗ hổng nổi bật nhất:

- *Xác thực yếu*: Không dùng 2FA, mật khẩu đơn giản, tái sử dụng mật khẩu -- xuất hiện trong 5/14 mối đe dọa.
- *Cài đặt ứng dụng thiếu cẩn thận*: Sideloading APK, không kiểm tra quyền -- xuất hiện trong 4/14 mối đe dọa.
- *Thiếu cấu hình bảo vệ thiết bị*: Không có màn hình khóa, thời gian tự khóa dài -- ảnh hưởng trực tiếp đến truy cập vật lý trái phép.

#co-info[Lỗ hổng phổ biến trong thói quen người dùng đồng nghĩa với xác suất bị khai thác cao hơn -- đây là nền tảng để đánh giá Khả năng xảy ra (Likelihood) trong Phần 4.]
