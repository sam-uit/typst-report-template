# PHẦN 5 — LIÊN HỆ THỰC TẾ

**Bước 5**:

Sinh viên tự tìm **1 ví dụ thực tế** (trong hoặc ngoài nước):

- Sản phẩm
- Dịch vụ
- Mô hình triển khai

Bảng 3: Ví dụ thực tế

| Nội dung | Mô tả |
| --- | --- |
| Tên sản phẩm/dịch vụ | |
| Xu thế áp dụng | |
| Lợi ích mang lại | |
| Hạn chế/Rủi ro | |

## Ví Dụ Thực Tế -- Google BeyondCorp

Để minh họa cho cách Zero Trust được triển khai trong thực tế, sinh viên chọn phân tích *Google BeyondCorp* — được coi là triển khai Zero Trust đầu tiên ở quy mô lớn trên thế giới.

- [BeyondCorp tại Google Cloud Platform](https://cloud.google.com/beyondcorp)
- [BeyondCorp: A New Approach to Enterprise Security](https://research.google/pubs/beyondcorp-a-new-approach-to-enterprise-security/)

*BeyondCorp Principles*:

- Connecting from a particular network must not determine which services you can access.
- Access to services is granted based on what we know about you and your device.
- All access to services must be authenticated, authorized, and encrypted.

```{=typst}
#figure(
  table(
    columns: (25%, 75%),
    align: (left, left),
    table.header(
      [*Nội Dung*], [*Mô Tả*],
    ),
    [Tên sản phẩm/dịch vụ],
    [
      - *Google BeyondCorp Enterprise*.
      - Là một nền tảng Zero Trust do Google phát triển.
      - Ban đầu được triển khai nội bộ cho nhân viên Google từ năm 2011.
      - Sau đó được thương mại hóa cho khách hàng doanh nghiệp thông qua Google Cloud Platform (GCP).
    ],

    [Xu thế áp dụng],
    [
      - *Zero Trust Security* — loại bỏ hoàn toàn mô hình bảo mật theo vành đai truyền thống.
      - Mọi truy cập vào tài nguyên nội bộ đều được xác thực dựa trên danh tính người dùng (là ai, bộ phận nào, v.v...) và trạng thái thiết bị (có được đăng ký hay không, đang ở vị trí địa lý nào, v.v..).
      - Mọi thiết bị: Chromebook, Macbook, Windows, Android, iOS, Linux — tất cả.
      - Bất kể kết nối từ mạng nội bộ Google hay Wi-Fi công cộng hay các bên khác (vendor), có nghĩa không quan trọng điểm kết nối, đã tham gia mạng lưới sẽ đều áp dụng.
    ],

    [Lợi ích mang lại],
    [
      - Hơn 100.000 nhân viên Google làm việc từ mọi nơi mà không cần VPN, vẫn đảm bảo an toàn.
      - Giảm nguy cơ lateral movement — kể cả khi một tài khoản bị xâm phạm, kẻ tấn công không thể truy cập tài nguyên khác.
      - Cung cấp trải nghiệm người dùng mượt mà: nhân viên không cần kết nối VPN chậm, chỉ cần xác thực qua trình duyệt.
      - Mô hình đã được chứng minh hiệu quả qua hơn 10 năm vận hành, trở thành chuẩn mực cho ngành công nghiệp.
      - Giúp các hành hàng của GCP được tiếp cận giải pháp tiên tiến mà không cần đầu tư hạ tầng hay công cụ phức tạp, và tập trung vào phần quan trọng nhất: Con Người.
    ],
    [Hạn chế/Rủi ro],
    [
      - Triển khai BeyondCorp tốn chi phí, nhưng nếu không triển khai sẽ tốn kém hơn.
      - Không thể truy cập khi không có kết nối internet.
      - Thiết bị không được quản lý (MDM - Mobile Device Management) sẽ không thể truy cập vào tài nguyên nội bộ.
    ]
  ),
  caption: [Ví Dụ Thực Tế: Google BeyondCorp]
)
```

