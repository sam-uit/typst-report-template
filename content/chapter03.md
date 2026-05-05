# 03 Loại Mã độc Tiêu Biểu Gần Đây

Dưới đây là một số thông tin về 3 loại mã độc (Malware) bao gồm các loại khác nhau (Trojan, Virus, Worm) đang gây ảnh hưởng lớn nhất trong không gian mạng hiện nay.

## Trojan: Lumma Stealer (LummaC2)

- **Tên:** Lumma Stealer (còn gọi là LummaC2).
- **Nguồn gốc:**
  - Xuất hiện từ tháng 08/2022.
  - Được phát triển bởi cá nhân có bí danh "Shamel" (Lumma).
  - Vận hành theo mô hình Mã độc như một dịch vụ (Malware as a Service - MaaS) trên các diễn đàn tiếng Nga và Telegram.
- **Đặc điểm:**
  - Viết bằng ngôn ngữ C và ASM. nhẹ và nhanh.
  - Sử dụng kỹ thuật:
    - "ClickFix" (lừa người dùng copy-paste lệnh vào cửa sổ Run thông qua CAPTCHA giả).
    - "EtherHiding" (lưu trữ mã độc trên blockchain Binance Smart Chain) để lẩn tránh các hệ thống phòng thủ.
- **Phương thức phá hoại:**
  - Đánh cắp thông tin trình duyệt (mật khẩu, cookie phiên), ví tiền điện tử (MetaMask, Electrum) và cấu hình VPN.
  - Sử dụng kỹ thuật *process hollowing* để tiêm mã độc vào các tiến trình Windows hợp lệ như `explorer.exe` hoặc `msbuild.exe` để hoạt động ngầm.
- **Biện pháp phòng chống:**
  - Triển khai giải pháp *EDR* để phát hiện hành vi thực thi không tệp (*fileless*).
  - Đào tạo người dùng nhận biết kỹ thuật thao túng tâm lý CAPTCHA giả.
  - Thực hiện nguyên tắc đặc quyền tối thiểu (Least Privilege).
- **Nguồn tham khảo:**
  - Báo cáo từ Microsoft Digital Defense (2025)

## Virus: Sality (Biến thể Đa hình 2024-2025)

- **Tên:** Virus Sality.
- **Nguồn gốc:**
  - Là dòng virus lâu đời (xuất hiện từ 2003).
  - Đã ghi nhận sự bùng phát mạnh mẽ trở lại trong năm 2024 và đầu năm 2025 với hạ tầng điều khiển (C2) được nâng cấp.
- **Đặc điểm:**
  - Thuộc loại virus lây nhiễm tệp (*file infector*) đa hình (*polymorphic*) cực kỳ tinh vi.
  - Mã nguồn của nó liên tục thay đổi sau mỗi lần lây nhiễm để vượt qua các phần mềm diệt virus dựa trên chữ ký tĩnh.
- **Phương thức phá hoại:**
  - Tự động chèn mã độc vào các tệp thực thi `.exe` và `.dll` trên toàn bộ hệ thống.
  - Vô hiệu hóa Windows Defender, tường lửa và các công cụ bảo mật.
  - Biến máy tính nạn nhân thành một phần của botnet để đào tiền ảo hoặc phát tán thư rác.
- **Biện pháp phòng chống:**
  - Sử dụng phần mềm diệt virus dựa trên phân tích hành vi (*Behavior-based*) thay vì chỉ dựa vào chữ ký.
  - Quét hệ thống định kỳ bằng các công cụ chuyên dụng có khả năng khử nhiễm (*disinfection*) tệp tin và bảo vệ tính toàn vẹn của hệ thống.
- **Nguồn tham khảo:**
  - Báo cáo xu hướng mã độc H1 2025 của *Recorded Future (Insikt Group)*.
  - Phân tích kỹ thuật từ *MITRE ATT&CK*.

## Worm: Morris II (Sâu AI)

- **Tên:** Morris II.
- **Nguồn gốc:**
  - Được công bố vào đầu năm 2024 bởi nhóm nghiên cứu từ *Cornell Tech*, *Technion* và *Intuit* như một minh chứng về lỗ hổng của các hệ thống AI hiện đại.
- **Đặc điểm:**
  - Sâu máy tính "không nhấp chuột" (*zero-click*) đầu tiên nhắm vào các hệ sinh thái Trí Tuệ Nhân Tạo Tạo Sinh (GenAI) như GPT-4 và Gemini.
  - Nó sử dụng các "câu lệnh tự sao chép đối nghịch" (*Adversarial Self-Replicating Prompts*) để thao túng phản hồi của AI.
- **Phương thức phá hoại:**
  - Thông qua việc thao túng phản hồi của các tác nhân AI.
  - Khi trợ lý email AI xử lý một thông điệp nhiễm sâu, nó bị buộc phải trích xuất dữ liệu nhạy cảm (PII - Personal Identity Information, số thẻ tín dụng).
  - Và tự động tạo ra các email mới chứa chính mã độc của sâu để gửi đến các người dùng khác.
  - Tạo ra chuỗi lây nhiễm bùng nổ trong mạng lưới AI.
- **Biện pháp phòng chống:**
  - Thực hiện kiểm tra tính hợp lệ của dữ liệu đầu vào/đầu ra (*Input/Output validation*).
  - Cách ly các tác nhân AI (*AI agents*) trong môi trường riêng biệt (*Segmentation*);
  - Và áp dụng xác thực API nghiêm ngặt cùng giám sát bất thường về tần suất truy vấn.
- **Nguồn tham khảo:**
  - Nghiên cứu từ Cornell Tech, IBM Think Insights, SentinelOne và arXiv (2024-2025).
