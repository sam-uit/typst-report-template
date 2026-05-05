# 3 Loại Mã Độc Mới Nhất

## 1. Trojan: Grandoreiro (Banking Trojan)

* **Nguồn tham khảo (Source of truth):** Báo cáo tình báo mối đe dọa (Threat Intelligence Report) từ **Kaspersky Securelist** và Cơ quan An ninh Mạng và Cơ sở Hạ tầng Mỹ (**CISA**). Các báo cáo này phân tích chi tiết cách Grandoreiro lây nhiễm, cấu trúc kỹ thuật và chiến dịch mở rộng toàn cầu của nó.
* **Đường link tham chiếu:** 
  * [Kaspersky Securelist - Grandoreiro technical analysis](https://securelist.com/grandoreiro-we-know-what-you-did-last-summer/112028/)
  * [CISA Cybersecurity Advisory - Grandoreiro Banking Trojan](https://www.cisa.gov/news-events/cybersecurity-advisories/aa24-061a)

### Nguồn Gốc

Xuất phát từ khu vực Nam Mỹ (đặc biệt là Brazil), hoạt động mạnh mẽ và mở rộng nhắm mục tiêu vào hàng chục quốc gia trên thế giới trong giai đoạn 2023-2024 (liên kết với các nhóm tội phạm tài chính).

### Đặc Điểm

Là một loại Trojan ngân hàng (Banking Trojan) được phát tán chủ yếu qua các chiến dịch Phishing email có đính kèm file nén chứa mã độc ngụy trang dưới dạng hóa đơn, chứng từ.

### Phương Thức Phá Hoại

Khi lây nhiễm, nó sẽ âm thầm chạy nền, theo dõi các thao tác trên trình duyệt. Khi người dùng truy cập trang web ngân hàng, nó sẽ hiển thị màn hình đăng nhập giả mạo (overlay) để đánh cắp tên đăng nhập, mật khẩu, và thậm chí lấy cắp cả mã OTP. Kẻ tấn công còn có thể chiếm quyền điều khiển chuột/bàn phím từ xa để tự thực hiện các lệnh chuyển tiền.

### Biện Pháp Phòng Chống

Trang bị bộ lọc email chống thư rác/lừa đảo mạnh mẽ. Sử dụng xác thực sinh trắc học hoặc phần cứng bảo mật cho tài khoản ngân hàng. Giám sát hành vi tiến trình bằng EDR để phát hiện các tiến trình lạ cố gắng đọc bộ nhớ trình duyệt.

## 2. Worm: Raspberry Robin

* **Nguồn tham khảo (Source of truth):** Báo cáo gốc từ hãng bảo mật **Red Canary** (đơn vị đầu tiên phát hiện ra loại Worm này vào năm 2021) và phân tích hành vi lây lan qua USB từ **Microsoft Threat Intelligence**.
* **Đường link tham chiếu:**
  * [Red Canary - Raspberry Robin: Highly evasive worm spreads through USB drives](https://redcanary.com/blog/raspberry-robin/)
  * [Microsoft Security Blog - Raspberry Robin worm part of larger ecosystem](https://www.microsoft.com/en-us/security/blog/2022/10/27/raspberry-robin-worm-part-of-larger-threat-ecosystem/)

### Nguồn Gốc

Lần đầu tiên được hãng bảo mật Red Canary phát hiện vào cuối năm 2021 và liên tục tiến hóa, bùng nổ lây nhiễm trong mạng lưới các doanh nghiệp và tổ chức lớn trên toàn cầu.

### Đặc Điểm

Hoạt động như một con giun (Worm) với phương thức lây lan cổ điển nhưng rất hiệu quả: sử dụng ổ đĩa USB (removable drives).

### Phương Thức Phá Hoại

Khi USB bị nhiễm cắm vào máy tính, nó lợi dụng tính năng AutoRun (nếu bật) hoặc lừa người dùng nhấp vào file shortcut. Đặc biệt, nó sử dụng công cụ Windows Installer (`msiexec.exe`) hợp pháp của hệ điều hành để tải xuống và thực thi mã độc từ máy chủ C2, nhằm qua mặt phần mềm Antivirus. Mục tiêu chính là mở cửa hậu (backdoor) tạo tiền đề cài cắm mã độc tống tiền (Ransomware) vào mạng nội bộ.

### Biện Pháp Phòng Chống

Vô hiệu hóa triệt để tính năng AutoRun/AutoPlay cho tất cả các thiết bị lưu trữ ngoài. Áp dụng chính sách kiểm soát thiết bị ngoại vi (Device Control). Đưa `msiexec.exe` vào danh sách giám sát đặc biệt trên hệ thống SIEM/EDR để bắt các tham số dòng lệnh kết nối ra internet.

## 3. Virus: Ramnit (Biến thể File Infector)

* **Nguồn tham khảo (Source of truth):** Bách khoa toàn thư về mối đe dọa của **Trend Micro** và cơ sở dữ liệu mã độc **Malpedia** (của Viện Fraunhofer FKIE). Các tài nguyên này mô tả kỹ thuật đa hình và cách Ramnit lây nhiễm chéo vào các file .exe, .dll và .html.
* **Đường link tham chiếu:**
  * [Malpedia - Win.Ramnit Family Details](https://malpedia.caad.fkie.fraunhofer.ch/details/win.ramnit)
  * [Trend Micro Threat Encyclopedia - Ramnit File Infector](https://www.trendmicro.com/vinfo/us/threat-encyclopedia/malware/ramnit/)


### Nguồn Gốc

Ramnit ra đời từ năm 2010, nhưng liên tục được các băng nhóm tội phạm cập nhật kiến trúc để tạo ra các biến thể mới phức tạp và vẫn là một trong những malware lây nhiễm file phổ biến hiện nay.

### Đặc Điểm

Là một virus lây nhiễm file đa hình (Polymorphic File Infector). Nó chèn trực tiếp mã độc của mình vào các tập tin thực thi (như `.exe`, `.dll`) và các tập tin web (như `.html`, `.htm`).

### Phương Thức Phá Hoại

Mỗi khi người dùng mở một tập tin đã bị lây nhiễm, đoạn mã virus sẽ tự động chạy trước, âm thầm chép bản thân nó vào bộ nhớ rồi tìm các file sạch khác trên ổ cứng để lây lan tiếp. Không chỉ phá hỏng cấu trúc tập tin, biến thể mới của Ramnit còn đánh cắp cookie duyệt web, mật khẩu FTP, và mở port cho phép tin tặc truy cập từ xa.

### Biện Pháp Phòng Chống

Quét toàn bộ hệ thống với phần mềm Antivirus có khả năng bóc tách mã độc khỏi file lây nhiễm (disinfect). Thường xuyên kiểm tra hàm băm (hash) và chữ ký số của các ứng dụng tải về. Không sử dụng các bộ cài đặt phần mềm lậu bị chia sẻ trôi nổi trên mạng.
