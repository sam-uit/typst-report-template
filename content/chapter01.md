# PHẦN 1 — XÁC ĐỊNH TÀI SẢN (ASSET IDENTIFICATION)

## Bối Cảnh Được Chọn

Sinh viên chọn **Bối cảnh 3**: Điện thoại thông minh của sinh viên dùng cho:

- Mạng xã hội (Facebook, Instagram, TikTok, Zalo)
- Ngân hàng / ví điện tử (Internet Banking, MoMo, ViettelPay)
- Email (Gmail)

Điện thoại thông minh ngày nay không chỉ là thiết bị liên lạc mà còn là kho lưu trữ
tập trung nhiều loại dữ liệu nhạy cảm — từ thông tin tài chính, danh tính cá nhân
đến lịch sử giao tiếp. Vì vậy đây là bối cảnh phù hợp để thực hành nhận diện và
phân tích rủi ro an ninh thông tin.

## Bước 1 & 2 — Danh Sách Tài Sản Thông Tin

Dưới đây là 6 tài sản thông tin được xác định trong bối cảnh sử dụng điện thoại
thông minh, kèm mô tả ngắn gọn và đánh giá giá trị.

```{=typst}
#figure(
  table(
    columns: (4%, 28%, 48%, 20%),
    align: (center, left, left, center),
    table.header(
      [*STT*], [*Tài Sản*], [*Mô Tả*], [*Giá Trị*],
    ),
    [1],
    [Tài khoản mạng xã hội \ (Facebook, Instagram, TikTok, Zalo)],
    [Chứa thông tin cá nhân, danh sách bạn bè, lịch sử hội thoại, ảnh/video cá nhân. Bị xâm phạm có thể dẫn đến mạo danh, lừa đảo người thân hoặc tống tiền.],
    [#text(fill: red)[Cao]],

    [2],
    [Tài khoản ngân hàng / ví điện tử \ (Internet Banking, MoMo, ViettelPay)],
    [Liên kết trực tiếp đến tài sản tài chính. Bị mất quyền kiểm soát đồng nghĩa với nguy cơ mất tiền ngay lập tức và khó thu hồi.],
    [#text(fill: red)[Cao]],

    [3],
    [Email cá nhân \ (Gmail)],
    [Là "chìa khóa chủ" — dùng để khôi phục mật khẩu hầu hết các dịch vụ khác. Nếu bị chiếm, kẻ tấn công có thể kiểm soát toàn bộ danh tính số của người dùng.],
    [#text(fill: red)[Cao]],

    [4],
    [Danh bạ liên lạc],
    [Chứa số điện thoại, tên và mối quan hệ của người thân, bạn bè, đồng nghiệp. Dữ liệu này có giá trị với kẻ lừa đảo (social engineering) hoặc spammer.],
    [#text(fill: orange)[Trung Bình]],

    [5],
    [Ảnh và video cá nhân \ (Bộ nhớ trong / thư viện ảnh)],
    [Lưu trữ kỷ niệm cá nhân, ảnh nhạy cảm, tài liệu chụp bằng camera (CMND, thẻ ngân hàng, hợp đồng). Rò rỉ có thể gây tổn hại danh dự hoặc tạo điều kiện giả mạo giấy tờ.],
    [#text(fill: orange)[Trung Bình]],

    [6],
    [Lịch sử trò chuyện \ (SMS, Messenger, Zalo)],
    [Ghi lại các cuộc hội thoại riêng tư, có thể chứa thông tin nhạy cảm như mã OTP, địa chỉ, kế hoạch cá nhân. Bị rò rỉ ảnh hưởng đến quyền riêng tư và có thể bị dùng để ép buộc.],
    [#text(fill: orange)[Trung Bình]],
  ),
  caption: [Bảng 1 — Danh Sách Tài Sản Thông Tin (Bối Cảnh 3: Điện Thoại Thông Minh)]
)
```

## Nhận Xét Chung

Trong 6 tài sản trên, ba tài sản đầu (tài khoản mạng xã hội, tài khoản tài chính,
và email) được đánh giá ở mức **Cao** vì chúng gắn trực tiếp đến danh tính, tài
sản và khả năng phục hồi các tài khoản khác. Ba tài sản còn lại mang giá trị
**Trung Bình** — không gây thiệt hại tài chính trực tiếp nhưng vẫn ảnh hưởng
nghiêm trọng đến quyền riêng tư nếu bị xâm phạm. Không có tài sản nào được
xếp loại **Thấp** vì tất cả đều chứa thông tin cá nhân có thể bị lợi dụng.
