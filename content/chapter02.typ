#import "../template/lib.typ": *

= PHẦN 2 — CÁC ĐẶC ĐIỂM CHÍNH
<phan-2-dac-diem-chinh>

Zero Trust Security được xây dựng trên một số đặc điểm cốt lõi giúp phân biệt rõ
ràng với mô hình bảo mật vành đai truyền thống. Dưới đây là các đặc điểm quan trọng
nhất.

#figure(
  table(
    columns: (5%, 25%, 70%),
    align: (center, left, left),
    table.header(
      [*STT*], [*Đặc Điểm*], [*Giải Thích Ngắn*],
    ),
    [1],
    [Xác minh liên tục \ (Continuous Verification)],
    [Mỗi yêu cầu truy cập đều phải được xác thực và ủy quyền, bất kể người dùng đã đăng nhập trước đó hay đang ở trong mạng nội bộ. Hệ thống đánh giá ngữ cảnh truy cập theo thời gian thực — bao gồm danh tính, vị trí, trạng thái thiết bị và hành vi — để quyết định cấp hoặc thu hồi quyền.],

    [2],
    [Quyền truy cập tối thiểu \ (Least Privilege Access)],
    [Người dùng và thiết bị chỉ được cấp đúng mức quyền cần thiết để thực hiện nhiệm vụ, trong khoảng thời gian ngắn nhất có thể. Nguyên tắc này hạn chế tối đa phạm vi thiệt hại nếu tài khoản bị xâm phạm — kẻ tấn công không thể dùng một tài khoản bị chiếm để truy cập toàn bộ hệ thống.],

    [3],
    [Phân đoạn vi mô \ (Micro-segmentation)],
    [Mạng được chia thành nhiều vùng nhỏ (segment) độc lập. Mỗi vùng có chính sách bảo mật riêng, ngăn chặn kẻ tấn công di chuyển ngang (lateral movement) từ một hệ thống bị xâm nhập sang các hệ thống khác. Đây là điểm khác biệt lớn nhất so với mô hình truyền thống, nơi toàn bộ mạng nội bộ chia sẻ cùng một mức tin cậy.],

    [4],
    [Xác thực đa yếu tố \ (Multi-Factor Authentication)],
    [Danh tính người dùng được xác minh qua nhiều yếu tố (mật khẩu + mã OTP + sinh trắc học) thay vì chỉ dựa vào một mật khẩu duy nhất. MFA là nền tảng không thể thiếu trong mô hình Zero Trust vì nó giảm đáng kể rủi ro từ các cuộc tấn công đánh cắp thông tin đăng nhập (credential theft).],

    [5],
    [Giám sát và phân tích hành vi \ (Continuous Monitoring)],
    [Hệ thống liên tục thu thập và phân tích dữ liệu về hành vi người dùng, lưu lượng mạng và trạng thái thiết bị. Các bất thường (đăng nhập lúc 3 giờ sáng từ quốc gia lạ, tải lượng dữ liệu bất thường) sẽ tự động kích hoạt cảnh báo hoặc thu hồi quyền truy cập ngay lập tức.],

    [6],
    [Bảo mật dựa trên danh tính \ (Identity-Centric Security)],
    [Thay vì dựa vào vị trí mạng (IP, VLAN) để phân quyền, Zero Trust lấy danh tính người dùng và thiết bị làm trung tâm. Việc kết nối từ mạng nội bộ công ty không tự động mang lại quyền truy cập — mỗi danh tính đều phải chứng minh mình đáng tin cậy qua từng phiên làm việc.],
  ),
  caption: [Bảng 1 — Các Đặc Điểm Chính Của Zero Trust Security]
)

== Nhận Xét
<nhan-xet-dac-diem>

Sáu đặc điểm trên tạo thành một hệ thống phòng thủ nhiều lớp: từ xác minh danh
tính (MFA, xác minh liên tục), kiểm soát quyền (least privilege), phân vùng hạ tầng
(micro-segmentation), đến giám sát liên tục (monitoring). Điểm chung là tất cả đều
hướng tới mục tiêu: _giảm thiểu niềm tin ngầm_ (implicit trust) trong hệ thống,
buộc mọi thực thể phải liên tục chứng minh quyền hợp lệ của mình.
