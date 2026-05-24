# PHẦN 2. XÁC ĐỊNH MỐI ĐE DỌA (THREAT IDENTIFICATION)

Với **mỗi tài sản**, liệt kê **ít nhất 2 mối đe dọa** có thể xảy ra.

Gợi ý (không bắt buộc):

- Mất cắp
- Truy cập trái phép
- Mã độc
- Lộ mật khẩu
- Lỗi người dùng

## Bước 3. Mối Đe Dọa Theo Từng Tài Sản

Với **mỗi tài sản** đã xác định ở Phần 1, dưới đây ta có thể liệt kê các **mối đe dọa** có thể xảy ra kèm **mô tả cụ thể** về **cơ chế** và **hậu quả**.

```{=typst}
#figure(
  table(
    columns: (25%, 25%, 50%),
    align: (left, left, left),
    table.header(
      [*Tài Sản*], [*Mối Đe Dọa*], [*Mô Tả*],
    ),

    table.cell(rowspan: 3)[
      *TS1* \
      Tài khoản mạng xã hội \
      (Facebook, Instagram, TikTok, Zalo)
    ],
    [1.1. Truy cập trái phép],
    [Kẻ tấn công đánh cắp thông tin đăng nhập qua phishing hoặc brute-force để chiếm quyền tài khoản, sau đó mạo danh nạn nhân để lừa đảo người thân hoặc phát tán nội dung độc hại.],

    [1.2. Lộ thông tin cá nhân qua cài đặt quyền riêng tư sai],
    [Người dùng để hồ sơ và bài đăng ở chế độ công khai, vô tình chia sẻ thông tin địa điểm, thói quen sinh hoạt, số điện thoại — tạo nguyên liệu cho tấn công social engineering.],

    [1.3. Cài đặt ứng dụng giả mạo],
    [Ứng dụng giả mạo Facebook/Zalo được phát tán ngoài các kho chính thức (Apple Store/Play Store). Sau khi cài, ứng dụng có thể thu thập thông tin đăng nhập hoặc đọc nội dung hội thoại trong nền.],

    table.cell(rowspan: 3)[
      *TS2* \
      Tài khoản ngân hàng / ví điện tử \
      (Internet Banking, MoMo, ViettelPay)
    ],
    [2.1. Tấn công Phishing / Smishing],
    [Nạn nhân nhận được tin nhắn SMS hoặc email giả mạo ngân hàng, dẫn đến trang web nhái và bị thu thập tên đăng nhập, mật khẩu và mã OTP. Sau đó, kẻ tấn công dùng thông tin này để chuyển tiền.],

    [2.2. Đánh cắp OTP qua SIM Swapping],
    [Kẻ tấn công liên hệ nhà mạng giả mạo chủ thuê bao để chuyển số điện thoại sang SIM mới. Từ đó nhận được tất cả OTP gửi về số đó và vượt qua xác thực 2 bước của ứng dụng ngân hàng.],

    [2.3. Mã độc Trojan trên điện thoại],
    [Phần mềm độc hại ngụy trang thành ứng dụng hữu ích (đèn pin, game). Sau khi cài, Trojan ghi lại các thao tác nhập liệu (keylogger) hoặc chụp màn hình khi người dùng mở ứng dụng ngân hàng.],

    table.cell(rowspan: 2)[
      *TS3* \
      Email cá nhân \
      (Gmail)
    ],
    [3.1. Tấn công Credential Stuffing],
    [Kẻ tấn công dùng danh sách tên đăng nhập/mật khẩu bị rò rỉ từ các dịch vụ khác để thử đăng nhập vào Gmail. Nếu người dùng tái sử dụng mật khẩu, tài khoản sẽ bị chiếm.],

    [3.2. Truy cập trái phép từ thiết bị bị mất / bị đánh cắp],
    [Nếu điện thoại không có mã khóa màn hình hoặc màn hình không tự khóa sau thời gian ngắn, người khác có điện thoại trong tay có thể truy cập trực tiếp vào Gmail đang đăng nhập.],

    table.cell(rowspan: 2)[
      *TS4* \
      Danh bạ liên lạc
    ],
    [4.1. Ứng dụng yêu cầu quyền truy cập danh bạ không hợp lý],
    [Nhiều ứng dụng (game, tiện ích) yêu cầu quyền đọc danh bạ để thu thập và bán dữ liệu liên lạc cho bên thứ ba, hoặc dùng cho mục đích spam và lừa đảo có chủ đích.],

    [4.2. Đồng bộ lên dịch vụ đám mây không bảo mật],
    [Danh bạ tự động đồng bộ lên tài khoản cloud (Google, iCloud). Nếu tài khoản online bị xâm phạm hoặc dịch vụ bị rò rỉ dữ liệu, toàn bộ danh bạ có thể bị lộ ra ngoài.],

    table.cell(rowspan: 2)[
      *TS5* \
      Ảnh và video cá nhân \
      (Thư viện ảnh)
    ],
    [5.1. Rò rỉ qua sao lưu đám mây không được bảo vệ đúng cách],
    [Tính năng sao lưu tự động (Google Photos, iCloud) tải ảnh lên với mức bảo mật phụ thuộc vào mật khẩu tài khoản. Nếu tài khoản bị chiếm, kẻ tấn công có thể tải xuống toàn bộ thư viện ảnh.],

    [5.2. Khai thác ứng dụng chỉnh sửa ảnh độc hại],
    [Ứng dụng chỉnh sửa ảnh miễn phí từ nguồn không chính thống yêu cầu quyền đọc/ghi thư viện ảnh. Thực tế ứng dụng âm thầm tải ảnh lên máy chủ của kẻ tấn công.],

    table.cell(rowspan: 2)[
      *TS6* \
      Lịch sử trò chuyện \
      (SMS, Messenger, Zalo)
    ],
    [6.1. Chặn bắt tin nhắn SMS (SMS Interception)],
    [Mã OTP và tin nhắn nhạy cảm gửi qua SMS có thể bị chặn nếu kẻ tấn công kiểm soát được mạng di động (IMSI catcher) hoặc đã thực hiện SIM Swapping thành công.],

    [6.2. Đọc lịch sử chat qua phần mềm gián điệp (Spyware)],
    [Spyware được cài lên điện thoại (thường qua quyền truy cập vật lý) có thể đọc và gửi lén lịch sử hội thoại trên Messenger, Zalo về máy chủ của kẻ theo dõi mà nạn nhân không hay biết.],
  ),
  caption: [Mối Đe Dọa Đối Với Các Tài Sản]
)
```

## Tổng Hợp Các Nhóm Mối Đe Dọa

Nhìn chung, các mối đe dọa có thể phân nhóm theo tính chất như sau:

- **Tấn công từ xa** (phishing, smishing, credential stuffing, SIM swapping): Không cần tiếp xúc vật lý với thiết bị, thường nhắm vào tài khoản tài chính và email do giá trị cao.
- **Phần mềm độc hại** (Trojan, fake app, spyware): Khai thác thói quen cài ứng dụng từ nguồn ngoài kho chính thức hoặc click vào đường link lạ.
- **Lỗi cấu hình / thói quen người dùng** (quyền riêng tư sai, không khóa màn hình, tái sử dụng mật khẩu): Tạo cơ hội cho cả tấn công từ xa lẫn tấn công vật lý.
- **Rò rỉ qua bên thứ ba** (ứng dụng lấy quyền danh bạ/ảnh, dịch vụ đám mây): Thường bị bỏ qua nhưng có tần suất xảy ra cao do người dùng ít chú ý đến quyền ứng dụng.
