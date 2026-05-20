#import "../template/lib.typ": *

= TIẾT 5. TÌNH HUỐNG & BÁO CÁO
<tiet-5-tinh-huong-bao-cao>


== Bài 11. Tình Huống Bắt Buộc
<bai-11-tinh-huong-bat-buoc>

Tình huống:

- Sinh viên dùng Wi-Fi quán cà phê để:
  - Đăng nhập email
  - Thanh toán online

Yêu cầu trình bày:

+ Ít nhất 5 rủi ro
+ Ít nhất 7 biện pháp an toàn
+ 3 việc tuyệt đối không làm

=== 5 Rủi Ro Khi Dùng Wi-Fi Công Cộng
<5-rui-ro-khi-dung-wi-fi-cong-cong>

+ Nghe lén dữ liệu (Eavesdropping)
  - Kẻ tấn công có thể ở trong cùng mạng Wi-Fi và nghe lén toàn bộ dữ liệu, vì đây là kết nối công cộng, không có giới hạn về ai được phép truy cập. Đặc biệt khi kết nối không sử dụng mã hóa hoặc mã hóa yếu.
+ Tấn công giả mạo điểm truy cập (Rogue AP)
  - Kẻ tấn công có thể giả mạo điểm truy cập như một Wi-Fi của quán cà phê đang ngồi hoặc bên cạnh, để đánh lừa người dùng kết nối vào mạng của chúng. Nếu người dùng kết nối vào mạng giả mạo, kẻ tấn công có thể kiểm soát toàn bộ lưu lượng truy cập và đánh cắp dữ liệu.
+ Tấn công Man-in-the-Middle (MitM)
  - Kẻ tấn công có thể ở giữa người dùng và điểm truy cập, giả mạo cả hai phía để đánh lừa người dùng.
+ Đánh cắp thông tin đăng nhập (Credential Theft)
  - Kẻ tấn công có thể đánh cắp thông tin đăng nhập của người dùng, bao gồm tên người dùng, mật khẩu, thông tin thanh toán, thông tin cá nhân, v.v. khi trao đổi qua mạng công cộng, đặc biệt với mật khẩu Wi-Fi tức mã hóa yếu hoặc không có.
+ Lây nhiễm mã độc (Malware Infection)
  - Kẻ tấn công có thể lây nhiễm mã độc vào thiết bị của người dùng khi kết nối vào mạng Wi-Fi công cộng khi ở trong cùng một broadcast domain, nhằm mục đích đánh cắp dữ liệu hoặc kiểm soát thiết bị.

=== 7 Biện Pháp An Toàn Khi Dùng Wi-Fi Công Cộng
<7-bien-phap-an-toan-khi-dung-wi-fi-cong-cong>

+ Luôn dùng VPN, đặc biệt trong công việc.
  - VPN mã hóa toàn bộ lưu lượng truy cập của người dùng, ẩn danh tính và vị trí, giúp ngăn chặn kẻ tấn công đánh cắp dữ liệu hoặc theo dõi hoạt động trực tuyến.
+ Sử dụng HTTPS hoặc các giao thức tương đương như FTPS, SSH, vv…
  - HTTPS mã hóa dữ liệu trao đổi giữa người dùng và website, giúp tránh được rò rỉ dữ liệu dù kẻ tấn công có thể bắt các gói tin.
+ Vô hiệu hóa dịch vụ chia sẻ tệp
  - Tắt chia sẻ tệp (ví dụ SMB trên Windows) để ngăn chặn kẻ tấn công truy cập vào tệp của người dùng khi kết nối vào mạng Wi-Fi công cộng.
+ Tắt Wi-Fi khi không dùng
  - Tắt Wi-Fi khi không dùng hoặc dùng một cách có kiểm soát: thời lượng ít, ngẫu nhiên, ưu tiên Wi-Fi có mật khẩu mạnh.
+ Sử dụng xác thực 2 yếu tố (2FA)
  - Các dịch vụ quan trọng thường cung cấp chức năng này, hãy chắc chắn luôn luôn bật.
+ Luôn cập nhật hệ điều hành & ứng dụng
  - Tự động cập nhật là một cách để đảm bảo thiết bị có các phiên bản mới nhất vốn thường vá các lỗi bảo mật đã biết.
+ Không thực hiện giao dịch nhạy cảm
  - Không truy cập ngân hàng hoặc thanh toán online, không đăng nhập vào tài khoản quan trọng (email, mạng xã hội). Sử dụng có chọn lọc.

=== 3 Việc Tuyệt Đối Không Làm
<3-viec-tuyet-doi-khong-lam>

+ Không truy cập ngân hàng hoặc thanh toán online
  - Các giao dịch tài chính luôn nhạy cảm, đi kèm với thông tin cá nhân, thông tin thẻ tín dụng, vv.
  - Ưu tiên sử dụng mạng riêng hoặc có thể sử dụng Hotspot cá nhân cho các tác vụ tối quan trọng.
+ Không đăng nhập vào tài khoản quan trọng (email, mạng xã hội)
  - Các tài khoản này thường không chứa thông tin tài chính, nhưng chứa rất nhiều thông tin cá nhân và công việc. Nếu bị đánh cắp, kẻ tấn công có thể sử dụng thông tin này vào các mục đích xấu, hoặc khai thác để chiếm các thông tin về tài chính.
+ Không chia sẻ hoặc nhận chia sẻ file từ các máy trong mạng.
  - Chia sẻ ngang hàng thường nhanh chóng nhưng tiềm ẩn rủi ro vì các trao đổi gần như là trực tiếp giữa các thiết bị.
  - Không tải file hoặc truy cập các website lạ.
  - Hạn chế các loại website truy cập; và giới hạn lưu lượng và thời lượng có mặt trên mạng công cộng.
