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

![Bài 1. Danh sách Wi-Fi xung quanh](assets/01-01-wifi-list.png)
