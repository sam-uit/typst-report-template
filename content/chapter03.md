# PHẦN 3 --- LỢI ÍCH & THÁCH THỨC

**Bước 3**:

Phân tích:

- Ít nhất 3 lợi ích
- Ít nhất 3 thách thức / hạn chế

Bảng 2: Lợi ích và thách thức

| Nhóm | Nội dung | Giải thích |
| -- | -- | -- |
| Lợi ích | | |
| Thách thức | | |

## Bước 3. Lợi Ích & Thách Thức

Việc triển khai Zero Trust Security mang lại nhiều lợi ích đáng kể cho tổ chức, nhưng cũng đi kèm với không ít thách thức, đặc biệt các tổ chức/doanh nghiệp có hạ tầng truyền thống.

Đồng thời, mô hình mới này yêu cầu tất cả mọi cá nhân trong tổ chức đều trở thành người tham gia và có trách nhiệm bảo mật (stakeholders) trong hệ thống, điều mà trước đây những người dùng bình thường sẽ gần như không nhận thấy vai trò của mình, và mọi việc về bảo mật là việc của bộ phận IT/Security.

Phần này phân tích cả hai mặt để có cái nhìn đầy đủ hơn.

```{=typst}
#figure(
  table(
    columns: (12%, 5%, 20%, 63%),
    align: (center, center, left, left),
    table.header(
      [*Nhóm*], [*STT*], [*Nội Dung*], [*Giải Thích*],
    ),

    table.cell(rowspan: 4, align: center + horizon)[#text(fill: green.darken(20%))[*Lợi\ ích*]],
    [1],
    [Giảm thiểu phạm vi tấn công],
    [
      - Nhờ nguyên tắc quyền tối thiểu (least privilege) và phân đoạn vi mô (microsegmentation), có nghĩa kiểm soát attack surface (bề mặt tấn công) và attack vector (lỗ hổng tấn công).
      - Ngay cả khi kẻ tấn công xâm nhập được một phần hệ thống, chúng không thể di chuyển ngang sang các tài nguyên khác.
      - Điều đó giúp cô lập và hạn chế thiệt hại.
    ],

    [2],
    [Tăng cường khả năng phát hiện sớm],
    [
      - Giám sát liên tục và phân tích hành vi cho phép phát hiện các bất thường (anomaly) trong thời gian thực.
      - Hệ thống có thể tự động thu hồi quyền truy cập ngay khi nhận thấy dấu hiệu đáng ngờ, thay vì chờ đến khi thiệt hại đã xảy ra.
    ],

    [3],
    [Hỗ trợ làm việc từ xa an toàn],
    [
      - Zero Trust không phụ thuộc vào vị trí điểm kết nối mạng, nên nhân viên có thể truy cập tài nguyên công ty từ bất kỳ đâu mà vẫn đảm bảo an toàn.
      - Không cần VPN cứng nhắc như mô hình truyền thống.
      - Điều này đặc biệt phù hợp với xu thế làm việc kết hợp (hybrid/remote work) hậu COVID-19.
    ],

    [4],
    [Đáp ứng yêu cầu tuân thủ],
    [
      - Mô hình Zero Trust cung cấp kiểm toán chi tiết (audit trail) cho mọi truy cập,
      - Giúp tổ chức dễ dàng chứng minh tuân thủ các quy định như GDPR, HIPAA hay Luật An ninh mạng Việt Nam.
      - Khả năng kiểm soát truy cập theo ngữ cảnh cũng đáp ứng các tiêu chuẩn bảo mật quốc tế.
    ],

    table.cell(rowspan: 4, align: center + horizon)[#text(fill: red.darken(10%))[*Thách\ thức*]],
    [1],
    [Chi phí triển khai cao],
    [
      - Chuyển đổi từ mô hình truyền thống sang Zero Trust đòi hỏi đầu tư lớn về nhân lực, hạ tầng, phần mềm.
      - Đặc biệt, việc tích hợp với hệ thống cũ (legacy) có thể rất phức tạp và tốn kém.
    ],

    [2],
    [Thay đổi văn hóa tổ chức],
    [
      - Zero Trust yêu cầu chuyển từ tư duy "tin tưởng rồi xác minh" sang "không tin tưởng, luôn xác minh".
      - Sự thay đổi này gặp phải sức ép từ nhân viên quen với cách làm việc cũ, cảm thấy bất tiện khi phải xác thực nhiều lần (tiện lợi >< an toàn).
      - Cần có chương trình đào tạo và truyền thông bài bản để thay đổi nhận thức.
    ],

    [3],
    [Độ phức tạp kỹ thuật],
    [
      - Triển khai phân đoạn vi mô (micro-segmentation), giám sát liên tục (continuous monitoring), chính sách truy cập động (dynamic access policy) và xác thực đa yếu tố (multi-factor authentication) trên quy mô lớn là thách thức kỹ thuật đáng kể.
      - Trong môi trường đa đám mây (multi-cloud) với container, serverless và microservices, việc áp dụng Zero Trust cho từng thành phần đòi hỏi chuyên môn sâu và công cụ phù hợp.
    ],

    [4],
    [Ảnh hưởng đến trải nghiệm người dùng],
    [
      - Xác thực liên tục và kiểm soát truy cập nghiêm ngặt có thể gây ra ma sát (friction) trong trải nghiệm làm việc hàng ngày, người dùng cảm thấy bị phiền toái.
      - Nếu không được thiết kế cẩn thận, hệ thống có thể làm giảm năng suất lao động khi người dùng phải xác thực quá nhiều lần hoặc bị từ chối quyền truy cập do chính sách quá khắt khe.
      - Tìm ra điểm cân bằng (equilibrium) giữa bảo mật và trải nghiệm người dùng là thách thức đáng kể.
    ],
  ),
  caption: [Lợi Ích và Thách Thức Của Zero Trust Security]
)
```

## Đánh Giá Chung

Lợi ích của Zero Trust vượt trội -- nhưng thách thức không nên bị xem nhẹ. Các tổ chức thành công thường áp dụng chiến lược triển khai từng giai đoạn (phased approach), bắt đầu từ những tài sản quan trọng nhất và mở rộng dần, thay vì cố gắng chuyển đổi toàn bộ cùng lúc.

Và, quan trọng nhất là vẫn là văn hóa tổ chức: từ quản lý đến sử dụng, và mọi cá nhân đều phải tham gia vào quá trình bảo mật, bắt buộc mọi người đều chia sẻ chung tầm nhìn (về bảo mật và chuyển đổi), chỉ khác nhau về trách nhiệm.
