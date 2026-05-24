# PHẦN 4 — ĐÁNH GIÁ RỦI RO (RISK ASSESSMENT)

Bước 5: Đánh giá **Khả năng xảy ra (Likelihood)** và **Mức độ ảnh hưởng (Impact)** theo thang điểm:

- Thấp (1)
- Trung bình (2)
- Cao (3)

Bước 6: Tính **Mức độ rủi ro** = Likelihood × Impact.

Bảng 4: Đánh giá rủi ro

| Tài sản | Mối đe dọa | Likelihood | Impact | Risk Level |
| --- | --- | --- | --- | --- |
| TS1 | T1 | 1 | 1 | 1 |

Bước 7: Phân loại rủi ro:

- 1–2: Thấp
- 3–4: Trung bình
- 6–9: Cao

## Bước 5 & 6 — Ma Trận Đánh Giá Rủi Ro

Mỗi mối đe dọa được đánh giá theo thang điểm:

- **Khả năng xảy ra (Likelihood)**: 1 / 2 / 3
  - 1: Rất khó xảy ra hoặc không có nhu cầu thực hiện.
  - 2: Có thể xảy ra hoặc có nhu cầu thực hiện ở mức độ nhất định.
  - 3: Dễ dàng xảy ra hoặc có chủ đích thực hiện.
- **Mức độ ảnh hưởng (Impact)**: 1 / 2 / 3
  - 1: Ảnh hưởng không đáng kể, có thể khắc phục dễ dàng.
  - 2: Ảnh hưởng ở mức độ nhất định, có thể khắc phục.
  - 3: Ảnh hưởng nghiêm trọng, khó khắc phục hoặc không thể khắc phục.
- **Mức độ rủi ro (Risk Level)** = Likelihood × Impact
  - Phản ánh tương quan tuyến tính giữa Likelihood và Impact.

```{=typst}
#figure(
  table(
    columns: (5%, 25%, 32%, 12.5%, 12.5%, 13%),
    align: (left, left, left, left, left, left),
    table.header(
      [Mã], [Tài Sản], [Mối Đe Dọa], [Likelihood], [Impact], [Risk Level]
    ),
    [T1], [TS1. Mạng xã hội], [Chiếm đoạt tài khoản], [#text(fill: orange)[2]], [#text(fill: orange)[3]], [#text(fill: red)[6]],
    [T2], [TS1. Mạng xã hội], [Lộ thông tin qua privacy sai], [#text(fill: red)[3]], [#text(fill: orange)[2]], [#text(fill: red)[6]],
    [T3], [TS1. Mạng xã hội], [Cài đặt Fake App], [#text(fill: orange)[2]], [#text(fill: orange)[3]], [#text(fill: red)[6]],
    [T4], [TS2. Ngân hàng/Ví], [Tấn công lừa đảo], [#text(fill: red)[3]], [#text(fill: red)[3]], [#text(fill: red)[9]],
    [T5], [TS2. Ngân hàng/Ví], [SIM Swapping], [#text(fill: yellow)[1]], [#text(fill: orange)[3]], [#text(fill: orange)[3]],
    [T6], [TS2. Ngân hàng/Ví], [Trojan trên điện thoại], [#text(fill: orange)[2]], [#text(fill: orange)[3]], [#text(fill: red)[6]],
    [T7], [TS3. Email], [Credential Stuffing], [#text(fill: orange)[2]], [#text(fill: orange)[3]], [#text(fill: red)[6]],
    [T8], [TS3. Email], [Truy cập thiết bị bị mất], [#text(fill: orange)[2]], [#text(fill: orange)[3]], [#text(fill: red)[6]],
    [T9], [TS4. Danh bạ], [App yêu cầu quyền danh bạ], [#text(fill: red)[3]], [#text(fill: orange)[2]], [#text(fill: red)[6]],
    [T10], [TS4. Danh bạ], [Đồng bộ cloud không bảo mật], [#text(fill: orange)[2]], [#text(fill: orange)[2]], [#text(fill: orange)[4]],
    [T11], [TS5. Ảnh/Video], [Rò rỉ qua cloud backup], [#text(fill: orange)[2]], [#text(fill: orange)[2]], [#text(fill: orange)[4]],
    [T12], [TS5. Ảnh/Video], [App chỉnh sửa ảnh độc hại], [#text(fill: orange)[2]], [#text(fill: orange)[2]], [#text(fill: orange)[4]],
    [T13], [TS6. Lịch sử chat], [Đánh cắp tin nhắn], [#text(fill: yellow)[1]], [#text(fill: orange)[3]], [#text(fill: orange)[3]],
    [T14], [TS6. Lịch sử chat], [Phần mềm gián điệp], [#text(fill: yellow)[1]], [#text(fill: orange)[3]], [#text(fill: orange)[3]]
  ),
  caption: "Đánh Giá Rủi Ro",
)
```

## Bước 7 — Phân Loại Rủi Ro

- Risk Level 1–2: **Thấp**
  - Khó hoặc không có nhu cầu thực hiện, hoặc ảnh hưởng không đáng kể.
- Risk Level 3–4: **Trung Bình**
  - Có thể thực hiện và ảnh hưởng ở mức độ nhất định.
- Risk Level 6–9: **Cao**
  - Có chủ đích thực hiện rõ ràng và ảnh hưởng nghiêm trọng.

Trong 14 rủi ro được đánh giá:

- 8 rủi ro **Cao** và 6 rủi ro **Trung Bình**.
- Không có rủi ro nào ở mức **Thấp** — phản ánh thực tế rằng điện thoại thông minh là mục tiêu tấn công
hấp dẫn do tập trung nhiều loại tài sản có giá trị.
- Rủi ro **T4** (Phishing/Smishing) đạt mức cao nhất (9/9), là một trong những hình thức tấn công phổ biến và nguy hiểm nhất hiện nay đặc biệt thiết bị di động được xem là phổ cập.

```{=typst}
#figure(
  table(
    columns: (8%, 40%, 12.5%, 12%, 12.5%, 18%),
    align: (left, left, left, left, left, left),
    table.header(
      [Mã], [Mối Đe Dọa], [Likelihood], [Impact], [Risk Level], [Phân Loại]
    ),
    [T1], [Chiếm đoạt tài khoản], [2], [3], [6], [#text(fill: red)[Cao]],
    [T2], [Lộ thông tin qua privacy sai], [3], [2], [6], [#text(fill: red)[Cao]],
    [T3], [Cài đặt Fake App], [2], [3], [6], [#text(fill: red)[Cao]],
    [T4], [Tấn công lừa đảo (Phishing/Smishing)], [3], [3], [9], [#text(fill: red)[Cao]],
    [T5], [SIM Swapping], [1], [3], [3], [#text(fill: orange)[Trung Bình]],
    [T6], [Trojan trên điện thoại], [2], [3], [6], [#text(fill: red)[Cao]],
    [T7], [Credential Stuffing], [2], [3], [6], [#text(fill: red)[Cao]],
    [T8], [Truy cập thiết bị bị mất], [2], [3], [6], [#text(fill: red)[Cao]],
    [T9], [App yêu cầu quyền danh bạ], [3], [2], [6], [#text(fill: red)[Cao]],
    [T10], [Đồng bộ cloud không bảo mật], [2], [2], [4], [#text(fill: orange)[Trung Bình]],
    [T11], [Rò rỉ qua cloud backup], [2], [2], [4], [#text(fill: orange)[Trung Bình]],
    [T12], [App chỉnh sửa ảnh độc hại], [2], [2], [4], [#text(fill: orange)[Trung Bình]],
    [T13], [Đánh cắp tin nhắn], [1], [3], [3], [#text(fill: orange)[Trung Bình]],
    [T14], [Phần mềm gián điệp], [1], [3], [3], [#text(fill: orange)[Trung Bình]]
  ),
  caption: "Phân Loại Rủi Ro",
)
```
