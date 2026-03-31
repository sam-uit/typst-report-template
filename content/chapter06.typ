#import "../template/lib.typ": *

= CÂU HỎI BÁO CÁO
<cau-hoi-bao-cao>

+ Phân biệt tấn công dò mật khẩu online (chủ động) và tấn công offline (thụ động).
+ Kể tên ít nhất 3 kỹ thuật tấn công mật khẩu online phổ biến (mô tả ngắn, không cần nêu cụ thể công cụ).
+ Phân tích hệ quả khi #strong[Account lockout threshold] đặt quá thấp (ví dụ 3) đối với người dùng hợp lệ và kẻ tấn công.
  - Như trình bày ở bước 5, khi threshold = 3, hệ thống nhạy với tấn công dò mật khẩu hơn, khi đó người dùng hợp lệ ít có cơ hội để được sai sót hơn, nhất là trong các môi trường yêu cầu mật khẩu phức tạp, khó nhớ, hoặc vô tình bật các công cụ gõ ngôn ngữ khác ngoài tiếng Anh.
+ Phân tích rủi ro khi #strong[Account lockout threshold] đặt quá cao (ví dụ 50).
  - Khi threshold quá cao, hệ thống sẽ ít nhạy với tấn công dò mật khẩu hơn, khi đó người dùng hợp lệ có nhiều cơ hội để được sai sót hơn, nhưng đồng nghĩa với việc kẻ tấn công có nhiều cơ hội để tấn công tài khoản bằng phương thức #emph[thử -- sai -- thử lại], làm tăng khả năng thành công của cuộc tấn công.
  - Đặc biệt là khi trước đó kẻ tấn công đã thu thập được một lượng lớn các mật khẩu có khả năng đúng, như là các mật khẩu hay dùng, hoặc các thông tin cá nhân qua #emph[Social Enginering], vv…, hoặc nếu kẻ tấn công là một #emph[Insider] (đồng nghiệp, bạn bè, vv…) thì khả năng thành công càng cao hơn nữa.
+ Mô tả quy trình xử lý của người quản trị khi quan sát thấy:
  - Nhiều log 4625 liên tục cho cùng một tài khoản.
  - Log 4740 xuất hiện thường xuyên cho một hoặc nhiều tài khoản.
+ Đề xuất tối thiểu 3 biện pháp để giảm rủi ro tấn công dò mật khẩu (gợi ý: mật khẩu mạnh, khóa tài khoản, MFA, hạn chế truy cập từ xa, v.v.).
