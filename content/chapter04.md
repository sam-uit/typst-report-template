# PHẦN 4 — ĐÁNH GIÁ RỦI RO (RISK ASSESSMENT)

## Bước 5 & 6 — Ma Trận Đánh Giá Rủi Ro

Mỗi mối đe dọa được đánh giá theo thang điểm:

- **Khả năng xảy ra (Likelihood)**: Thấp (1) / Trung Bình (2) / Cao (3)
- **Mức độ ảnh hưởng (Impact)**: Thấp (1) / Trung Bình (2) / Cao (3)
- **Mức độ rủi ro (Risk Level)** = Likelihood × Impact

## Bước 7 — Phân Loại Rủi Ro

- Risk Level 1–2: **Thấp**
- Risk Level 3–4: **Trung Bình**
- Risk Level 6–9: **Cao**

<!-- Bảng 4 -->

| Mã | Tài Sản | Mối Đe Dọa | L | I | Risk | Phân Loại |
|----|---------|-----------|---|---|------|-----------|
| T1 | TS1 – Mạng xã hội | Account Hijacking | 2 | 3 | 6 | Cao |
| T2 | TS1 – Mạng xã hội | Lộ thông tin qua privacy sai | 3 | 2 | 6 | Cao |
| T3 | TS1 – Mạng xã hội | Cài đặt Fake App | 2 | 3 | 6 | Cao |
| T4 | TS2 – Ngân hàng/Ví | Phishing / Smishing | 3 | 3 | 9 | Cao |
| T5 | TS2 – Ngân hàng/Ví | SIM Swapping | 1 | 3 | 3 | Trung Bình |
| T6 | TS2 – Ngân hàng/Ví | Trojan trên điện thoại | 2 | 3 | 6 | Cao |
| T7 | TS3 – Email | Credential Stuffing | 2 | 3 | 6 | Cao |
| T8 | TS3 – Email | Truy cập thiết bị bị mất | 2 | 3 | 6 | Cao |
| T9 | TS4 – Danh bạ | App yêu cầu quyền danh bạ | 3 | 2 | 6 | Cao |
| T10 | TS4 – Danh bạ | Đồng bộ cloud không bảo mật | 2 | 2 | 4 | Trung Bình |
| T11 | TS5 – Ảnh/Video | Rò rỉ qua cloud backup | 2 | 2 | 4 | Trung Bình |
| T12 | TS5 – Ảnh/Video | App chỉnh sửa ảnh độc hại | 2 | 2 | 4 | Trung Bình |
| T13 | TS6 – Lịch sử chat | SMS Interception | 1 | 3 | 3 | Trung Bình |
| T14 | TS6 – Lịch sử chat | Spyware | 1 | 3 | 3 | Trung Bình |

## Lý Giải Điểm Số

**Likelihood — Khả năng xảy ra:**

- Điểm 3 (Cao): T2, T4, T9 — xảy ra thường xuyên trong thực tế; T2 do cài đặt mặc định "công khai"
  của hầu hết nền tảng; T4 vì lừa đảo smishing cực kỳ phổ biến ở Việt Nam; T9 vì người dùng
  thường bấm "Cho phép" mà không đọc.
- Điểm 2 (Trung Bình): Đa số các mối đe dọa còn lại — cần một số điều kiện nhất định.
- Điểm 1 (Thấp): T5, T13, T14 — đòi hỏi kẻ tấn công có năng lực kỹ thuật cao (SIM Swapping,
  IMSI Catcher) hoặc cần tiếp xúc vật lý (Spyware cài trực tiếp).

**Impact — Mức độ ảnh hưởng:**

- Điểm 3 (Cao): Tất cả mối đe dọa nhắm vào TS1, TS2, TS3 — gây mất tài sản tài chính, chiếm
  danh tính hoặc mất quyền kiểm soát hàng loạt tài khoản khác.
- Điểm 2 (Trung Bình): Các mối đe dọa nhắm vào TS4 và TS5 — gây rò rỉ quyền riêng tư nhưng
  không dẫn đến thiệt hại tài chính trực tiếp.

## Nhận Xét Tổng Hợp

Trong 14 rủi ro được đánh giá: **8 rủi ro Cao** và **6 rủi ro Trung Bình**. Không có rủi ro
nào ở mức Thấp — phản ánh thực tế rằng điện thoại thông minh là mục tiêu tấn công
hấp dẫn do tập trung nhiều loại tài sản có giá trị. Rủi ro T4 (Phishing/Smishing) đạt
mức cao nhất (9/9), cần được ưu tiên xử lý trước tiên trong Phần 5.
