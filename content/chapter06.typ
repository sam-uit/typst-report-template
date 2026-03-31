#import "../template/lib.typ": *

= CÂU HỎI BÁO CÁO
<cau-hoi-bao-cao>

+ Phân biệt tấn công dò mật khẩu online (chủ động) và tấn công offline (thụ động).
  - Tấn công dò mật khẩu online (chủ động): kẻ tấn công trực tiếp tương tác với hệ thống (ví dụ: gửi yêu cầu đăng nhập), hệ thống có thể phát hiện và phản ứng (ví dụ: khóa tài khoản).
  - Tấn công dò mật khẩu offline (thụ động): kẻ tấn công không tương tác trực tiếp với hệ thống, mà sử dụng bản sao (copy) của dữ liệu chứa mật khẩu (ví dụ: file hash, file SAM, vv..) để tấn công ngoại tuyến. Đây thường là cách khôi phục mật khẩu trong các công cụ khôi phục hệ thống chuyên dụng.
+ Kể tên ít nhất 3 kỹ thuật tấn công mật khẩu online phổ biến (mô tả ngắn, không cần nêu cụ thể công cụ).
  - \(TBD)
+ Phân tích hệ quả khi #strong[Account lockout threshold] đặt quá thấp (ví dụ 3) đối với người dùng hợp lệ và kẻ tấn công.
  - Như trình bày ở bước 5, khi threshold = 3, hệ thống nhạy với tấn công dò mật khẩu hơn, khi đó người dùng hợp lệ ít có cơ hội để được sai sót hơn, nhất là trong các môi trường yêu cầu mật khẩu phức tạp, khó nhớ, hoặc vô tình bật các công cụ gõ ngôn ngữ khác ngoài tiếng Anh.
+ Phân tích rủi ro khi #strong[Account lockout threshold] đặt quá cao (ví dụ 50).
  - Khi threshold quá cao, hệ thống sẽ ít nhạy với tấn công dò mật khẩu hơn, khi đó người dùng hợp lệ có nhiều cơ hội để được sai sót hơn, nhưng đồng nghĩa với việc kẻ tấn công có nhiều cơ hội để tấn công tài khoản bằng phương thức #emph[thử -- sai -- thử lại], làm tăng khả năng thành công của cuộc tấn công.
  - Đặc biệt là khi trước đó kẻ tấn công đã thu thập được một lượng lớn các mật khẩu có khả năng đúng, như là các mật khẩu hay dùng, hoặc các thông tin cá nhân qua #emph[Social Enginering], vv…, hoặc nếu kẻ tấn công là một #emph[Insider] (đồng nghiệp, bạn bè, vv…) thì khả năng thành công càng cao hơn nữa.
+ Mô tả quy trình xử lý của người quản trị khi quan sát thấy:
  - Nhiều log 4625 liên tục cho cùng một tài khoản.
    - Xác định tài khoản (#emph[TargetUserName]): là người dùng bình thường, là quản trị, là chuyên viên cấp cao, phòng ban đặc thù (#emph[R&D]) hay là tài khoản dịch vụ, vv… nhằm xác định mức độ nghiêm trọng (severity), thường được đánh dấu từ S0 - S4.
    - Kiểm tra ngay thời điểm xẩy ra (#emph[SystemTime]): giờ hành chính, ngoài giờ hành chính, ngày nghỉ, cuối tuần, vv… để xác định có phải là tấn công hay không.
    - Kiểm tra ngay thiết bị (#emph[WorkstationName]) được sử dụng: máy tính được công ty cấp phát, máy tính từ bên ngoài (không nằm trong domain), vv…
    - Bao nhiêu lần, khoảng cách giữ mỗi lần: ví dụ người dùng hợp lệ thường sẽ gõ liên tục vì hoặc vội, hoặc tự tin; kẻ tấn công có thể thận trọng hơn, và dành nhiều thời gian hơn sau mỗi lần thử.
    - Nơi hoặc địa điểm xảy ra: Ví dụ #emph[IpAddress], nếu lúc đó ở tại hệ thống LAN của công ty, thì sẽ có IP khác; nếu là từ bên ngoài, ví dụ qua VPN, thì thường có IP khác.
  - Log 4740 xuất hiện thường xuyên cho một hoặc nhiều tài khoản.
    - Xác định số lượng: mỗi event tương ứng với một user, có nghĩa càng nhiều event thì càng nhiều user đang bị khóa. Điểm này xác định mức độ nghiêm trọng của tình huống (severity).
    - Kiểm tra ngay thời điểm xẩy ra (#emph[SystemTime]): giờ hành chính, ngoài giờ hành chính, ngày nghỉ, cuối tuần, vv… để xác định có phải là tấn công hay hay không.
    - Kiểm tra khoảng cách giữa các lần khóa: nếu các lần khóa xảy ra liên tục, có nghĩa là kẻ tấn công đang cố gắng tấn công nhiều tài khoản; nếu các lần khóa xảy ra rải rác, có nghĩa là người dùng hợp lệ đang cố gắng đăng nhập vào tài khoản, và vô tình trùng hợp với một khoảng thời gian nào đó.
    - Và các yếu tố khác tương tự event 4625, nhưng nếu có đồng thời nhiều tài khoản bị khóa, thì thường không phải là sự ngẫu nhiên, trừ khi đó là lỗi hệ thống.
    - Đồng thời, luôn kiểm tra các ticket mới trong hệ thống, thường người dùng sẽ tạo ticket theo hình thức này hoặc hình thức khác khi gặp lỗi. Nếu có sự tăng đột biến, đó chắc chắn là có vấn đề. Nếu rải rác, thì hoặc có vấn đề nhưng người dùng chưa nhận ra, hoặc là trùng hợp ngẫu nhiên.
+ Đề xuất tối thiểu 3 biện pháp để giảm rủi ro tấn công dò mật khẩu (gợi ý: mật khẩu mạnh, khóa tài khoản, MFA, hạn chế truy cập từ xa, v.v.).
