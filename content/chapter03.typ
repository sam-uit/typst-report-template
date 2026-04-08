#import "../template/lib.typ": *

= Câu 3. Mô Hình Chứng Thực Dữ Liệu
<cau-3-mo-hinh-chung-thuc-du-lieu>

- Dựa trên 6 công dụng của hàm băm trong bài học:
  - Xây dựng 1 mô hình có:
    - bảo mật
    - chứng thực
    - chữ ký số.
  - Phân tích hoạt động.
  - Nêu ưu nhược điểm của mô hình này.

== Sơ Đồ Trực Quan
<so-do-truc-quan>

#figure(image("assets/IE105-BT5-b3.png"),
  caption: [
    Câu 3. Mô Hình Ký Trước & Mã Hóa Sau
  ]
)

== Miêu Tả Hoạt Động
<mieu-ta-hoat-dong>

- Ký $S$: Người gửi $A$ sử dụng Khóa Riêng Tư ($P R_a$) để tạo Chữ Ký Số cho thông điệp.
  - Điều này đảm bảo mỗi thông điệp có một chữ ký số riêng biệt.
  - Đồng thời đảm bảo chỉ có người gửi gốc mới có Khóa Riêng Tư đúng.
- Mã Hóa $E$: Thông Điệp + Chữ Ký Số được mã hóa với Khóa Công Khai của người nhận $B$ ($P U_b$).
  - Khi mã hóa với $P U_b$, chỉ người nhận đúng có $P R_b$ mới có thể giải mã được.
- Giải Mã $D$:
  - Người nhận $B$ sử dụng Khóa Riêng Tư ($P R_b$) để giải mã và nhận lại thông điệp + Chữ Ký Số.
- Xác Thực $V$:
  - Người nhận $B$ sử dụng Khóa Công Khai của người gửi $A$ ($P U_a$) để xác thực/verify Chữ Ký Số để đảm bảo thông điệp là toàn vẹn và đúng người gửi.

== Ưu và Nhược:
<uu-va-nhuoc>

- Ưu:
  - Đảm bảo các tiêu chí đề bài đưa ra: chữ ký số ($S$); chứng thực ($V$); bảo mật ($E$).
- Nhược:
  - Chậm vì sử dụng cặp mã khóa bất đồng bộ, không phù hợp với các ứng dụng real-time.

== Ứng Dụng
<ung-dung>

- Phù hợp các ứng dụng trao đổi thông tin yêu cầu về bảo mật và chứng thực, nhưng không cần thời gian thực, ví dụ gửi/nhận email/file, có độ trễ chấp nhận được, đặc biệt đề cao tính pháp lý của thông điệp và quan hệ gửi/nhận.
