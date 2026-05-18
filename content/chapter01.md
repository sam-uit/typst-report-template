# TIẾT 1. KHẢO SÁT WI-FI & NHẬN DIỆN NGUY CƠ

## Bài 1. Quét Và Liệt Kê Wi-Fi Xung Quanh

- Bước 1: Mở Command Prompt
- Bước 2: Chạy lệnh `netsh wlan show networks mode=bssid`
- Bước 3: Quan sát và chụp màn hình các thông tin:
  - SSID
  - Authentication
  - Encryption
  - Signal
- Bước 4: Hoàn thành bảng sau (ít nhất 8 mạng, nếu không đủ thì ghi rõ lý do):

| STT | SSID | Authentication | Encryption | Signal | Đánh giá |
|-----|------|----------------|------------|--------|----------|
| 1   |      |                |            |        |          |
| 2   |      |                |            |        |          |
| 3   |      |                |            |        |          |
| 4   |      |                |            |        |          |
| 5   |      |                |            |        |          |
| 6   |      |                |            |        |          |
| 7   |      |                |            |        |          |
| 8   |      |                |            |        |          |

Gợi ý đánh giá:

- Open / None → Không an toàn
- WPA2-PSK (AES) → Tốt
- WPA3 → Rất tốt

### Liệt Kê Wi-Fi Xung Quanh

Do đang sử dụng macOS trên Apple Silicon, và không có khả năng triển khai các Windows VM có hỗ trợ wifi, và hiện cũng không mượn được máy Windows, vì vậy sinh viên xin phép sử dụng ứng dụng WIFI Explore Pro (có trên App Store) để thực hiện bài thực hành này.

Danh sách các mạng Wi-Fi xung quanh khu vực sinh viên học tập:

- SSID ở đây được gọi là Network Name.
- Tất cả các WIFI đều sử dụng một chế độ bảo mật cụ thể.
- Luôn yêu cầu xác thực (không có mạng mở free-wifi).
- Tín hiệu khá tốt ở hầu hết các WIFI (trên 50%).

![Bài 1. Danh Sách Wi-Fi Tìm Thấy](assets/01-01-wifi-list.png)

### Bảng Liệt Kê Và Đánh Giá

- Encryption cho biết rõ là CCMP bao nhiêu bit.
- Signal hiển thị ở dạng số nguyên, giá trị càng lớn, wifi càng mạnh.

<!-- | STT  | SSID                | Authentication      | Encryption         | Signal (dBm) | Đánh Giá |
| ---- | ------------------- | ------------------- | ------------------ | ------------ | -------- |
| 1    | \@Ruijie-b56D2      | WPA/WPA2 (PSK)      | CCMP-128           | -70          | Tốt      |
| 2    | Appalasami Family   | WPA2 (PSK)          | CCMP-128           | -71          | Tốt      |
| 3    | appalasami-TIME5Ghz | WPA2 (PSK)          | CCMP-128           | -73          | Tốt      |
| 4    | Charlesmanor        | WPA/WPA2 (PSK)      | TKIP               | -71          | Tốt      |
| 5    | dato\_salim\_2.4G   | WPA/WPA2 (PSK)      | TKIP               | -69          | Tốt      |
| 6    | Hash                | WPA2/WPA3 (PSK/SAE) | CCMP-128           | -64          | Rất Tốt  |
| 7    | Hecoo               | WPA2/WPA3 (PSK/SAE) | CCMP-128           | -63          | Rất Tốt  |
| 8    | jhsw1965 5G         | WPA2 (PSK)          | CCMP-128           | -71          | Tốt      |
| 9    | JustinTmj           | WPA/WPA2 (PSK)      | CCMP-128           | -74          | Tốt      |
| 10   | Perlla              | WPA2/WPA3 (PSK/SAE) | CCMP-128           | -87          | Rất Tốt  |
| 11   | r33_5G              | WPA2 (PSK)          | CCMP-128           | -70          | Tốt      |
| 12   | Rog_SpgC47          | WPA2 (PSK)          | CCMP-128           | -46          | Tốt      | -->

```{=typst}
#show table.cell: set text(size: 0.8em)
#figure(
  table(
    columns: (5%, 25%, 30%, 14%, 15%, 12%),
    align: (left, left, left, left, right, left),
    [STT], [SSID], [Authentication], [Encryption], [Signal (dBm)], [Đánh Giá],
    [1], [\@Ruijie-b56D2], [WPA/WPA2 (PSK)], [CCMP-128], [\-70], [Tốt],
    [2], [Appalasami Family], [WPA2 (PSK)], [CCMP-128], [\-71], [Tốt],
    [3], [appalasami-TIME5Ghz], [WPA2 (PSK)], [CCMP-128], [\-73], [Tốt],
    [4], [Charlesmanor], [WPA/WPA2 (PSK)], [TKIP], [\-71], [Tốt],
    [5], [dato\_salim\_2.4G], [WPA/WPA2 (PSK)], [TKIP], [\-69], [Tốt],
    [6], [Hash], [WPA2/WPA3 (PSK/SAE)], [CCMP-128], [\-64], [Rất Tốt],
    [7], [Hecoo], [WPA2/WPA3 (PSK/SAE)], [CCMP-128], [\-63], [Rất Tốt],
    [8], [jhsw1965 5G], [WPA2 (PSK)], [CCMP-128], [\-71], [Tốt],
    [9], [JustinTmj], [WPA/WPA2 (PSK)], [CCMP-128], [\-74], [Tốt],
    [10], [Perlla], [WPA2/WPA3 (PSK/SAE)], [CCMP-128], [\-87], [Rất Tốt],
    [11], [r33\_5G], [WPA2 (PSK)], [CCMP-128], [\-70], [Tốt],
    [12], [Rog\_SpgC47], [WPA2 (PSK)], [CCMP-128], [\-46], [Tốt]
  ),
caption: [Bài 1. Bảng Liệt Kê Và Đánh Giá WIFI]
)
```
