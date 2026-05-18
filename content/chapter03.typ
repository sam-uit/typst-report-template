#import "../template/lib.typ": *

= TIẾT 3. RỦI RO WI-FI CÔNG CỘNG & HTTPS
<tiet-3-rui-ro-wi-fi-cong-cong-https>


== Bài 6. Kiểm Tra HTTPS Trên Wi-Fi Công Cộng
<bai-6-kiem-tra-https-tren-wi-fi-cong-cong>

- Bước 1: Kết nối vào Wi-Fi công cộng (nếu có) (Nếu không có, dùng Wi-Fi bất kỳ)
- Bước 2:
  - Mở trình duyệt:
    - Truy cập 1 trang HTTPS
    - Truy cập 1 trang HTTP (hoặc demo)

Trang có HTTPS:

- #link("https://typst.app")
- Thông báo: HTTPS kết nối an toàn.

#figure(image("assets/06-https.png"),
  caption: [
    Bài 6. Kiểm Tra HTTPS
  ]
)

Trang không có HTTPS (chỉ có HTTP):

- #link("http://httpforever.com/")
- Thông báo: Not Secure (Không an toàn)

#figure(image("assets/06-http.png"),
  caption: [
    Bài 6. Kiểm Tra HTTP
  ]
)

=== Câu Hỏi Phân Tích
<cau-hoi-phan-tich>

#quote(block: true)[
Điều gì có thể xảy ra nếu đăng nhập tài khoản trên HTTP?
]

#figure(image("assets/06-http-warning.png"),
  caption: [
    Bài 6. Cảnh Báo Khi Truy Cập HTTP
  ]
)

Khi truy cập website với HTTP (không có $S$\(ecured)), người dùng có nguy cơ bị lộ dữ liệu với bất kỳ dữ liệu nào được chuyển đi/trao đổi trong quá trình sử dụng website đó.

Lý do:

- Kết nối với website được sử dụng giao thức HTTP nhưng không có thêm một lớp mã hóa $S$ (Secured Layer) như ở HTTPS, khi đó toàn bộ dữ liệu trao đổi, gửi/nhận từ người dùng, hay chính xác hơn là ứng dụng duyệt web và webserver là ở dạng văn bản thô, không mã hóa.
- Kẻ tấn công có thể dễ dàng bắt các gói tin và ghép nối các khối dữ liệu (payload), và từ đó đọc được toàn bộ nội dung trao đổi giữa người dùng và website, bao gồm: thông tin tài khoản, mật khẩu, thông tin cá nhân, thông tin giao dịch, v.v.

Khuyến nghị:

- Không truy cập hoặc sử dụng các website chỉ dùng HTTP.
- Nếu cần thiết phải truy cập website dùng HTTP, không trao đổi các dữ liệu quan trọng: tên người dùng, mật khẩu, các thông tin thanh toán, thông tin cá nhân, vv…
- Trong trường hợp website sử dụng HTTPS nhưng vẫn nhận cảnh báo "Not Secure", không truy cập hoặc sử dụng website đó. Hoặc kiểm tra lại các chứng chỉ SSL/TLS của website đó, tránh trường hợp giả mạo, DNS spoofing, man-in-the-middle, v.v.

== Bài 7. Quản Lý Wi-Fi Đã Lưu Trên Windows
<bai-7-quan-ly-wi-fi-da-luu-tren-windows>

- Bước 1: Settings → Wi-Fi → Manage known networks.
- Bước 2: Chọn 1 Wi-Fi công cộng → Forget.
- Bước 3: Chụp màn hình.

Do bài lab này đang được thực hiện trên macOS, vậy sinh viên xin phép sử dụng hình ảnh của macOS để biểu diễn, có giá trị và ý nghĩa tương tự.

- Vào #strong[Settings] \> #strong[Wi-Fi].
- Kiểm tra mục #strong[Known Networks].
- Bấm vào biểu tượng 3 chấm của Wi-Fi muonso loại bỏ, chọn #strong[Forget This Network…].

#figure(image("assets/07-01.png"),
  caption: [
    Bài 7. Quản Lý Wi-Fi Đã Lưu
  ]
)
