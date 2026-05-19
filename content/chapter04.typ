#import "../template/lib.typ": *

= PHẦN 4 — ĐÁNH GIÁ RỦI RO (RISK ASSESSMENT)
<phan-4-danh-gia-rui-ro>


== Bước 5 & 6 — Ma Trận Đánh Giá Rủi Ro
<buoc-5-6-ma-tran-danh-gia>

Mỗi mối đe dọa được đánh giá theo thang điểm:

- *Khả năng xảy ra (Likelihood)*: Thấp (1) / Trung Bình (2) / Cao (3)
- *Mức độ ảnh hưởng (Impact)*: Thấp (1) / Trung Bình (2) / Cao (3)
- *Mức độ rủi ro (Risk Level)* = Likelihood × Impact

== Bước 7 — Phân Loại Rủi Ro
<buoc-7-phan-loai-rui-ro>

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  co-succ(title: "Thấp (1–2)")[Rủi ro có thể chấp nhận, theo dõi định kỳ.],
  co-warn(title: "Trung Bình (3–4)")[Cần có biện pháp xử lý trong thời gian sớm.],
  co-erro(title: "Cao (6–9)")[Ưu tiên xử lý ngay, không chấp nhận được.],
)

#show table.cell: set text(size: 0.82em)
#figure(
  table(
    columns: (5%, 22%, 28%, 7%, 7%, 9%, 22%),
    align: (center, left, left, center, center, center, center),
    table.header(
      [*Mã*], [*Tài Sản*], [*Mối Đe Dọa*], [*L*], [*I*], [*Risk*], [*Phân Loại*],
    ),
    // TS1
    [T1], [TS1 -- Mạng xã hội], [Account Hijacking],            [2], [3], [6], [#text(fill: red)[*Cao*]],
    [T2], [TS1 -- Mạng xã hội], [Lộ thông tin qua privacy sai], [3], [2], [6], [#text(fill: red)[*Cao*]],
    [T3], [TS1 -- Mạng xã hội], [Cài đặt Fake App],             [2], [3], [6], [#text(fill: red)[*Cao*]],
    // TS2
    [T4], [TS2 -- Ngân hàng/Ví], [Phishing / Smishing],          [3], [3], [*9*], [#text(fill: red)[*Cao*]],
    [T5], [TS2 -- Ngân hàng/Ví], [SIM Swapping],                 [1], [3], [3], [#text(fill: orange)[Trung Bình]],
    [T6], [TS2 -- Ngân hàng/Ví], [Trojan trên điện thoại],       [2], [3], [6], [#text(fill: red)[*Cao*]],
    // TS3
    [T7], [TS3 -- Email],        [Credential Stuffing],           [2], [3], [6], [#text(fill: red)[*Cao*]],
    [T8], [TS3 -- Email],        [Truy cập thiết bị bị mất],     [2], [3], [6], [#text(fill: red)[*Cao*]],
    // TS4
    [T9],  [TS4 -- Danh bạ], [App yêu cầu quyền danh bạ],        [3], [2], [6], [#text(fill: red)[*Cao*]],
    [T10], [TS4 -- Danh bạ], [Đồng bộ cloud không bảo mật],      [2], [2], [4], [#text(fill: orange)[Trung Bình]],
    // TS5
    [T11], [TS5 -- Ảnh/Video], [Rò rỉ qua cloud backup],         [2], [2], [4], [#text(fill: orange)[Trung Bình]],
    [T12], [TS5 -- Ảnh/Video], [App chỉnh sửa ảnh độc hại],      [2], [2], [4], [#text(fill: orange)[Trung Bình]],
    // TS6
    [T13], [TS6 -- Lịch sử chat], [SMS Interception],             [1], [3], [3], [#text(fill: orange)[Trung Bình]],
    [T14], [TS6 -- Lịch sử chat], [Spyware],                      [1], [3], [3], [#text(fill: orange)[Trung Bình]],
  ),
  caption: [Bảng 4 — Ma Trận Đánh Giá Rủi Ro \ _(L = Likelihood, I = Impact)_],
)

== Lý Giải Điểm Số
<ly-giai-diem-so>

*Likelihood -- Khả năng xảy ra:*

- Điểm 3 (Cao): T2, T4, T9 -- xảy ra thường xuyên. T2 vì cài đặt mặc định "công khai" của hầu hết nền tảng; T4 vì smishing rất phổ biến ở Việt Nam; T9 vì người dùng thường bấm "Cho phép" mà không đọc kỹ.
- Điểm 2 (Trung Bình): Đa số các mối đe dọa còn lại -- cần một số điều kiện nhất định.
- Điểm 1 (Thấp): T5, T13, T14 -- đòi hỏi kẻ tấn công có năng lực kỹ thuật cao hoặc cần tiếp xúc vật lý với thiết bị.

*Impact -- Mức độ ảnh hưởng:*

- Điểm 3 (Cao): Các mối đe dọa nhắm vào TS1, TS2, TS3 -- gây mất tài sản tài chính, chiếm danh tính hoặc mất quyền kiểm soát hàng loạt tài khoản.
- Điểm 2 (Trung Bình): Các mối đe dọa nhắm vào TS4 và TS5 -- gây rò rỉ quyền riêng tư nhưng không dẫn đến thiệt hại tài chính trực tiếp.

== Nhận Xét Tổng Hợp
<nhan-xet-tong-hop-p4>

Trong 14 rủi ro được đánh giá: *8 rủi ro Cao* và *6 rủi ro Trung Bình*. Không có rủi ro nào ở
mức Thấp -- phản ánh thực tế rằng điện thoại thông minh là mục tiêu tấn công hấp dẫn vì tập
trung nhiều loại tài sản có giá trị trong một thiết bị duy nhất.

#co-warn[Rủi ro T4 (Phishing / Smishing) đạt mức cao nhất (9/9) và cần được ưu tiên xử lý ngay.]
