#import "../template/lib.typ": *

= PHẦN 5 — XỬ LÝ RỦI RO (RISK TREATMENT)
<phan-5-xu-ly-rui-ro>


== Bước 8 & 9 — Kế Hoạch Xử Lý Rủi Ro
<buoc-8-9-ke-hoach-xu-ly>

Với tất cả 14 rủi ro đều ở mức Trung Bình hoặc Cao, mỗi rủi ro được gán một chiến lược
và biện pháp xử lý cụ thể:

- *Avoid* (Tránh): Loại bỏ hoàn toàn hành vi dẫn đến rủi ro.
- *Mitigate* (Giảm): Giảm khả năng xảy ra hoặc mức độ ảnh hưởng.
- *Transfer* (Chuyển): Chuyển giao rủi ro cho bên thứ ba.
- *Accept* (Chấp nhận): Chấp nhận rủi ro khi chi phí xử lý không tương xứng.

#show table.cell: set text(size: 0.8em)
#figure(
  table(
    columns: (5%, 25%, 13%, 13%, 44%),
    align: (center, left, center, center, left),
    table.header(
      [*Mã*], [*Rủi Ro*], [*Mức*], [*Chiến Lược*], [*Biện Pháp Đề Xuất*],
    ),
    [T1], [Account Hijacking],
      [#text(fill: red)[Cao]], [Mitigate],
      [Bật 2FA trên tất cả tài khoản MXH; dùng password manager để tạo mật khẩu mạnh, riêng biệt cho từng dịch vụ.],

    [T2], [Lộ thông tin privacy],
      [#text(fill: red)[Cao]], [Mitigate],
      [Rà soát cài đặt quyền riêng tư định kỳ (mỗi 3 tháng); chuyển hồ sơ về chế độ "Chỉ bạn bè".],

    [T3], [Fake App],
      [#text(fill: red)[Cao]], [Avoid],
      [Chỉ tải ứng dụng từ App Store / Google Play chính thức; không cài APK từ nguồn ngoài kho.],

    [T4], [Phishing / Smishing],
      [#text(fill: red)[Cao]], [Mitigate],
      [Không nhấp link trong SMS/email; luôn truy cập trực tiếp website ngân hàng; kiểm tra kỹ URL trước khi nhập thông tin.],

    [T5], [SIM Swapping],
      [#text(fill: orange)[TB]], [Mitigate],
      [Đăng ký bảo vệ SIM với nhà mạng; dùng Authenticator App thay SMS OTP; hạn chế đăng thông tin cá nhân lên MXH.],

    [T6], [Trojan],
      [#text(fill: red)[Cao]], [Avoid],
      [Không cài APK ngoài kho; bật Google Play Protect; không tải file từ Zalo/Telegram chưa xác thực nguồn gốc.],

    [T7], [Credential Stuffing],
      [#text(fill: red)[Cao]], [Mitigate],
      [Dùng mật khẩu riêng biệt cho mỗi dịch vụ (password manager); bật cảnh báo đăng nhập bất thường.],

    [T8], [Truy cập thiết bị bị mất],
      [#text(fill: red)[Cao]], [Mitigate],
      [Bật màn hình khóa PIN / Face ID; cài thời gian tự khóa ≤ 1 phút; bật Find My Device / Find My iPhone.],

    [T9], [App quyền danh bạ],
      [#text(fill: red)[Cao]], [Mitigate],
      [Từ chối quyền danh bạ với ứng dụng không cần thiết; rà soát lại quyền đã cấp trong Cài đặt hệ thống định kỳ.],

    [T10], [Đồng bộ cloud không bảo mật],
      [#text(fill: orange)[TB]], [Mitigate],
      [Bật 2FA cho tài khoản Google / iCloud; đổi mật khẩu thành chuỗi mạnh dài ≥ 12 ký tự.],

    [T11], [Rò rỉ cloud backup],
      [#text(fill: orange)[TB]], [Mitigate],
      [Kiểm tra và giới hạn nội dung được sao lưu; lưu ảnh nhạy cảm trong album ẩn có mã khóa riêng.],

    [T12], [App chỉnh sửa ảnh độc hại],
      [#text(fill: orange)[TB]], [Avoid],
      [Chỉ dùng ứng dụng chỉnh sửa ảnh uy tín từ kho chính thức; cấp quyền ảnh ở mức "Chọn ảnh" thay vì "Toàn bộ thư viện".],

    [T13], [SMS Interception],
      [#text(fill: orange)[TB]], [Mitigate],
      [Chuyển sang dùng Authenticator App (Google Authenticator, Authy) cho tất cả dịch vụ hỗ trợ TOTP.],

    [T14], [Spyware],
      [#text(fill: orange)[TB]], [Mitigate],
      [Không cho mượn điện thoại không có giám sát; bật App Lock cho ứng dụng nhạy cảm; kiểm tra ứng dụng lạ định kỳ.],
  ),
  caption: [Bảng 5 — Kế Hoạch Xử Lý Rủi Ro],
)

= PHẦN 6 — NHẬN XÉT & TỰ ĐÁNH GIÁ
<phan-6-nhan-xet-tu-danh-gia>


== Bước 10 — Trả Lời Câu Hỏi Phản Chiếu
<buoc-10-tra-loi-cau-hoi>

=== Câu 1: Rủi Ro Nào Nghiêm Trọng Nhất? Vì Sao?
<cau-1-rui-ro-nghiem-trong-nhat>

Rủi ro nghiêm trọng nhất là *T4 -- Phishing / Smishing* nhắm vào tài khoản ngân hàng và ví
điện tử, với Risk Level = 9/9 (Likelihood 3, Impact 3) -- mức tối đa trong thang đánh giá.
Likelihood ở mức cao nhất vì lừa đảo qua SMS giả mạo ngân hàng đang xảy ra hằng ngày ở Việt
Nam, rất dễ gặp và không đòi hỏi kỹ năng kỹ thuật cao từ phía kẻ tấn công. Impact cũng ở
mức tối đa vì nạn nhân bị dẫn dụ tự cung cấp thông tin đăng nhập và OTP -- kẻ tấn công có
thể chuyển tiền ngay lập tức và gần như không thể thu hồi. Đây là kịch bản gây thiệt hại
tài chính trực tiếp, nhanh chóng và phổ biến nhất trong thực tế hiện nay.

=== Câu 2: Nếu Không Áp Dụng Biện Pháp, Hậu Quả Có Thể Là Gì?
<cau-2-hau-qua-neu-khong-xu-ly>

Nếu không áp dụng bất kỳ biện pháp xử lý rủi ro nào, hậu quả sẽ leo thang theo chuỗi. Trước
tiên, tài khoản ngân hàng bị xâm phạm dẫn đến mất tiền trực tiếp và không thể hoàn lại. Tiếp
theo, email bị chiếm mang theo quyền khôi phục mật khẩu của hầu hết dịch vụ khác -- kẻ tấn
công từ đó chiếm quyền kiểm soát toàn bộ danh tính số. Tài khoản mạng xã hội bị lợi dụng để
phát tán lừa đảo đến người thân, gây thiệt hại lan rộng ra cộng đồng. Dài hạn, thông tin cá
nhân bị rao bán trên dark web, làm nguyên liệu cho các cuộc tấn công tinh vi hơn trong tương
lai. Một lỗ hổng không được vá có thể kéo theo hàng loạt rủi ro mới mà nạn nhân không hay biết.

=== Câu 3: Vai Trò Của Người Dùng Trong Quản Lý Rủi Ro Là Gì?
<cau-3-vai-tro-nguoi-dung>

Người dùng vừa là *tuyến phòng thủ đầu tiên* vừa là *mắt xích yếu nhất* trong hệ thống an
ninh thông tin. Trong bài thực hành này, hầu hết các lỗ hổng đều bắt nguồn từ thói quen hằng
ngày: mật khẩu yếu, cấp quyền ứng dụng thiếu cẩn thận, không bật 2FA, hay nhấp vào link không
xác thực. Công nghệ bảo mật -- dù tinh vi đến đâu -- chỉ phát huy hiệu quả khi người dùng sử
dụng đúng cách và duy trì thói quen bảo mật nhất quán. Vì vậy, vai trò của người dùng không
chỉ là nạn nhân thụ động mà phải là người chủ động: thường xuyên cập nhật kiến thức về mối đe
dọa mới, rà soát cài đặt bảo mật định kỳ, và xem an ninh thông tin là trách nhiệm cá nhân chứ
không phải việc của riêng bộ phận IT hay nhà cung cấp dịch vụ.

#co-note(title: "Kết Luận")[Quản lý rủi ro an ninh thông tin không phải là việc làm một lần mà là một quy trình liên tục. Từ nhận diện tài sản, xác định mối đe dọa, phân tích lỗ hổng, đánh giá mức độ rủi ro đến đề xuất biện pháp -- mỗi bước đều đòi hỏi tư duy phân tích và cập nhật thường xuyên khi môi trường đe dọa thay đổi.]
