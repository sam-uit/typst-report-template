#import "../template/lib.typ": *

= PHẦN 5 — LIÊN HỆ THỰC TẾ
<phan-5-lien-he-thuc-te>

Để minh họa cho cách Zero Trust được triển khai trong thực tế, sinh viên chọn phân
tích *Google BeyondCorp* — được coi là triển khai Zero Trust đầu tiên ở quy mô lớn
trên thế giới.

== Ví Dụ Thực Tế: Google BeyondCorp
<vi-du-thuc-te>

#figure(
  table(
    columns: (25%, 75%),
    align: (left, left),
    table.header(
      [*Nội Dung*], [*Mô Tả*],
    ),
    [Tên sản phẩm/dịch vụ],
    [*Google BeyondCorp Enterprise* — nền tảng Zero Trust do Google phát triển, ban đầu dùng nội bộ từ 2011, sau đó thương mại hóa cho khách hàng doanh nghiệp thông qua Google Cloud.],

    [Xu thế áp dụng],
    [*Zero Trust Security* — loại bỏ hoàn toàn mô hình bảo mật vành đai. Mọi truy cập vào tài nguyên nội bộ đều được xác thực dựa trên danh tính người dùng và trạng thái thiết bị, bất kể kết nối từ mạng nội bộ Google hay Wi-Fi công cộng.],

    [Lợi ích mang lại],
    [
      - Hơn 100.000 nhân viên Google làm việc từ mọi nơi mà không cần VPN, vẫn đảm bảo an toàn.\
      - Giảm nguy cơ lateral movement — kể cả khi một tài khoản bị xâm phạm, kẻ tấn công không thể truy cập tài nguyên khác.\
      - Cung cấp trải nghiệm người dùng mượt mà: nhân viên không cần kết nối VPN chậm, chỉ cần xác thực qua trình duyệt.\
      - Mô hình đã được chứng minh hiệu quả qua hơn 10 năm vận hành, trở thành chuẩn mực cho ngành công nghiệp.
    ],
  ),
  caption: [Bảng 3 — Ví Dụ Thực Tế: Google BeyondCorp]
)

== Bối Cảnh Ra Đời Của BeyondCorp
<boi-canh-beyondcorp>

Google bắt đầu phát triển BeyondCorp từ năm 2011 như một phản ứng trước các cuộc
tấn công APT (Advanced Persistent Threat) nhắm vào các công ty công nghệ lớn tại
Silicon Valley. Trước đó, Google cũng giống nhiều doanh nghiệp khác — phụ thuộc vào
mô hình bảo mật vành đai: ai ở trong mạng nội bộ thì được tin cậy. Tuy nhiên, với
sự gia tăng của thiết bị di động và điện toán đám mây, khái niệm "vành đai" ngày
càng mờ nhạt.

Giải pháp của Google là chuyển quyền kiểm soát truy cập từ vị trí mạng sang danh
tính cá nhân. Mỗi yêu cầu truy cập đều phải thỏa mãn ba điều kiện: xác thực danh
tính người dùng, kiểm tra trạng thái bảo mật thiết bị (đã cập nhật patch chưa? có
phần mềm diệt virus không?), và xác nhận quyền truy cập ứng dụng cụ thể.

BeyondCorp không phải là một dự án triển khai nhanh chóng — đó là một quá trình
chuyển đổi kéo dài nhiều năm, đòi hỏi đầu tư lớn về công nghệ, quy trình và đào
tạo nhân viên. Tuy nhiên, kết quả đã chứng minh giá trị: Google hiện là một trong
những tổ chức an toàn nhất thế giới, và BeyondCorp đã được thương mại hóa để các
doanh nghiệp khác có thể áp dụng mô hình tương tự.
