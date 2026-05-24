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

- **Khả năng xảy ra (Likelihood)**: Thấp (1) / Trung Bình (2) / Cao (3)
- **Mức độ ảnh hưởng (Impact)**: Thấp (1) / Trung Bình (2) / Cao (3)
- **Mức độ rủi ro (Risk Level)** = Likelihood × Impact

```{=typst}
#figure(
  table(
    columns: (5%, 25%, 32%, 12.5%, 12.5%, 13%),
    align: (left, left, left, left, left, left),
    [Mã], [Tài Sản], [Mối Đe Dọa], [Likelihood], [Impact], [Risk Level],
    [T1], [TS1. Mạng xã hội], [Chiếm đoạt tài khoản], [2], [3], [6],
    [T2], [TS1. Mạng xã hội], [Lộ thông tin qua privacy sai], [3], [2], [6],
    [T3], [TS1. Mạng xã hội], [Cài đặt Fake App], [2], [3], [6],
    [T4], [TS2. Ngân hàng/Ví], [Tấn công lừa đảo], [3], [3], [9],
    [T5], [TS2. Ngân hàng/Ví], [SIM Swapping], [1], [3], [3],
    [T6], [TS2. Ngân hàng/Ví], [Trojan trên điện thoại], [2], [3], [6],
    [T7], [TS3. Email], [Credential Stuffing], [2], [3], [6],
    [T8], [TS3. Email], [Truy cập thiết bị bị mất], [2], [3], [6],
    [T9], [TS4. Danh bạ], [App yêu cầu quyền danh bạ], [3], [2], [6],
    [T10], [TS4. Danh bạ], [Đồng bộ cloud không bảo mật], [2], [2], [4],
    [T11], [TS5. Ảnh/Video], [Rò rỉ qua cloud backup], [2], [2], [4],
    [T12], [TS5. Ảnh/Video], [App chỉnh sửa ảnh độc hại], [2], [2], [4],
    [T13], [TS6. Lịch sử chat], [Đánh cắp tin nhắn], [1], [3], [3],
    [T14], [TS6. Lịch sử chat], [Phần mềm gián điệp], [1], [3], [3]
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

```{=typst}
#figure(
  table(
    columns: (10%, 35%, 12.5%, 12.5%, 13%, 20%),
    align: (left, left, left, left, left, left),
    [Mã], [Mối Đe Dọa], [Likelihood], [Impact], [Risk Level], [Phân Loại],
    [T1], [Chiếm đoạt tài khoản], [2], [3], [6], [Cao],
    [T2], [Lộ thông tin qua privacy sai], [3], [2], [6], [Cao],
    [T3], [Cài đặt Fake App], [2], [3], [6], [Cao],
    [T4], [Tấn công lừa đảo], [3], [3], [9], [Cao],
    [T5], [SIM Swapping], [1], [3], [3], [Trung Bình],
    [T6], [Trojan trên điện thoại], [2], [3], [6], [Cao],
    [T7], [Credential Stuffing], [2], [3], [6], [Cao],
    [T8], [Truy cập thiết bị bị mất], [2], [3], [6], [Cao],
    [T9], [App yêu cầu quyền danh bạ], [3], [2], [6], [Cao],
    [T10], [Đồng bộ cloud không bảo mật], [2], [2], [4], [Trung Bình],
    [T11], [Rò rỉ qua cloud backup], [2], [2], [4], [Trung Bình],
    [T12], [App chỉnh sửa ảnh độc hại], [2], [2], [4], [Trung Bình],
    [T13], [Đánh cắp tin nhắn], [1], [3], [3], [Trung Bình],
    [T14], [Phần mềm gián điệp], [1], [3], [3], [Trung Bình],
  ),
  caption: "Phân Loại Rủi Ro",
)
```
