#import "../template/lib.typ": *

= PHẦN 3 — LỢI ÍCH VÀ THÁCH THỨC
<phan-3-loi-ich-va-thach-thuc>

Việc triển khai Zero Trust Security mang lại nhiều lợi ích đáng kể cho tổ chức,
nhưng cũng đi kèm với không ít thách thức. Phần này phân tích cả hai mặt để có
cái nhìn toàn diện.

#figure(
  table(
    columns: (12%, 5%, 28%, 55%),
    align: (center, center, left, left),
    table.header(
      [*Nhóm*], [*STT*], [*Nội Dung*], [*Giải Thích*],
    ),

    table.cell(rowspan: 4, align: center + horizon)[#text(fill: green.darken(20%))[*Lợi\ ích*]],
    [1],
    [Giảm thiểu phạm vi tấn công],
    [Nhờ nguyên tắc quyền tối thiểu và phân đoạn vi mô, ngay cả khi kẻ tấn công xâm nhập được một phần hệ thống, chúng không thể di chuyển ngang sang các tài nguyên khác. Theo thống kê, tổ chức triển khai Zero Trust giảm đến 50% số vụ vi phạm dữ liệu.],

    [2],
    [Tăng cường khả năng phát hiện sớm],
    [Giám sát liên tục và phân tích hành vi cho phép phát hiện các bất thường (anomaly) trong thời gian thực. Hệ thống có thể tự động thu hồi quyền truy cập ngay khi nhận thấy dấu hiệu đáng ngờ, thay vì chờ đến khi thiệt hại đã xảy ra.],

    [3],
    [Hỗ trợ làm việc từ xa an toàn],
    [Zero Trust không phụ thuộc vào vị trí mạng, nên nhân viên có thể truy cập tài nguyên công ty từ bất kỳ đâu mà vẫn đảm bảo an toàn — không cần VPN truyền thống. Điều này đặc biệt phù hợp với xu thế hybrid/remote work hậu COVID-19.],

    [4],
    [Đáp ứng yêu cầu tuân thủ],
    [Mô hình Zero Trust cung cấp kiểm toán chi tiết (audit trail) cho mọi truy cập, giúp tổ chức dễ dàng chứng minh tuân thủ các quy định như GDPR, HIPAA hay Luật An ninh mạng Việt Nam. Khả năng kiểm soát truy cập theo ngữ cảnh cũng đáp ứng các tiêu chuẩn bảo mật quốc tế.],

    table.cell(rowspan: 4, align: center + horizon)[#text(fill: red.darken(10%))[*Thách\ thức*]],
    [1],
    [Chi phí triển khai cao],
    [Chuyển đổi từ mô hình truyền thống sang Zero Trust đòi hỏi đầu tư lớn về hạ tầng, phần mềm và nhân lực. 48% doanh nghiệp trong một khảo sát năm 2025 cho biết chi phí và nguồn lực là rào cản lớn nhất. Đặc biệt, việc tích hợp với hệ thống legacy (cũ) có thể rất phức tạp và tốn kém.],

    [2],
    [Thay đổi văn hóa tổ chức],
    [Zero Trust yêu cầu chuyển từ tư duy "tin tưởng rồi xác minh" sang "không tin tưởng, luôn xác minh". Sự thay đổi này gặp phải sức ép từ nhân viên quen với cách làm việc cũ, cảm thấy bất tiện khi phải xác thực nhiều lần. Cần có chương trình đào tạo và truyền thông bài bản để thay đổi nhận thức.],

    [3],
    [Độ phức tạp kỹ thuật],
    [Triển khai phân đoạn vi mô, giám sát liên tục và chính sách truy cập động trên quy mô lớn là thách thức kỹ thuật đáng kể. Trong môi trường đa đám mây (multi-cloud) với container, serverless và microservices, việc áp dụng Zero Trust cho từng thành phần đòi hỏi chuyên môn sâu và công cụ phù hợp.],

    [4],
    [Ảnh hưởng đến trải nghiệm người dùng],
    [Xác thực liên tục và kiểm soát truy cập nghiêm ngặt có thể gây ra ma sát (friction) trong trải nghiệm làm việc hàng ngày. Nếu không được thiết kế cẩn thận, hệ thống có thể làm giảm năng suất lao động khi người dùng phải xác thực quá nhiều lần hoặc bị từ chối quyền truy cập do chính sách quá khắt khe.],
  ),
  caption: [Bảng 2 — Lợi Ích và Thách Thức Của Zero Trust Security]
)

== Tổng Kết
<tong-ket-loi-ich-thach-thuc>

Nhìn chung, lợi ích của Zero Trust vượt trội so với thách thức — nhưng thách thức
không nên bị xem nhẹ. Các tổ chức thành công thường áp dụng chiến lược triển khai
từng giai đoạn (phased approach), bắt đầu từ những tài sản quan trọng nhất và mở
rộng dần, thay vì cố gắng chuyển đổi toàn bộ cùng lúc.
